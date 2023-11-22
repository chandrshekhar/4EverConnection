import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var searchController = TextEditingController().obs;
  RxString selectedString = "".obs;

  RxBool markAll = false.obs;
  RxBool singleSelected = false.obs;
  RxBool isLoading = false.obs;
  RxList<Contact> contacts = <Contact>[].obs;
  RxList<Contact> seachedContactList = <Contact>[].obs;
  setDropdownText(String value) {
    selectedString.value = value;
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
