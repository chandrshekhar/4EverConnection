import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forever_connection/Controllers/Personal%20Details%20Controller/personal_details-controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/alery_dailog.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/custom_expation_tile.dart';
import 'package:get/get.dart';

import '../Controllers/Auth Controller/login_controller.dart';
import '../Controllers/User Profile Controller/user_profile_controller.dart';
import '../Feature/Connection/Presentation/connection_list.dart';
import '../Feature/Connection/Presentation/connection_main_screen.dart';
import '../Feature/Wallet/View/My Wallet/my_wallet.dart';

class CustomDrawerWidget extends StatelessWidget {
  CustomDrawerWidget({super.key, required this.myProfileController});
  final UserProfileController myProfileController;
  final personalDetailsController = Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    String userName =
        "${myProfileController.userProfileModel.value.personalData?.firstName ?? ""}  ${myProfileController.userProfileModel.value.personalData?.lastName ?? ""}";
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.darkBlue,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.darkBlue,
                padding: EdgeInsets.only(
                    top: 20.h, left: 18.w, right: 16.w, bottom: 12.h),
                // margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            errorWidget: (context, url, error) => Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 60.sp,
                            ), // Widget to display when an error occurs
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  userName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.myProfileScreen);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  // width: 100,
                                  // height: 30,
                                  decoration: BoxDecoration(
                                      color: AppColors.buttonColor2,
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Center(
                                    child: Text(
                                      "MY PROFILE",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                "ID No. ${myProfileController.userProfileModel.value.personalData?.userId ?? ""}",
                                style: TextStyle(
                                    color: Colors.yellow[200],
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30.sp,
                            ),
                          )
                        ]),
                    // InkWell(
                    //   onTap: () {
                    //     LoginController().logOut(context);
                    //   },
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       const Text(
                    //         "Logout",
                    //         style: TextStyle(
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.white),
                    //       ),
                    //       SizedBox(width: 10.w),
                    //       SvgPicture.asset(
                    //         ImageConstant.logout,
                    //         color: Colors.white,
                    //         height: 16.h,
                    //         width: 16.h,
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              Column(
                children: [
                  CustomExpansionPanel(
                    leading: const Icon(Icons.person_outline),
                    collapsedBackgroundColor: AppColors.darkBlue,
                    initiallyExpanded: false,
                    backgroundColor: Colors.blue[50],
                    onExpansionChanged: (value) {
                      // personalDetailsController
                      //     .markettingExpansionTile.value!
                      //     .collapse();
                      // personalDetailsController.toolsExpansionTile.value!
                      //     .collapse();
                    },
                    title: "USER",
                    children: [
                      InkWell(
                        onTap: () {
                          // myProfileController.updateSelectedField(0);
                          Navigator.pushNamed(
                              context, AppRoutes.requestServiceOneScreen);
                        },
                        child: Items(
                          icon: ImageConstant.newServiceIcon,
                          itemText: "Request Service",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          myProfileController.updateSelectedField(1);
                          Navigator.pushNamed(
                              context, AppRoutes.myServicesScreen);
                        },
                        child: Items(
                          icon: ImageConstant.myservice,
                          itemText: "My Service",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          myProfileController.updateSelectedField(2);
                          Navigator.pushNamed(
                              context, AppRoutes.myProfileScreen);
                        },
                        child: Items(
                          icon: ImageConstant.myprofile,
                          itemText: "My Profile",
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          myProfileController.updateSelectedField(3);
                          await personalDetailsController.getMagicLink(context);
                        },
                        child: Items(
                          icon: ImageConstant.myBusinessProfile,
                          itemText: "My Business Profile",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          myProfileController.updateSelectedField(4);
                          Navigator.pushNamed(
                              context, AppRoutes.documentVaultScreen);
                        },
                        child: Items(
                          icon: ImageConstant.myDocumntVaults,
                          itemText: "My Document Vault",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          myProfileController.updateSelectedField(9);
                          Navigator.pushNamed(
                              context, AppRoutes.myNotesListScreen);
                        },
                        child: Items(
                          icon: ImageConstant.myNotes,
                          itemText: "My Notes",
                        ),
                      ),
                    ],
                  ),
                  CustomExpansionPanel(
                    collapsedBackgroundColor: AppColors.darkBlue,
                    onExpansionChanged: (val) {
                      // personalDetailsController.userExpansionTile.value!
                      //     .collapse();

                      // personalDetailsController.toolsExpansionTile.value!
                      //     .collapse();
                    },
                    leading: const Icon(Icons.handshake_outlined),
                    initiallyExpanded: false,
                    title: "MARKETING PARTNER",
                    children: [
                      InkWell(
                        onTap: () {
                          myProfileController.updateSelectedField(5);
                          Get.to(ConnectionMainScreen());
                        },
                        child: Items(
                          icon: ImageConstant.connect,
                          itemText: "Connect",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          myProfileController.updateSelectedField(6);
                          Get.to(ConnectionListScreen());
                        },
                        child: Items(
                          icon: ImageConstant.myConnection,
                          itemText: "My Connection",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          myProfileController.updateSelectedField(7);
                          Get.to(const MyWalletScreen());
                        },
                        child: Items(
                          icon: ImageConstant.myWallet,
                          itemText: "My Wallet",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          myProfileController.updateSelectedField(8);
                          Navigator.pushNamed(context, AppRoutes.contactList);
                        },
                        child: Items(
                          icon: ImageConstant.mycontact,
                          itemText: "My Contacts",
                        ),
                      ),
                    ],
                  ),
                  CustomExpansionPanel(
                    onExpansionChanged: (val) {},
                    leading: const Icon(Icons.construction_outlined),
                    collapsedBackgroundColor: AppColors.darkBlue,
                    initiallyExpanded: false,
                    title: "TOOLS & UTILITIES",
                    children: [
                      InkWell(
                        onTap: () {
                          myProfileController
                              .getMagicLinkForPassSecurity(context);
                        },
                        child: Items(
                          icon: ImageConstant.passwordandSecurity,
                          itemText: "Password & security",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          myProfileController.updateSelectedField(11);
                          // Navigator.pop(context);
                          myProfileController.getMagicLinkSupport(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => WebViewScreen(
                          //               webViewUrl:
                          //                   "https://4everconnection.com/help/",
                          //             )));
                        },
                        child: Items(
                          icon: ImageConstant.support,
                          itemText: "Support",
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
                        child: Items(
                          icon: ImageConstant.donateConnection,
                          itemText: "Donate connection",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          myProfileController.updateSelectedField(13);
                          // CustomAlretDialogs().comingSoonPopUp(
                          //     context,
                          //     "COMING...",
                          //     "Make a wish will Coming soon");
                          myProfileController.getMagicLinkMakeAWish(context);
                        },
                        child: Items(
                          icon: ImageConstant.markaWish,
                          itemText: "Make a wish",
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    onTap: () {
                      LoginController().logOut(context);
                    },
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Transform.translate(
                      offset: Offset(-15.w, 0),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
    return Column(
      children: [
        Container(height: 0.5.h, color: AppColors.darkBlue),
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  color: grayColor,
                  width: 40.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.sp, vertical: 16.sp),
                  child: SvgPicture.asset(
                    icon,
                    height: 15.h,
                    width: 15.h,
                    fit: BoxFit.fill,
                    color: AppColors.darkBlue,
                  )),
              SizedBox(
                width: 10.h,
              ),
              Text(
                itemText,
                style: TextStyle(fontSize: 16.sp, color: AppColors.darkBlue),
              )
            ],
          ),
        ),
      ],
    );
  }
}
