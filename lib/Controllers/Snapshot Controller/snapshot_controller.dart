import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../User Profile Controller/user_profile_controller.dart';

class UserSnapshotController extends GetxController {
  var firstNameController = TextEditingController().obs;
  var middleNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var companyNameController = TextEditingController().obs;
  var positionController = TextEditingController().obs;
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
  final userPersonal = Get.put(UserProfileController());

  getSnapshotData() {
    firstNameController.value.text =
        userPersonal.userProfileModel.value.personalData!.firstName ?? "";
    middleNameController.value.text =
        userPersonal.userProfileModel.value.personalData!.middleName ?? "";
    lastNameController.value.text =
        userPersonal.userProfileModel.value.personalData!.lastName ?? "";
    occupationController.value.text = userPersonal
            .userProfileModel.value.professionalData!.currentOccupation ??
        "";
    companyNameController.value.text =
        userPersonal.userProfileModel.value.professionalData!.businessName ??
            "";
    positionController.value.text =
        userPersonal.userProfileModel.value.professionalData!.position ?? "";
    idealOccupationController.value.text =
        userPersonal.userProfileModel.value.professionalData!.idealOccupation ??
            "";
    phoneNumberController.value.text =
        userPersonal.userProfileModel.value.personalData!.mobilePhone ?? "";
    homePhoneController.value.text =
        userPersonal.userProfileModel.value.personalData!.homePhone ?? "";
    spouseController.value.text = "";
    homeAddressController.value.text =
        userPersonal.userProfileModel.value.personalData!.homeAddress ?? "";
    homeZipController.value.text =
        userPersonal.userProfileModel.value.personalData!.homeZip ?? "";

    homeAptSteController.value.text =
        userPersonal.userProfileModel.value.personalData?.homeApt ?? "";
    businessPhoneController.value.text =
        userPersonal.userProfileModel.value.professionalData!.businessPhone ??
            "";
    businessFaxController.value.text =
        userPersonal.userProfileModel.value.professionalData!.businessFax ?? "";
    businessAptStecontroller.value.text =
        userPersonal.userProfileModel.value.professionalData!.businessApt ?? "";
    businessAddressController.value.text =
        userPersonal.userProfileModel.value.professionalData!.businessAddress ??
            "";
    businessZipController.value.text =
        userPersonal.userProfileModel.value.professionalData!.businessZip ?? "";
    personalEmailController.value.text =
        userPersonal.userProfileModel.value.personalData!.personalEmail ?? "";
    spouseController.value.text = "";
    // spouseLifePartnerPhoneController.value.text = userPersonal.userProfileModel.value.relationshipData!.first.relationshipType   ?? "";
    websiteUrlController.value.text =
        userPersonal.userProfileModel.value.professionalData!.businessWebsite ??
            "";

    languagePreference(
        userPersonal.userProfileModel.value.personalData!.preferredLanguage ??
            "");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getSnapshotData();
    super.onInit();
  }
}
