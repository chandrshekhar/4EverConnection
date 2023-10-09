import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSnapshotController extends GetxController {
  var firstNameController = TextEditingController().obs;
  var middleNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var companyNameController = TextEditingController().obs;
  var occupationController = TextEditingController().obs;
  var idealOccupationController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var homePhoneController = TextEditingController().obs;
  var businessPhoneController = TextEditingController().obs;
  var businessFaxController = TextEditingController().obs;
  var homeAddressController = TextEditingController().obs;
  var homeAptSteController = TextEditingController().obs;
  var homeZipController = TextEditingController().obs;
  var businessAddressController = TextEditingController().obs;
  var businessAptStecontroller = TextEditingController().obs;
  var businessZipController = TextEditingController().obs;
  var spouseController = TextEditingController().obs;
  var spouseLifePartnerPhoneController = TextEditingController().obs;
  var personalEmailController = TextEditingController().obs;
  var businessEmailController = TextEditingController().obs;
  var websiteUrlController = TextEditingController().obs;

  RxString radioGroup = "Yes".obs;

  void languagePreference(String selectedvalue) {
    radioGroup.value = selectedvalue;
  }
}
