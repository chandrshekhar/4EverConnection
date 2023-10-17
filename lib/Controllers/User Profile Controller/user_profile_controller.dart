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

  @override
  void onReady() {
    getUserProfileData();
    super.onReady();
  }
}
