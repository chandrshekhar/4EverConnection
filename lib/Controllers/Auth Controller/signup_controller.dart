// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  RxString selectedGender = 'Male'.obs;
  RxString selectedlanguage = 'English'.obs;

  genderSelected(value) {
    selectedGender.value = value;
  }

  languageSelected(value) {
    selectedlanguage.value = value;
  }

  register(BuildContext context) async {
    List<String> splitStrings = firstNameController.value.text.split(" ");
    try {
      Map<String, dynamic> reqModel = {
        "first_name": splitStrings[0],
        "last_name": splitStrings[1],
        "mobile_number": mobileNumberController.value.text,
        "email": emailController.value.text,
        "gender": selectedGender,
        "date_of_birth": dobController.value.text,
        "occupation": "",
        "address": "",
        "apt": "",
        "zip": "",
        "business_name": "",
        "password": "",
        "language": languageController.value.text.trim()
      };
      isRegisterLoadng(true);
      var res = await authServices.registerApi(reqModel: reqModel);
      if (res['status'] == true) {
        isRegisterLoadng(false);

        ToastWidget.successToast(success: "Register success");
      } else {
        isRegisterLoadng(false);
        ToastWidget.errorToast(error: res['error']);
      }
    } catch (e) {
      isRegisterLoadng(false);
      ToastWidget.errorToast(error: e.toString());
    }
  }

  clearValue() {
    firstNameController.value.clear();
    emailController.value.clear();
    mobileNumberController.value.clear();
    selectedGender.value = '';
    isRegisterLoadng.value = false;
    addressController.value.clear();
    passwordController.value.clear();
    cnfPasswordController.value.clear();
  }
}
