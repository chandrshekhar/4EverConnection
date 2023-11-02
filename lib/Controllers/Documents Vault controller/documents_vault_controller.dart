import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forever_connection/Feature/document_vault/Repo/document_repo.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import '../../Feature/document_vault/Model/document_model.dart';
import '../../Models/user_profile_model.dart';
import '../../core/constants/colors.dart';
import '../../core/utils/toast_widget.dart';
import '../User Profile Controller/user_profile_controller.dart';

class DocumentsVaultController extends GetxController {
  RxBool isLoadingDocument = false.obs;
  RxList<VaultDocumentData> documentValultDataList = <VaultDocumentData>[].obs;
  final DocumentRepo _documentRepo = DocumentRepo();
  RxList<DocumentTypeModel> documentTypes = <DocumentTypeModel>[].obs;
  var searchForDocumentController = TextEditingController().obs;
  RxInt documentTypeId = (-1).obs;
  RxString choosenFilename = RxString("");
  final documentDescControler = TextEditingController().obs;
  // RxString files = ''.obs;
  Rx<File?> files = Rx<File?>(null);
  Dio dio = Dio();

  final List<ImagePickerList> chatPickerList = [
    ImagePickerList(
        "File",
        Icon(
          Icons.file_copy,
          color: AppColors.lightBlue,
        )),
    ImagePickerList(
        'Gallery',
        Icon(
          Icons.image,
          color: AppColors.lightBlue,
        )),
    ImagePickerList(
        'Camera',
        Icon(
          Icons.camera_alt_rounded,
          color: AppColors.lightBlue,
        ))
  ];

  setSearchValue(String value) {
    searchForDocumentController.value.text = value;
  }

  setDocumentId(value) {
    documentTypeId.value = value;
  }

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

  addFileDocumentVault() async {
    try {
      await _documentRepo.uploadDocument(
          id: documentTypeId.value,
          desc: documentDescControler.value.text.trim(),
          file: files.value!);
      documentTypeId.value = -1;
      documentDescControler.value.clear();
      files.value = null;
      choosenFilename.value = "";
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
    }
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
      ],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      final fileName = file.path!.split("/").last;
      print(fileName);
      print("FileName--> $fileName");
      choosenFilename.value = fileName;
      files.value = File(file.path!);
    } else {
      // User canceled the picker
    }
  }

  Future pickImageFromGallery() async {
    try {
      final images = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (images != null) {
        final fileName = images.path.split("/").last;
        print("fileName-> $fileName");
        choosenFilename.value = fileName;
        files.value = File(images.path);
      } else {
        print("data is null");
        // User canceled the picker
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        log('Failed to pick image: $e');
      }
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.camera,
          maxHeight: 512,
          maxWidth: 512,
          imageQuality: 75);
      if (image == null) return;
      final imageTemp = File(image.path);
      final fileName = imageTemp.path.split("/").last;
      print("fileName-> $fileName");
      choosenFilename.value = fileName;
      files.value = File(image.path);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        log('Failed to pick image: $e');
      }
    }
  }

  @override
  void onInit() {
    getVaultDocumentData();
    getDocumentType();
    super.onInit();
  }
}

class ImagePickerList {
  final String? title;
  final Widget? icon;

  ImagePickerList(this.title, this.icon);
}
