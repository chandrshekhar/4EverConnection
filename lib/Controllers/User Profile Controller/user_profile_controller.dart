// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Webview/web_view.dart';
import 'package:forever_connection/Models/user_profile_model.dart';

import 'package:get/get.dart';

import '../../Services/Profile/user_profile_service.dart';
import '../../core/utils/toast_widget.dart';

class UserProfileController extends GetxController {
  RxBool isLoadingProfileData = false.obs;
  Rx<UserProfileModel> userProfileModel = UserProfileModel().obs;
  UserProfileService userProfileService = UserProfileService();
  getUserProfileData() async {
    try {
      isLoadingProfileData(true);
      userProfileModel.value = await userProfileService.getUserProfile();
      isLoadingProfileData(false);
    } catch (e) {
      isLoadingProfileData(false);
      ToastWidget.errorToast(error: e.toString());
    }
  }

  void updateSelectedField(int selectedIndex) {
    for (int i = 0; i < drawerDataList.length; i++) {
      if (i == selectedIndex) {
        drawerDataList[i] = true;
      } else {
        drawerDataList[i] = false;
      }
    }
  }

  RxBool isLoadingpasswordandSecurity = false.obs;
  RxBool isLoadingSupport = false.obs;
  getMagicLinkForPassSecurity(BuildContext context) async {
    try {
      isLoadingpasswordandSecurity(true);
      var res = await userProfileService.getMagicLink(
          navigateTo: "https://4everconnection.com/security/");
      if (res.isNotEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => WebViewScreen(
                      webViewUrl: res['magic_link'],
                    )));
        isLoadingpasswordandSecurity(false);
      } else {
        ToastWidget.errorToast(error: "Someting went wrong");
        isLoadingpasswordandSecurity(false);
      }
    } catch (e) {
      ToastWidget.errorToast(error: "$e");
      isLoadingpasswordandSecurity(false);
    }
  }

  getMagicLinkSupport(BuildContext context) async {
    try {
      isLoadingSupport(true);
      var res = await userProfileService.getMagicLink(
          navigateTo: "https://4everconnection.com/help/");

      if (res.isNotEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => WebViewScreen(
                      webViewUrl: res['magic_link'],
                    )));
        isLoadingSupport(false);
      } else {
        ToastWidget.errorToast(error: "Someting went wrong");
        isLoadingSupport(false);
      }
    } catch (e) {
      ToastWidget.errorToast(error: "$e");
      isLoadingSupport(false);
    }
  }

  RxList<bool> drawerDataList = <bool>[
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getUserProfileData();
  }
}
