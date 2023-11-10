import 'package:flutter/material.dart';
import 'package:forever_connection/Models/user_services_model.dart';
import 'package:get/get.dart';

import '../../Services/User Services/user_services.dart';
import '../../core/utils/toast_widget.dart';

class UserServicesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<UserServicesModel> userServicesList = <UserServicesModel>[].obs;
  RxList<UserServicesModel> userServicesCompletedList =
      <UserServicesModel>[].obs;
  RxList<UserServicesModel> userServicesPendingList = <UserServicesModel>[].obs;

  UserServices userServices = UserServices();
  getUserServices() async {
    try {
      isLoading(true);
      userServicesList.value = await userServices.getUserServices();

      for (int i = 0; i < userServicesList.length; i++) {
        if (userServicesList[i].statusDescription == "Completed") {
          userServicesCompletedList.add(userServicesList[i]);
        } else {
          userServicesPendingList.add(userServicesList[i]);
        }
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      ToastWidget.errorToast(error: e.toString());
    }
  }
}
