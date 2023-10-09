import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  RxString radioGroup = "Male".obs;
  RxString radioGroupLanguage = "Yes".obs;

  void selectGender(String selectedvalue) {
    radioGroup.value = selectedvalue;
  }

  void selectLanguage(String selectedValue) {
    radioGroupLanguage.value = selectedValue;
  }
}
