import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../User Profile Controller/user_profile_controller.dart';

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

  // user personal data is the snapshot of the user
  final userPersonal =
      Get.find<UserProfileController>().userProfileModel.value.personalData;

  getSnapshotData() {
    firstNameController.value.text = userPersonal!.firstName ?? "";
    middleNameController.value.text = userPersonal!.middleName ?? "";
    lastNameController.value.text = userPersonal!.lastName ?? "";
    occupationController.value.text = "";
    idealOccupationController.value.text = "";
    phoneNumberController.value.text = userPersonal!.mobilePhone ?? "";
    spouseController.value.text = "";
    homeAddressController.value.text = userPersonal!.homeAddress ?? "";
    homeZipController.value.text = userPersonal!.homeZip ?? "";
    personalEmailController.value.text = userPersonal!.personalEmail ?? "";

    languagePreference(userPersonal!.preferredLanguage ?? "");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getSnapshotData();
    super.onInit();
  }
}
