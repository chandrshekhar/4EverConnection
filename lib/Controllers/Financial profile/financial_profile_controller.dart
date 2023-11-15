import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../User Profile Controller/user_profile_controller.dart';

class FinancialProfileController extends GetxController {
  var taxProfessionalNameController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var assetController = TextEditingController().obs;
  var liabilitiesController = TextEditingController().obs;
  var netWorthController = TextEditingController().obs;
  var incomeController = TextEditingController().obs;
  var expansesController = TextEditingController().obs;
  var cashflowController = TextEditingController().obs;
  var financialheathNotesController = TextEditingController().obs;

  final userPersonal = Get.put(UserProfileController());

  getHealthData() {
    var financialData = userPersonal.userProfileModel.value.financialData;
    taxProfessionalNameController.value.text =
        financialData?.taxProfessionalName ?? "";
    phoneNumberController.value.text = financialData?.phone ?? "";
    addressController.value.text = financialData?.address ?? "";
    assetController.value.text = financialData?.assets ?? "";
    liabilitiesController.value.text = financialData?.liabilities ?? "";
    netWorthController.value.text = financialData?.netWorth ?? "";
    incomeController.value.text = financialData?.income ?? "";
    expansesController.value.text = financialData?.expenses ?? "";
    cashflowController.value.text = financialData?.cashflow ?? "";
    financialheathNotesController.value.text =
        financialData?.financialHealthNotes ?? "";
  }

  @override
  void onInit() {
    getHealthData();
    super.onInit();
  }
}
