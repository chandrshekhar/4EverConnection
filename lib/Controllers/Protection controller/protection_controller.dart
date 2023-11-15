import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProtectionController extends GetxController {
  var policeNumberController = TextEditingController().obs;
  var policyTypeController = TextEditingController().obs;
  var issueDateController = TextEditingController().obs;
  var companynameController = TextEditingController().obs;
  var companyPhoneController = TextEditingController().obs;
  var deathBenefitController = TextEditingController().obs;
  var premimusController = TextEditingController().obs;

  List<String> protectionList = [
    "Life Insurance",
    "Disability insurance",
    "Health Insurance",
    "Long Term Care Insurance",
    "Home Insurance",
    "Car insurance"
  ];

  updateProtectController() {
    policeNumberController.value.text = "";
    policyTypeController.value.text = "";
    issueDateController.value.text = "";
    companyPhoneController.value.text = "";
    companynameController.value.text = "";
    deathBenefitController.value.text = "";
    premimusController.value.text = "";
  }
}
