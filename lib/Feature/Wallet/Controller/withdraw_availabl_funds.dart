// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Wallet/Repo/wallet_repo.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';

import '../Model/withdrawal_method_model.dart';
import 'withdraw_method_controller.dart';

class WithdrawFundsController extends GetxController {
  RxString accountAssociateSelectedValue = "Phone".obs;
  RxString paymentTypeSelectedValue = "Zelle".obs;
  RxString phoneEmailString = "".obs;
  final _walletRepo = MyWalletRepo();
  var phoneEmailController = TextEditingController().obs;
  var methodController = TextEditingController().obs;
  var amountController = TextEditingController().obs;
  RxInt methodIds = (-1).obs;
  final withdrawMethodController = Get.put(WithdrawMethodController());

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

  setPrefiledEditValue(WithdrawalMethod withdrawalMethod) {
    phoneEmailController.value.text = withdrawalMethod.identification ?? "";
    phoneEmailString.value = withdrawalMethod.identification ?? "";
    accountAssociateSelectedValue.value = withdrawalMethod.type ?? "";
    paymentTypeSelectedValue.value = withdrawalMethod.method ?? "";
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

  RxBool isAddMethodLoading = false.obs;
  //add method controller service
  addMethodService(BuildContext context) async {
    try {
      isAddMethodLoading(true);
      Map<String, dynamic> reqModel = {
        "method": paymentTypeSelectedValue.value,
        "type": accountAssociateSelectedValue.value,
        "identification": phoneEmailController.value.text.toString(),
        "default": false
      };
      log("Req Model ${reqModel.toString()}");
      var res = await _walletRepo.addMethod(reqModel: reqModel);
      if (res.isNotEmpty) {
        ToastWidget.successToast(success: "Add method successfully added");
        Navigator.pop(context);
        isAddMethodLoading(false);
      } else {
        ToastWidget.errorToast(error: "Faild to add method");
        isAddMethodLoading(false);
      }
    } catch (e) {
      isAddMethodLoading(false);
    }
  }

  //edit method service controller service

  RxBool isEditLoading = false.obs;
  editMethodService({required int id, required BuildContext context}) async {
    try {
      isEditLoading(true);
      Map<String, dynamic> reqModel = {
        "method": paymentTypeSelectedValue.value,
        "type": accountAssociateSelectedValue.value,
        "identification": phoneEmailController.value.text.toString(),
      };
      var res = await _walletRepo.editMethod(reqModel: reqModel, id: id);
      if (res.isNotEmpty) {
        ToastWidget.successToast(success: "Method updated successfully");
        await withdrawMethodController.getWithdrawalMethodList(
            isLoadingShow: false);
        Navigator.pop(context);
        isEditLoading(false);
      } else {
        isEditLoading(false);
      }
    } catch (e) {
      isEditLoading(false);
    }
  }

  deleteMethodService({required int id, required int index}) async {
    try {
      await _walletRepo.deleteMethod(id: id);
      withdrawMethodController.withdrawMethodList.removeAt(index);
    } catch (e) {
      print(e);
    }
  }

  toggleMethod(int id) async {
    try {
      var res = await _walletRepo.toggleMethod(id: id);
      if (res.isNotEmpty) {
        ToastWidget.successToast(success: "Your method mark as default");
        await withdrawMethodController.getWithdrawalMethodList(
            isLoadingShow: false);
      } else {
        ToastWidget.errorToast(error: "Faild to mark as default");
      }
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
    }
  }
}
