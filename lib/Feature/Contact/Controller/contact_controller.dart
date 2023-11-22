
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:forever_connection/Controllers/User%20Profile%20Controller/user_profile_controller.dart';
import 'package:forever_connection/Services/Profile/user_profile_service.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var searchController = TextEditingController().obs;
  RxString selectedString = "".obs;

  RxBool markAll = false.obs;
  RxBool singleSelected = false.obs;
  RxBool isLoading = false.obs;
  RxList<Contact> contacts = <Contact>[].obs;
  RxList<Contact> seachedContactList = <Contact>[].obs;
  RxList<Contact> selectedContactList = <Contact>[].obs;
  setDropdownText(String value) {
    selectedString.value = value;
  }

  RxBool isUploadingContacts = false.obs;
  UserProfileService userProfileService = UserProfileService();

  uploadContacts() async{
    Get.defaultDialog(title: "Upload in progress.", middleText: "Please wait..",barrierDismissible: false);
    isUploadingContacts(true);
    if(markAll.value){
      bool response = false;
      for(int i =0; i< contacts.length; i++){
        response = await uploadContactsHelper(contacts[i]);
        if(!response){
          isUploadingContacts(false);
          return;
        }
        else{
          log("uploaded contact number $i successfully.");
        }
      }
      ToastWidget.successToast(success: "Contacts uploaded successfully");
    }
    else{
      bool response;
      for(int i =0; i< selectedContactList.length; i++){
        response = await uploadContactsHelper(selectedContactList[i]);
        if(!response){
          isUploadingContacts(false);
          return;
        }
        else{
          log("uploaded contact number $i successfully.");
        }
      }
      ToastWidget.successToast(success: "Contacts uploaded successfully");
    }


    isUploadingContacts(false);
    Get.back();
  }




  Future<bool> uploadContactsHelper(Contact contact) async {
    try {
      
      
      Map<String, dynamic> requestModel = {
        "first_name": contact.name.first,
        "last_name": contact.name.last,
        "mobile_phone":contact.phones[0].number.toString(),
        "additional_json" : jsonEncode(contact),

      };
      // log("request model is $requestModel");
       await userProfileService.uploadContacts(requestModel, contact);
      
      return true;
      
    } catch (e) {
      
      ToastWidget.errorToast(error: e.toString());
      return false;
    }
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
      log(contacts[0].toString());
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
