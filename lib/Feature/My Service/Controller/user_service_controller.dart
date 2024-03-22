// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/My%20Service/Model/user_services_model.dart';
import 'package:forever_connection/Services/Profile/user_profile_service.dart';
import 'package:forever_connection/core/utils/web_view.dart';
import 'package:get/get.dart';

import '../../../Services/User Services/user_services.dart';
import '../../../core/utils/toast_widget.dart';

class UserServicesController extends GetxController {
  RxBool isServiceLoading = false.obs;
  RxList<UserServicesModel> userServicesList = <UserServicesModel>[].obs;
  RxList<UserServicesModel> userServicesCompletedList =
      <UserServicesModel>[].obs;
  RxList<UserServicesModel> userServicesPendingList = <UserServicesModel>[].obs;
  UserProfileService userProfileService = UserProfileService();
  UserServices userServices = UserServices();
  getUserServices() async {
    try {
      isServiceLoading(true);
      userServicesList.value = await userServices.getUserServices();
      userServicesCompletedList.clear();
      userServicesPendingList.clear();

      for (int i = 0; i < userServicesList.length; i++) {
        if (userServicesList[i].status == 5) {
          userServicesCompletedList.add(userServicesList[i]);
        } else {
          userServicesPendingList.add(userServicesList[i]);
        }
      }
      isServiceLoading(false);
    } catch (e) {
      isServiceLoading(false);
      ToastWidget.errorToast(error: e.toString());
    }
  }

  RxBool isLoadingCollaboration = false.obs;
  RxBool isLoadingSupport = false.obs;
  getCollaborationPage(BuildContext context, String? id) async {
    try {
      isLoadingCollaboration(true);
      var res = await userProfileService.getMagicLink(
          navigateTo: "https://4everconnection.com/collaboration/$id/");
      if (res.isNotEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => WebViewScreen(
                      webViewUrl: res['magic_link'],
                    )));
        isLoadingCollaboration(false);
      } else {
        ToastWidget.errorToast(error: "Someting went wrong");
        isLoadingCollaboration(false);
      }
    } catch (e) {
      ToastWidget.errorToast(error: "$e");
      isLoadingCollaboration(false);
    }
  }

  RxBool serviceDetailsLoding = false.obs;
  getServiceDetails(BuildContext context, String id) async {
    // print("id" + id);
    try {
      serviceDetailsLoding(true);
      var res = await userProfileService.getMagicLink(
          navigateTo: "https://4everconnection.com/service-details/$id/");
      print("res $res");
      if (res.isNotEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => WebViewScreen(
                      webViewUrl: res['magic_link'],
                    )));
        serviceDetailsLoding(false);
      } else {
        ToastWidget.errorToast(error: "Someting went wrong");
        serviceDetailsLoding(false);
      }
    } catch (e) {
      ToastWidget.errorToast(error: "$e");
      serviceDetailsLoding(false);
    }
  }
}
