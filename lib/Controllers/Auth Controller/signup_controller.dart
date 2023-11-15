// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/toast_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Services/Auth Services/auth_services.dart';
import '../../core/utils/toast_widget.dart';

class SignupController extends GetxController {
  final firstNameController = TextEditingController().obs;
  final lastnameController = TextEditingController().obs;
  final mobileNumberController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final dobController = TextEditingController().obs;
  final occupationController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final aptController = TextEditingController().obs;
  final zipController = TextEditingController().obs;
  final businessNameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final cnfPasswordController = TextEditingController().obs;
  final languageController = TextEditingController().obs;
  AuthServices authServices = AuthServices();
  RxBool isRegisterLoadng = false.obs;
  RxBool isClientChecking = false.obs;
  RxString selectedGender = 'Male'.obs;
  RxString selectedlanguage = ''.obs;

  RxInt selectedSourceType = 0.obs;

  var selectedDate = DateTime.now().obs;
  RxBool passwordVigiable = false.obs;
  RxBool aggrement = false.obs;

  void sourceOption(int value) {
    selectedSourceType.value = value;
    log(selectedSourceType.toString());
  }

  RxString isAlreadyAccount = "".obs;

  checkAccount(String value) {
    isAlreadyAccount.value = value;
    clearValue();
  }

  visiablePassword(bool value) {
    passwordVigiable.value = value;
  }

  acceptAggrement(bool value) {
    aggrement.value = value;
  }

  genderSelected(value) {
    selectedGender.value = value;
  }

  languageSelected(value) {
    selectedlanguage.value = value;
  }

  // get zip code
  List<String> suggestions = [];
  Future<List<String>> getLocation(String query) async {
    try {
      suggestions = await authServices.searchLocations(query);
       log(suggestions[0]);
      return suggestions;
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout ||
            e.type == DioErrorType.sendTimeout) {
          TostWidget()
              .errorToast(title: "Error!", message: "Please check internet");
        } else if (e.type == DioErrorType.badResponse) {
          TostWidget().errorToast(title: "Invalid!", message: "${e.response!}");
        } else {
          TostWidget().errorToast(
              title: "Error!",
              message: "Someting went wrong please try after sometime!");
        }
      }
      return suggestions;
    }
  }

  checkClient(BuildContext context) async {
    try {
      Map<String, dynamic> reqModel = {
        "first_name": firstNameController.value.text.trim(),
        "last_name": lastnameController.value.text.trim(),
        "email": emailController.value.text,
      };
      debugPrint(reqModel.toString());
      isClientChecking(true);
      var res = await authServices.checkApi(reqModel: reqModel);
      if (res["satus"] == 200 && res["message"] != "") {
        isClientChecking(false);
        ToastWidget.successToast(success: res['message']);
        clearValue();
      }
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout ||
            e.type == DioErrorType.sendTimeout) {
          TostWidget()
              .errorToast(title: "Error!", message: "Please check internet");
        } else if (e.type == DioErrorType.badResponse) {
          TostWidget().errorToast(
              title: "Invalid!", message: "${e.response!.data["message"]}");
        } else {
          TostWidget().errorToast(
              title: "Error!",
              message: "Someting went wrong please try after sometime!");
        }
      }

      isRegisterLoadng(false);
    }
  }

  register(BuildContext context) async {
    try {
      Map<String, dynamic> reqModel = {
        "first_name": firstNameController.value.text.trim(),
        "last_name": lastnameController.value.text.trim(),
        "mobile_number": mobileNumberController.value.text,
        "email": emailController.value.text,
        "gender": selectedGender.value,
        "date_of_birth": dobController.value.text,
        "occupation": occupationController.value.text.trim(),
        "address": addressController.value.text.trim(),
        "apt": aptController.value.text.trim(),
        "zip": zipController.value.text.trim(),
        "business_name": businessNameController.value.text.trim(),
        "password": passwordController.value.text.trim(),
        "language": selectedlanguage.value.toString(),
        "how_do_you_know_us": selectedSourceType.value.toString()
      };
      debugPrint(reqModel.toString());
      isRegisterLoadng(true);
      var res = await authServices.registerApi(reqModel: reqModel);
      if (res["satus"] == 200) {
        isRegisterLoadng(false);
        ToastWidget.successToast(success: res['message']);
        clearValue();
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.loginScreen, (route) => false);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout ||
            e.type == DioErrorType.sendTimeout) {
          TostWidget()
              .errorToast(title: "Error!", message: "Please check internet");
        } else if (e.type == DioErrorType.badResponse) {
          log(e.response!.data);
          TostWidget().errorToast(
              title: "Invalid!", message: "${e.response!.data["message"]}");
        } else {
          TostWidget().errorToast(
              title: "Error!",
              message: "Someting went wrong please try after sometime!");
        }
      }

      isRegisterLoadng(false);
    }
  }

  clearValue() {
    firstNameController.value.clear();
    lastnameController.value.clear();
    emailController.value.clear();
    mobileNumberController.value.clear();
    selectedGender.value = '';
    isRegisterLoadng.value = false;
    addressController.value.clear();
    passwordController.value.clear();
    dobController.value.clear();
    aptController.value.clear();
    businessNameController.value.clear();
    selectedSourceType.value = 0;
    aggrement(false);
    selectedlanguage.value = "";
  }

  //pic date and time
  Future<void> selectDate(BuildContext context) async {
    var pickedDate = await showDatePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: selectedDate.value,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime.now(),
        fieldHintText: '',
        useRootNavigator: false,
        builder: ((context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                datePickerTheme: const DatePickerThemeData(
                  dayStyle: TextStyle(fontSize: 20),
                  headerHeadlineStyle: TextStyle(fontSize: 20),
                  headerHelpStyle: TextStyle(fontSize: 20),
                  weekdayStyle: TextStyle(fontSize: 20),
                ),
              ),
              child: child!);
        }));
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      dobController.value.text = convertAndFormatDate(pickedDate);
    }
  }

  //format date time as per requirement
  String convertAndFormatDate(DateTime inputDate) {
    final outputFormat = DateFormat("yyyy-dd-MM");
    return outputFormat.format(inputDate);
  }
}
