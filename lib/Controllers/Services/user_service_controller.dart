import 'package:flutter/material.dart';
import 'package:forever_connection/Models/user_services_model.dart';
import 'package:get/get.dart';

import '../../Services/User Services/user_services.dart';
import '../../core/utils/toast_widget.dart';

class UserServicesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<UserServicesModel> userServicesList = <UserServicesModel>[].obs;

  UserServices userServices = UserServices();
  getUserServices() async {
    try {
      isLoading(true);
      userServicesList.value = await userServices.getUserServices();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      ToastWidget.errorToast(error: e.toString());
    }
  }
  
}
