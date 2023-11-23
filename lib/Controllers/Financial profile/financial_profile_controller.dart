import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
    incomeController.value.text =
        currency(amount: financialData?.income ?? "00") ?? "";
    expansesController.value.text =
        currency(amount: financialData?.expenses ?? "00") ?? "";
    cashflowController.value.text =
        currency(amount: financialData?.cashflow ?? "00") ?? "";
    financialheathNotesController.value.text =
        financialData?.financialHealthNotes ?? "";
  }

  String? currency({required String amount}) {
    // Locale locale = Localizations.localeOf(context!);
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
    String? formattedAmount = NumberFormat.currency(
            locale: Platform.localeName, symbol: format.currencySymbol)
        .format(double.parse(amount));
    return formattedAmount;
  }

  @override
  void onInit() {
    getHealthData();
    super.onInit();
  }
}
