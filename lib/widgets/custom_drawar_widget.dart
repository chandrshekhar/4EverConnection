import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forever_connection/Controllers/Personal%20Details%20Controller/personal_details-controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/alery_dailog.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/custom_expansion_tile.dart';
import 'package:get/get.dart';

import '../Controllers/Auth Controller/login_controller.dart';
import '../Controllers/User Profile Controller/user_profile_controller.dart';
import '../Feature/Connection/Presentation/connection_list.dart';
import '../Feature/Connection/Presentation/connection_main_screen.dart';

class CustomDrawerWidget extends StatelessWidget {
  CustomDrawerWidget({super.key, required this.myProfileController});
  final UserProfileController myProfileController;
  final personalDetailsController = Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    String userName =
        "${myProfileController.userProfileModel.value.personalData?.firstName ?? ""}  ${myProfileController.userProfileModel.value.personalData?.lastName ?? ""}";

    log("UserName--> $userName");
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.lightBlue,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xFF1f718b),
                padding: EdgeInsets.only(
                    top: 20.h, left: 18.w, right: 18.w, bottom: 12.h),
                // margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: myProfileController.userProfileModel.value
                                    .personalData?.photo ??
                                "", // Replace with the actual image URL
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: 25.r,
                              backgroundColor: Colors.white,
                              // Adjust the radius as needed
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator.adaptive(
                                    backgroundColor: AppColors
                                        .appBackgroundColor), // Placeholder widget
                            errorWidget: (context, url, error) => const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 60,
                            ), // Widget to display when an error occurs
                          ),
                          SizedBox(width: 18.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                userName,
                                style: const TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                "ID No. ${myProfileController.userProfileModel.value.personalData?.userId ?? ""}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ),
                          )
                        ]),
                    InkWell(
                      onTap: () {
                        LoginController().logOut(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(width: 10.w),
                          SvgPicture.asset(
                            ImageConstant.logout,
                            color: Colors.white,
                            height: 16.h,
                            width: 16.h,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Container(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: CustomExpansionTile(
                          controller:
                              personalDetailsController.userExpansionTile.value,
                          onExpansionChanged: (val) {
                            if(val){
                              personalDetailsController
                                  .markettingExpansionTile.value!
                                  .collapse();

                              personalDetailsController
                                  .toolsExpansionTile.value!
                                  .collapse();
                            }
                          },
                          childrenPadding: EdgeInsets.zero,
                          tilePadding: EdgeInsets.zero,
                          initiallyExpanded: true,
                          title: Container(
                            color: AppColors.darkBlue,
                            padding: EdgeInsets.all(5.sp),
                            width: MediaQuery.sizeOf(context).width * 0.7.w,
                            margin: EdgeInsets.only(top: 10.h),
                            child: const Center(
                              child: Text(
                                "USER",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          children: [
                            Container(
                              color:
                                  myProfileController.drawerDataList[0] == true
                                      ? const Color(0xFFFF8927)
                                      : Colors.white,
                              child: InkWell(
                                onTap: () {
                                  myProfileController.updateSelectedField(0);
                                  Navigator.pushNamed(context,
                                      AppRoutes.requestServiceOneScreen);
                                },
                                child: Items(
                                  icon: ImageConstant.newServiceIcon,
                                  itemText: "Request Service",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(1);
                                Navigator.pushNamed(
                                    context, AppRoutes.myServicesScreen);
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[1] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.myservice,
                                  itemText: "My Service",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(2);
                                Navigator.pushNamed(
                                    context, AppRoutes.myProfileScreen);
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[2] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.myprofile,
                                  itemText: "My Profile",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                myProfileController.updateSelectedField(3);
                                await personalDetailsController
                                    .getMagicLink(context);

                                // CustomAlretDialogs().comingSoonPopUp(
                                //     context,
                                //     "COMING...",
                                //     "My Business Profile will Coming soon");
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[3] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.myBusinessProfile,
                                  itemText: "My Business Profile",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(4);
                                Navigator.pushNamed(
                                    context, AppRoutes.documentVaultScreen);
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[4] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.myDocumntVaults,
                                  itemText: "My Document Vault",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(9);
                                Navigator.pushNamed(
                                    context, AppRoutes.myNotesListScreen);
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[9] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.myNotes,
                                  itemText: "My Notes",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: CustomExpansionTile(
                          onExpansionChanged: (val) {
                            if (val) {
                              personalDetailsController
                                  .userExpansionTile.value!
                                  .collapse();

                              personalDetailsController
                                  .toolsExpansionTile.value!
                                  .collapse();
                            }
                          },
                          controller: personalDetailsController
                              .markettingExpansionTile.value,
                          childrenPadding: EdgeInsets.zero,
                          tilePadding: EdgeInsets.zero,
                          initiallyExpanded: false,
                          title: Container(
                            color: AppColors.darkBlue,
                            padding: EdgeInsets.all(5.sp),
                            width: MediaQuery.sizeOf(context).width * 0.7.w,
                            child: const Center(
                              child: Text(
                                "MARKETING PARTNER",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          children: [
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(5);
                                Get.to(ConnectionMainScreen());
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[5] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.connect,
                                  itemText: "Connect",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(6);
                                Get.to(ConnectionListScreen());
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[6] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.myConnection,
                                  itemText: "My Connection",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(7);
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[7] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.myWallet,
                                  itemText: "My Wallet",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(8);
                                Navigator.pushNamed(
                                    context, AppRoutes.contactList);
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[8] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.mycontact,
                                  itemText: "My Contacts",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: CustomExpansionTile(
                          onExpansionChanged: (val) {
                            if (val) {
                              personalDetailsController
                                  .markettingExpansionTile.value!
                                  .collapse();

                              personalDetailsController
                                  .userExpansionTile.value!
                                  .collapse();
                            }
                          },
                          controller: personalDetailsController
                              .toolsExpansionTile.value,
                          childrenPadding: EdgeInsets.zero,
                          tilePadding: EdgeInsets.zero,
                          initiallyExpanded: false,
                          title: Container(
                            color: AppColors.darkBlue,
                            padding: EdgeInsets.all(5.sp),
                            width: MediaQuery.sizeOf(context).width * 0.7.w,
                            child: const Center(
                              child: Text(
                                "TOOLS & UTILITIES",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          children: [
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(10);
                                // Navigator.pop(context);
                                // Navigator.pushNamed(
                                //     context, AppRoutes.passwordSecurityScreen);
                                myProfileController
                                    .getMagicLinkForPassSecurity(context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) => WebViewScreen(
                                //               webViewUrl:
                                //                   "https://4everconnection.com/security/",
                                //             )));
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[10] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.passwordandSecurity,
                                  itemText: "Password & security",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(11);
                                // Navigator.pop(context);
                                myProfileController
                                    .getMagicLinkSupport(context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) => WebViewScreen(
                                //               webViewUrl:
                                //                   "https://4everconnection.com/help/",
                                //             )));
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[11] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.support,
                                  itemText: "Support",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(12);

                                CustomAlretDialogs().comingSoonPopUp(
                                    context,
                                    "COMING...",
                                    "Donate connection will Coming soon");
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[12] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.donateConnection,
                                  itemText: "Donate connection",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(13);
                                CustomAlretDialogs().comingSoonPopUp(
                                    context,
                                    "COMING...",
                                    "Make a wish will Coming soon");
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[13] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.markaWish,
                                  itemText: "Make a wish",
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                myProfileController.updateSelectedField(14);
                                LoginController().logOut(context);
                              },
                              child: Container(
                                color: myProfileController.drawerDataList[14] ==
                                        true
                                    ? const Color(0xFFFF8927)
                                    : Colors.white,
                                child: Items(
                                  icon: ImageConstant.logout,
                                  itemText: "Logout",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 25.h,
                color: const Color(0xFF1f718b),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.icon,
    required this.itemText,
  });
  final String icon;
  final String itemText;

  final Color grayColor = const Color(0xffEBEEF0);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            color: grayColor,
            width: 32.w,
            padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 10.sp),
            child: SvgPicture.asset(
              icon,
              height: 16.h,
              color: Colors.black.withOpacity(0.6),
            )),
        SizedBox(
          width: 10.h,
        ),
        Text(
          itemText,
          style: TextStyle(letterSpacing: 2.sp, fontSize: 16.sp),
        )
      ],
    );
  }
}
