import 'package:cached_network_image/cached_network_image.dart';
import 'package:forever_connection/Controllers/Dashboard%20Controller/dhashboard_controller.dart';
import 'package:forever_connection/Feature/Connection/Presentation/connection_main_screen.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Controller/reqiest_service_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/custom_drawar_widget.dart';
import 'package:get/get.dart';
import '../../Controllers/User Profile Controller/user_profile_controller.dart';
import '../../widgets/custom_popup_widget.dart';
import '../dashboard_screen/widgets/userexperience_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final dashboardController = Get.put(DashboardController());
  final myProfileController = Get.put(UserProfileController());
  final serviceController = Get.put(RequestServiceController());

  @override
  Widget build(BuildContext context) {
    serviceController.getServiceProfssional();
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEAF7FE),
      endDrawer: CustomDrawerWidget(
        myProfileController: myProfileController,
      ),
      body: SafeArea(
        child: Obx(
          () => myProfileController.isLoadingProfileData == true
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Column(
                  children: [
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/banner.jpg"),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              ImageConstant.appLogo,
                            ),
                            const Spacer(),
                            CustomImageView(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.notificationsScreen);
                              },
                              svgPath: ImageConstant.notificationIcon,
                              width: 25.adaptSize,
                              height: 25.adaptSize,
                            ),
                            Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: myProfileController.userProfileModel
                                          .value.personalData?.photo ??
                                      "", // Replace with the actual image URL
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    // Adjust the radius as needed
                                    backgroundImage: imageProvider,
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator.adaptive(
                                          backgroundColor: AppColors
                                              .appBackgroundColor), // Placeholder widget
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 60,
                                  ), // Widget to display when an error occurs
                                ),
                                Obx(() => Text(
                                      "${myProfileController.userProfileModel.value.personalData?.firstName ?? ""} ${myProfileController.userProfileModel.value.personalData?.lastName ?? ""}",
                                      style: const TextStyle(
                                          color: AppColors.appBackgroundColor,
                                          fontWeight: FontWeight.w600),
                                    )),
                                SizedBox(
                                  height: 8.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.myProfileScreen);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(3.adaptSize),
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: AppColors.appBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(180)),
                                    child: Center(
                                      child: Text(
                                        "MY PROFILE",
                                        style: TextStyle(
                                            fontSize: 11.adaptSize,
                                            color: AppColors
                                                .floatingActionButtonColor,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  _key.currentState!.openEndDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: AppColors.appBackgroundColor,
                                  size: 50.adaptSize,
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 17.v),
                    Text(
                      "Welcome ${myProfileController.userProfileModel.value.personalData?.firstName ?? ""}!",
                      style: TextStyle(
                          color: AppColors.floatingActionButtonColor,
                          fontSize: 18.adaptSize,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "What would you like to accomplish?",
                      style: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 15.adaptSize,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                            left: 16.adaptSize, right: 16.adaptSize, top: 20.h),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.video_file,
                          color: AppColors.floatingActionButtonColor,
                        ),
                        SizedBox(
                          width: 6.adaptSize,
                        ),
                        const Text(
                          "Video Introduction",
                          style: TextStyle(
                              color: AppColors.floatingActionButtonColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.adaptSize,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
