// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../Services/Auth Services/auth_services.dart';
import '../../core/utils/shared_pref_services.dart';
import '../../core/utils/toast_widget.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  RxBool isLoginLoading = false.obs;
  AuthServices authServices = AuthServices();

  login(BuildContext context) async {
    if (passwordController.value.text.length >= 8) {
      try {
        Map<String, dynamic> reqModel = {
          "email": emailController.value.text.trim(),
          "password": passwordController.value.text.trim(),
          "type": "Patient"
        };
        isLoginLoading(true);
        var res = await authServices.loginApi(reqModel: reqModel);
        if (res['status'] == true) {
          await SharedPref().setUserToken(userToken: res['data']['auth_token']);
          isLoginLoading(false);
        } else {
          isLoginLoading(false);
          ToastWidget.errorToast(error: res['error']);
        }
      } catch (e) {
        isLoginLoading(false);
        ToastWidget.errorToast(error: e.toString());
      }
    } else {
      ToastWidget.errorToast(error: "All field required");
    }
  }

  logOut(BuildContext context) async {
    await SharedPref().deleteAllData();
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
