import 'dart:developer';

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
