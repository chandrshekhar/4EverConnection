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

  final userPersonal = Get.put(UserProfileController());

  RxString radioGroup = "Male".obs;
  RxString radioGroupLanguage = "Yes".obs;

  void selectGender(String selectedvalue) {
    radioGroup.value = selectedvalue;
  }

  void selectLanguage(String selectedValue) {
    radioGroupLanguage.value = selectedValue;
  }

  void initialPersonalDetailsData() {
    var userData = userPersonal.userProfileModel.value.personalData;
    firstNameController.value.text = userData?.firstName ?? "";
    lastNameController.value.text = userData?.lastName ?? "";
    middleNameController.value.text = userData?.middleName ?? "";
    mobilePhoneController.value.text = userData?.mobilePhone ?? "";
    homePhoneController.value.text = userData?.homePhone ?? "";
    personalEmailController.value.text = userData?.personalEmail ?? "";
    homeAddressController.value.text = userData?.homeAddress ?? "";
    aptSteController.value.text = userData?.homeApt ?? "";
    zipController.value.text = userData?.homeZip ?? "";
    dobControlle.value.text = userData?.dateOfBirth ?? "";
    sociealsecurityController.value.text = userData?.socialSecurityNumber ?? "";
    countruyofbirthControlle.value.text = userData?.countryOfBirth ?? "";
    countryOfCitizenshipControlle.value.text =
        userData?.countryOfCitizenship ?? "";
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initialPersonalDetailsData();
    super.onInit();
  }    
  
}
