import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/My%20Service/Model/user_services_model.dart';
import 'package:get/get.dart';

import '../../../Services/User Services/user_services.dart';
import '../../../core/utils/toast_widget.dart';

class UserServicesController extends GetxController {
  RxBool isServiceLoading = false.obs;
  RxList<UserServicesModel> userServicesList = <UserServicesModel>[].obs;
  RxList<UserServicesModel> userServicesCompletedList =
      <UserServicesModel>[].obs;
  RxList<UserServicesModel> userServicesPendingList = <UserServicesModel>[].obs;
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
}
