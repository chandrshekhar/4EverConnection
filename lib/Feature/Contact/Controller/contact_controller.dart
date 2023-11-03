import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var searchController = TextEditingController().obs;
  RxString selectedString = "".obs;
  RxBool isLoading = false.obs;
  RxList<Contact> contacts = <Contact>[].obs;
  setDropdownText(String value) {
    selectedString.value = value;
  }

  void getContactFromPhone() async {
    if (await FlutterContacts.requestPermission()) {
      isLoading(true);
      contacts.value = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      log(contacts[0].toString());

      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
