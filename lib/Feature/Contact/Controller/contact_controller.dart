import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Contact/Controller/add_contact_controller.dart';
import 'package:forever_connection/Services/Profile/user_profile_service.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class ContactController extends GetxController {
  var searchController = TextEditingController().obs;
  RxString selectedString = "".obs;

  RxBool markAll = false.obs;
  RxBool singleSelected = false.obs;
  RxBool isLoading = false.obs;
  RxList<Contact> contacts = <Contact>[].obs;
  RxList<Contact> seachedContactList = <Contact>[].obs;
  RxList<Contact> selectedContactList = <Contact>[].obs;
  final addContactController = Get.put(AddContactController());
  setDropdownText(String value) {
    selectedString.value = value;
  }

  RxBool isUploadingContacts = false.obs;
  UserProfileService userProfileService = UserProfileService();

  RxBool anySelected = false.obs;

  Future uploadContacts() async {
    try {
      Get.defaultDialog(
          titlePadding: EdgeInsets.zero,
          title: "",
          contentPadding: EdgeInsets.only(left: 30.w, bottom: 20.h),
          content: Row(
            children: [
              const CircularProgressIndicator(),
              SizedBox(
                width: 10.w,
              ),
              const Text(" Please wait"),
            ],
          ),
          middleText: "Please wait..",
          barrierDismissible: false);
      isUploadingContacts(true);
      if (markAll.value) {
        bool response = false;
        File? file;
        for (int i = 0; i < contacts.length; i++) {
          if (contacts[i].photo != null) {
            file = await saveUint8ListAsTempFile(
                contacts[i].photo!, "temp_img$i.jpg");
          }
          response = await uploadContactsHelper(contacts[i], file);
          if (!response) {
            Get.back();
            isUploadingContacts(false);
            return;
          } else {
            log("uploaded contact number $i successfully.");
          }
        }
        Get.back();
        ToastWidget.successToast(success: "Contacts uploaded successfully");

        addContactController.getContactList();
      } else {
        bool response;
        File? file;
        for (int i = 0; i < selectedContactList.length; i++) {
          if (contacts[i].photo != null) {
            file = await saveUint8ListAsTempFile(
                contacts[i].photo!, "temp_img$i.jpg");
          }
          response = await uploadContactsHelper(selectedContactList[i], file);
          if (!response) {
            isUploadingContacts(false);
            Get.back();
            return;
          } else {
            log("uploaded contact number $i successfully.");
          }
        }
        Get.back();

        ToastWidget.successToast(success: "Contacts uploaded successfully");
      }

      isUploadingContacts(false);
    } catch (e) {
      Get.back();
      ToastWidget.errorToast(error: "Something went wrong!");
    }
  }

  Future<bool> uploadContactsHelper(Contact contact, File? file) async {
    try {
      Map<String, dynamic> requestModel = {
        "first_name": contact.name.first.isNotEmpty ? contact.name.first : "NA",
        "last_name": contact.name.last.isNotEmpty ? contact.name.last : "NA",
        "mobile_phone": contact.phones[0].number.toString(),
        
        "additional_json": jsonEncode(contact),
      };
      log("Contact ${jsonEncode(contact)}");
      log("request model is $requestModel");
      await userProfileService
          .uploadContacts(requestModel, file)
          .then((value) async {
        await addContactController.getContactList(search: "");
        contact.insert();
      });
      return true;
    } catch (e) {
      log("Error is ${e.toString()}");
      return false;
    }
  }

  Future<File> saveUint8ListAsTempFile(
      Uint8List uint8List, String fileName) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    File tempFile = File('$tempPath/$fileName');
    await tempFile.writeAsBytes(uint8List);

    return tempFile;
  }

  void getContactFromPhone() async {
    final stopwatch = Stopwatch()..start();

    if (await FlutterContacts.requestPermission()) {
      isLoading(true);
      contacts.value = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
      );
      seachedContactList(contacts.value);
      // log(contacts[0].toString());
      stopwatch.stop();

      log("length of contacts = ${contacts.length} and time taken = ${stopwatch.elapsed}");

      isLoading(false);
    }
  }

  search(String value) {
    seachedContactList.value = contacts.where((p0) {
      return p0.name.first
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase());
    }).toList();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getContactFromPhone();

    super.onInit();
  }
}
