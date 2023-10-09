import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RelationShipController extends GetxController {
    final relationshipsvaController = TextEditingController().obs;
  final firstNameController = TextEditingController().obs;
  final middlenameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final homephoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final homeaddressController = TextEditingController().obs;
  final aptsteContoller = TextEditingController().obs;
  final zipController = TextEditingController().obs;
  final dateOfBirthController = TextEditingController().obs;
  final socielsecurityNumber = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final birthcountryController = TextEditingController().obs;
  final birthcitizencountryController = TextEditingController().obs;
  final businessnameController = TextEditingController().obs;
  final businessphoneController = TextEditingController().obs;
  final businessfaxController = TextEditingController().obs;
  final businessemailController = TextEditingController().obs;
  final businesswebsitecontroller = TextEditingController().obs;
  final businessPositionController = TextEditingController().obs;
  final myidealController = TextEditingController().obs;
  final educationlevelcontroller = TextEditingController().obs;
  final degreeController = TextEditingController().obs;
  final affiliationsController = TextEditingController().obs;
  final businessAddressaddressController = TextEditingController().obs;
  final businessaptsteoneController = TextEditingController().obs;
  final businessziponeController = TextEditingController().obs;

  RxString radioGroup = "Male".obs;

  void selectGender(String selectedvalue) {
    radioGroup.value = selectedvalue;
  }
}
