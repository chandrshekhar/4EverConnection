// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Services/Auth Services/auth_services.dart';
import '../../core/utils/toast_widget.dart';

class SignupController extends GetxController {
  var nameController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var ageController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var confPassController = TextEditingController().obs;
  AuthServices authServices = AuthServices();
  RxBool isRegisterLoadng = false.obs;
  RxString selectedGender = ''.obs;

  genderSelected(value) {
    selectedGender.value = value;
  }

  register(BuildContext context) async {
    try {
      Map<String, dynamic> reqModel = {
        "name": nameController.value.text.trim(),
        "email": emailController.value.text.trim(),
        "gender": selectedGender.value,
        "phone": phoneNumberController.value.text.trim(),
        "password": passController.value.text.trim(),
        "confirm_password": confPassController.value.text.trim(),
        "age": ageController.value.text.trim(),
        "type": "user",
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
    nameController.value.clear();
    emailController.value.clear();
    phoneNumberController.value.clear();
    selectedGender.value = '';
    isRegisterLoadng.value = false;
    ageController.value.clear();
    passController.value.clear();
    confPassController.value.clear();
  }
}
