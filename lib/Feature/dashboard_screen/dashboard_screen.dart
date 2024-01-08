import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Controllers/Dashboard%20Controller/dhashboard_controller.dart';
import 'package:forever_connection/Feature/Connection/Presentation/connection_main_screen.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Controller/reqiest_service_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/custom_drawar_widget.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';
import 'package:get/get.dart';

import '../../Controllers/User Profile Controller/user_profile_controller.dart';
import '../../widgets/custom_popup_widget.dart';
import '../dashboard_screen/widgets/userexperience_item_widget.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final dashboardController = Get.put(DashboardController());
  final serviceController = Get.put(RequestServiceController());
  final myProfileController = Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    serviceController.getServiceProfssional();
    myProfileController.getUserProfileData();
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      endDrawer: CustomDrawerWidget(),
      body: Obx(
        () => myProfileController.isLoadingProfileData == true
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 210.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/banner.jpg"),
                            fit: BoxFit.fill)),
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageConstant.appLogo,
                            height: 100.h,
                            width: 100.w,
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomImageView(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          AppRoutes.notificationsScreen);
                                    },
                                    svgPath: ImageConstant.notificationIcon,
                                    width: 25.w,
                                    height: 25.h,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _key.currentState!.openEndDrawer();
                                    },
                                    child: Icon(
                                      Icons.menu,
                                      color: AppColors.appBackgroundColor,
                                      size: 50.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              AppRoutes.myProfileScreen);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.w, vertical: 3.h),
                                          // width: 100,
                                          // height: 30,
                                          decoration: BoxDecoration(
                                              color: AppColors.buttonColor2,
                                              borderRadius:
                                                  BorderRadius.circular(2.r)),
                                          child: Center(
                                            child: Text(
                                              "My Profile",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Obx(() => Text(
                                            "${myProfileController.userProfileModel.value.personalData?.firstName ?? ""} ${myProfileController.userProfileModel.value.personalData?.lastName ?? ""}",
                                            style: TextStyle(
                                                color: AppColors
                                                    .appBackgroundColor,
                                                fontSize: 17.h,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ],
                                  ),
                                  SizedBox(width: 8.w),
                                  CachedNetworkImage(
                                    imageUrl: myProfileController
                                            .userProfileModel
                                            .value
                                            .personalData
                                            ?.photo ??
                                        "", // Replace with the actual image URL
                                    imageBuilder: (context, imageProvider) =>
                                        CircleAvatar(
                                      radius: 27.r,
                                      backgroundColor: Colors.white,
                                      // Adjust the radius as needed
                                      backgroundImage: imageProvider,
                                    ),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator
                                            .adaptive(
                                            backgroundColor: AppColors
                                                .appBackgroundColor), // Placeholder widget
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 50.sp,
                                    ), // Widget to display when an error occurs
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 17.h),
                  Text(
                    "Welcome ${myProfileController.userProfileModel.value.personalData?.firstName ?? ""}!",
                    style: TextStyle(
                        color: AppColors.floatingActionButtonColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "What would you like to accomplish?",
                    style: TextStyle(
                        color: AppColors.buttonColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    // flex: 1,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 20.h),
                      itemCount: dashboardController.dashboardListData.length,
                      itemBuilder: (context, index) {
                        return UserexperienceItemWidget(
                          title: dashboardController.dashboardListData[index]
                              ['title'],
                          leftImagePath: dashboardController
                              .dashboardListData[index]['imagePath'],
                          onIconClick: () {
                            if (index == 0) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Set the border radius for the dialog
                                    ),
                                    child: const CustomPopupContent(
                                        title: "Connect",
                                        content:
                                            "assets/images/connect-tooltips.png"),
                                  );
                                },
                              );
                            } else if (index == 1) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Set the border radius for the dialog
                                    ),
                                    child: const CustomPopupContent(
                                      title: "Request Service",
                                      content:
                                          "assets/images/request-tooltips.png",
                                    ),
                                  );
                                },
                              );
                            } else if (index == 2) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Set the border radius for the dialog
                                    ),
                                    child: const CustomPopupContent(
                                        title: "View & Collaborate",
                                        content:
                                            "assets/images/collaborate-tooltips.png"),
                                  );
                                },
                              );
                            } else if (index == 3) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Set the border radius for the dialog
                                    ),
                                    child: const CustomPopupContent(
                                        title: "Access My Vault",
                                        content:
                                            "assets/images/access-my-vault.png"),
                                  );
                                },
                              );
                            }
                          },
                          ontap: () {
                            if (index == 0) {
                              Get.to(ConnectionMainScreen());
                            } else if (index == 1) {
                              Navigator.pushNamed(
                                  context, AppRoutes.requestServiceOneScreen);
                            } else if (index == 2) {
                              Navigator.pushNamed(
                                  context, AppRoutes.myServicesScreen);
                            } else if (index == 3) {
                              Navigator.pushNamed(
                                  context, AppRoutes.documentVaultScreen);
                            }
                          },
                          buttonName: dashboardController
                              .dashboardListData[index]['buttonName'],
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
      bottomSheet: Container(
        color: const Color(0xFFEAF7FE),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.play_circle,
                color: AppColors.floatingActionButtonColor,
              ),
              SizedBox(
                width: 6.sp,
              ),
              Text(
                "Video Introduction",
                style: TextStyle(
                    color: AppColors.floatingActionButtonColor,
                    // decoration: TextDecoration.underline,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
