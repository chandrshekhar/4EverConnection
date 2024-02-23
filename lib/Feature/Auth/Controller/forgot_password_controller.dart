// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Services/Auth Services/auth_services.dart';
import '../../../core/utils/toast_widget.dart';
import '../../../routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  var emailController = TextEditingController().obs;
  RxBool isLoginLoading = false.obs;
  // RxBool isEmail(String input) => EmailValidator.validate(input).obs;
  AuthServices authServices = AuthServices();

  sednEmailForOtp(BuildContext context) async {
    if (isLoginLoading.value == false) {
      Map<String, dynamic> reqModel = {
        "email": emailController.value.text.trim()
      };
      isLoginLoading(true);
      var res =
          await authServices.sendEmailForForgotpassword(reqModel: reqModel);
      debugPrint(res.toString());
      if (res['status'] == 200) {
        isLoginLoading(false);
        ToastWidget.successToast(success: res['message']);
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.loginScreen, (route) => false);

        // doNavigate(route: const OtpScreen(), context: context);
      } else {
        isLoginLoading(false);
        ToastWidget.errorToast(error: res['message']);
      }
    } else {
      isLoginLoading(false);
      ToastWidget.errorToast(error: "Email not be blank");
    }
  }
}
