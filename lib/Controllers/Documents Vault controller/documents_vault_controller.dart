import 'package:get/get.dart';

import '../../Models/user_profile_model.dart';
import '../User Profile Controller/user_profile_controller.dart';

class DocumentsVaultController extends GetxController {
  RxBool isLoadingDocument = false.obs;
  RxList<VaultDocumentData> documentValultDataList = <VaultDocumentData>[].obs;
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
    super.onInit();
  }
}
