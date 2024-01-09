import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Wallet/Repo/wallet_repo.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';

class WithdrawFundsController extends GetxController {
  RxString accountAssociateSelectedValue = "Mobile Number".obs;
  RxString paymentTypeSelectedValue = "Zelle".obs;
  RxString phoneEmailString = "".obs;
  final _walletRepo = MyWalletRepo();
  var phoneEmailController = TextEditingController().obs;
  var methodController = TextEditingController().obs;
  var amountController = TextEditingController().obs;
  RxInt methodIds = (-1).obs;

  setAccountAssociateValue(String value) {
    accountAssociateSelectedValue.value = value;
  }

  setPaymentMethod(String value) {
    paymentTypeSelectedValue.value = value;
  }

  setEmailPhone(String value) {
    phoneEmailString.value = value;
  }

  addModelData({required int methodId, required String methodName}) {
    methodController.value.text = methodName;
    methodIds.value = methodId;
  }

  RxBool isSubmitLoading = false.obs;
  submitWithdrawRequest() async {
    try {
      isSubmitLoading(true);
      Map<String, dynamic> reqModel = {
        //"date_created":"2024-01-05",
        "amount": amountController.value.text,
        // "status":"Done",
        // "reference":"W-4532",
        "method": methodIds.value
      };
      var res = await _walletRepo.withdrawRequest(reqModel: reqModel);
      if (res['data'] == false) {
        ToastWidget.errorToast(error: res['error']);
        isSubmitLoading(false);
      } else {
        ToastWidget.successToast(
            success: "Withdraw request successfully submitted");
        isSubmitLoading(false);
        amountController.value.clear();
        methodController.value.clear();
        methodIds(-1);
      }
    } catch (e) {
      isSubmitLoading(false);
    }
  }
}
