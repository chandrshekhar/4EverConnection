// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/toast_widget.dart';
import 'package:get/get.dart';
import '../../Services/Auth Services/auth_services.dart';
import '../../core/utils/shared_pref_services.dart';

class LoginController extends GetxController {
  var userNameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  RxBool isLoginLoading = false.obs;
  RxBool rememberMeCheckBox = false.obs;
  AuthServices authServices = AuthServices();

  RxBool passwordVigiable = false.obs;

  visiablePassword(bool value) {
    passwordVigiable.value = value;
  }

  rememberMe(bool value) {
    rememberMeCheckBox.value = value;
  }

  login(BuildContext context) async {
    try {
      Map<String, dynamic> reqModel = {
        "username": userNameController.value.text.trim(),
        "password": passwordController.value.text.trim(),
      };
      isLoginLoading(true);
      var res = await authServices.loginApi(reqModel: reqModel);

      if (res['token'] != null && res['token'] != '') {
        await SharedPref().setUserToken(userToken: res['token']);
        if (rememberMeCheckBox.value) {
          await SharedPref().setUserID(
              userID: userNameController.value.text,
              password: passwordController.value.text);
        } else {
          userNameController.value.clear();
          passwordController.value.clear();
        }

        isLoginLoading(false);
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.dashboardScreen, (route) => false);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout ||
            e.type == DioErrorType.sendTimeout) {
          TostWidget()
              .errorToast(title: "Error!", message: "Please check internet");
        } else if (e.type == DioErrorType.badResponse) {
          print("bad-> ${e.response!.data}");
          TostWidget().errorToast(
              title: "Invalid!",
              message: "${e.response!.data["non_field_errors"][0]}");
        } else {
          TostWidget().errorToast(
              title: "Error!",
              message: "Someting went wrong please try after sometime");
        }
      }
    }
    isLoginLoading(false);
  }

  alreadyLogedIn() {}

  logOut(BuildContext context) async {
    await SharedPref().deleteAllData();
    userNameController.value.clear();
    passwordController.value.clear();
    rememberMe(false);
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.loginScreen, (route) => false);
  }
}
