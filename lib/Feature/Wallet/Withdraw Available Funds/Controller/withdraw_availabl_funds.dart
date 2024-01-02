import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawFundsController extends GetxController {
  RxString accountAssociateSelectedValue = "Mobile Number".obs;
  RxString paymentTypeSelectedValue = "Zelle".obs;
  RxString phoneEmailString = "".obs;
  var phoneEmailController = TextEditingController().obs;

  setAccountAssociateValue(String value) {
    accountAssociateSelectedValue.value = value;
  }

  setPaymentMethod(String value) {
    paymentTypeSelectedValue.value = value;
  }

  setEmailPhone(String value) {
    phoneEmailString.value = value;
  }
}
