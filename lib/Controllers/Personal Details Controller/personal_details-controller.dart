import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../User Profile Controller/user_profile_controller.dart';

class PersonalDetailsController extends GetxController {
  var firstNameController = TextEditingController().obs;
  var middleNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var mobilePhoneController = TextEditingController().obs;
  var homePhoneController = TextEditingController().obs;
  var personalEmailController = TextEditingController().obs;
  var homeAddressController = TextEditingController().obs;
  var aptSteController = TextEditingController().obs;
  var zipController = TextEditingController().obs;
  var dobControlle = TextEditingController().obs;
  var sociealsecurityController = TextEditingController().obs;
  var countruyofbirthControlle = TextEditingController().obs;
  var countryOfCitizenshipControlle = TextEditingController().obs;

  final userPersonal =
      Get.find<UserProfileController>().userProfileModel.value.personalData;

  RxString radioGroup = "Male".obs;
  RxString radioGroupLanguage = "Yes".obs;

  void selectGender(String selectedvalue) {
    radioGroup.value = selectedvalue;
  }

  void selectLanguage(String selectedValue) {
    radioGroupLanguage.value = selectedValue;
  }

  void initialPersonalDetailsData() {
    firstNameController.value.text = userPersonal!.firstName ?? "";
    lastNameController.value.text = userPersonal!.lastName ?? "";
    middleNameController.value.text = userPersonal!.middleName ?? "";
    mobilePhoneController.value.text = userPersonal!.mobilePhone ?? "";
    homePhoneController.value.text = userPersonal!.homePhone ?? "";
    personalEmailController.value.text = userPersonal!.personalEmail ?? "";
    homeAddressController.value.text = userPersonal!.homeAddress ?? "";
    aptSteController.value.text = userPersonal!.homeApt ?? "";
    zipController.value.text = userPersonal!.homeZip ?? "";
    dobControlle.value.text = userPersonal!.dateOfBirth ?? "";
    sociealsecurityController.value.text =
        userPersonal!.socialSecurityNumber ?? "";
    countruyofbirthControlle.value.text = userPersonal!.countryOfBirth ?? "";
    countryOfCitizenshipControlle.value.text =
        userPersonal!.countryOfCitizenship ?? "";
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initialPersonalDetailsData();
    super.onInit();
  }    
  
}
