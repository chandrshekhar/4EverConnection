import 'package:flutter/material.dart';
import 'package:forever_connection/Model/User/user_personal_data_model.dart';
import 'package:forever_connection/Services/Profile/user_profile_service.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';

class PersonalDetailsController extends GetxController {
  var firstNameController = TextEditingController().obs;
  var middleNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var companyNameController = TextEditingController().obs;
  var positionController = TextEditingController().obs;
  var occupationController = TextEditingController().obs;
  var idealoccupationController = TextEditingController().obs;
  var mobilePhoneController = TextEditingController().obs;
  var homePhoneController = TextEditingController().obs;
  var businessFaxController = TextEditingController().obs;

  var homeAddressController = TextEditingController().obs;
  var aptSteController = TextEditingController().obs;
  var homeZipcodeController = TextEditingController().obs;
  var homeAptSteController = TextEditingController().obs;
  var zipController = TextEditingController().obs;
  var businessAddress = TextEditingController().obs;
  var businessZipController = TextEditingController().obs;
  var businessAptSteController = TextEditingController().obs;
  var spouseController = TextEditingController().obs;
  var spousePhoneController = TextEditingController().obs;
  var personalEmailController = TextEditingController().obs;
  var businessEmailController = TextEditingController().obs;
  var websiteController = TextEditingController().obs;
  //-------snapshot
  var dobControlle = TextEditingController().obs;
  var sociealsecurityController = TextEditingController().obs;
  var countruyofbirthControlle = TextEditingController().obs;
  var countryOfCitizenshipControlle = TextEditingController().obs;

  // final userPersonal = Get.put(UserProfileController());

  UserProfileService userProfileService = UserProfileService();

  RxString radioGroup = "Male".obs;
  RxString radioGroupLanguage = "Yes".obs;
  RxBool isLoadingPersonalData = false.obs;
  Rx<UserPersonalModel> userProfilePersonalModel = UserPersonalModel().obs;

  void selectGender(String selectedvalue) {
    radioGroup.value = selectedvalue;
  }

  void selectLanguage(String selectedValue) {
    radioGroupLanguage.value = selectedValue;
  }

  getUserPersonalData() async {
    try {
      isLoadingPersonalData(true);
      var jsonValue = await userProfileService
          .getUserProfileDetails(ApiPath.personaUserData);

      userProfilePersonalModel.value = UserPersonalModel.fromJson(jsonValue);
      initialPersonalDetailsData();
      isLoadingPersonalData(false);
    } catch (e) {
      isLoadingPersonalData(false);
      ToastWidget.errorToast(error: e.toString());
    }
  }

  void initialPersonalDetailsData() {
    var userData = userProfilePersonalModel.value;
    firstNameController.value.text = userData.firstName ?? "";
    lastNameController.value.text = userData.lastName ?? "";
    middleNameController.value.text = userData.middleName ?? "";
    companyNameController.value.text = "";
    homePhoneController.value.text = userData.homePhone ?? "";
    personalEmailController.value.text = userData.personalEmail ?? "";
    mobilePhoneController.value.text = userData.mobilePhone ?? "";
    homeAddressController.value.text = userData.homeAddress ?? "";
    aptSteController.value.text = userData.homeApt ?? "";
    zipController.value.text = userData.homeZip ?? "";
    dobControlle.value.text = userData.dateOfBirth ?? "";
    sociealsecurityController.value.text = userData.socialSecurityNumber ?? "";
    countruyofbirthControlle.value.text = userData.countryOfBirth ?? "";
    countryOfCitizenshipControlle.value.text =
        userData.countryOfCitizenship ?? "";
    spouseController.value.text = userData.lifePartnerName ?? "";
    spousePhoneController.value.text = userData.lifePartnerPhone ?? "";
  }
}
