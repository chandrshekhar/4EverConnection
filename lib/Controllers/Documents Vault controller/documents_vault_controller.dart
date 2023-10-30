import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/document_vault/Repo/document_repo.dart';
import 'package:get/get.dart';

import '../../Feature/document_vault/Model/document_model.dart';
import '../../Models/user_profile_model.dart';
import '../../core/utils/toast_widget.dart';
import '../User Profile Controller/user_profile_controller.dart';

class DocumentsVaultController extends GetxController {
  RxBool isLoadingDocument = false.obs;
  RxList<VaultDocumentData> documentValultDataList = <VaultDocumentData>[].obs;
   DocumentRepo _documentRepo = DocumentRepo();
  RxList<DocumentTypeModel> documentTypes = <DocumentTypeModel>[].obs;
  var searchForDocumentController = TextEditingController().obs;

  getDocumentType() async {
    try {
      var resp = await _documentRepo.getSelectedProfession();
      documentTypes.value = resp;
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
    }
  }

 
  
  final userProfile = Get.find<UserProfileController>()
      .userProfileModel
      .value
      .vaultDocumentData;
  getVaultDocumentData() {
    isLoadingDocument(true);
    for (var element in userProfile!) {
      documentValultDataList.add(element);
    }
    isLoadingDocument(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getVaultDocumentData();
    getDocumentType();
    super.onInit();
  }
}
