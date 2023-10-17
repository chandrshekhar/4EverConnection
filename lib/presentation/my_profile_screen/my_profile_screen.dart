import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_icon_button.dart';
import 'package:get/get.dart';

import '../../Controllers/User Profile Controller/user_profile_controller.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({Key? key}) : super(key: key);

  final myProfileController = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.lightBlue50,
            appBar: CustomAppBar(
                leadingWidth: 44.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                    margin:
                        EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "My Profile"),
                actions: [
                  AppbarImage1(
                      svgPath: ImageConstant.imgCart,
                      margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 25.v))
                ],
                styleType: Style.bgShadow),
            body: Obx(
              () => myProfileController.isLoadingProfileData == true
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : SingleChildScrollView(
                      padding: EdgeInsets.only(top: 10.v),
                      child: Container(
                          height: 947.v,
                          width: 366.h,
                          margin: EdgeInsets.only(
                              left: 12.h, right: 12.h, bottom: 5.v),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Container(
                                  decoration: AppDecoration.fillLightblue50,
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 41.h, vertical: 21.v),
                                      decoration: AppDecoration.outlineBlack
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder16),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                                width: 283.h,
                                                margin:
                                                    EdgeInsets.only(left: 1.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 61.h,
                                                    vertical: 10.v),
                                                decoration: AppDecoration
                                                    .fillLightBlue
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder9),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(height: 3.v),
                                                      SizedBox(
                                                          height: 144.v,
                                                          width: 152.h,
                                                          child: Stack(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              children: [
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgImage8,
                                                                    height: 144
                                                                        .adaptSize,
                                                                    width: 144
                                                                        .adaptSize,
                                                                    radius: BorderRadius
                                                                        .circular(72
                                                                            .h),
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft),
                                                                Positioned(
                                                                  left: 120.v,
                                                                  child: CustomIconButton(
                                                                      height: 35
                                                                          .adaptSize,
                                                                      width: 35
                                                                          .adaptSize,
                                                                      margin: EdgeInsets.only(
                                                                          bottom: 21
                                                                              .v),
                                                                      padding: EdgeInsets
                                                                          .all(8
                                                                              .h),
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomRight,
                                                                      child: CustomImageView(
                                                                          svgPath:
                                                                              ImageConstant.imgCamera)),
                                                                )
                                                              ])),
                                                      SizedBox(height: 9.v),
                                                      Text(
                                                          "${myProfileController.userProfileModel.value.personalData?.firstName}",
                                                          style: CustomTextStyles
                                                              .titleLargePrimary),
                                                      SizedBox(height: 1.v),
                                                      Text(
                                                          myProfileController
                                                                  .userProfileModel
                                                                  .value
                                                                  .personalData!
                                                                  .homeAddress ??
                                                              "",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: CustomTextStyles
                                                              .bodyMediumPrimary_1)
                                                    ])),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 1.h, top: 10.v),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 47.h,
                                                    vertical: 10.v),
                                                decoration: AppDecoration
                                                    .fillLightBlue
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder9),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          "${myProfileController.userProfileModel.value.personalData?.mobilePhone}",
                                                          style: CustomTextStyles
                                                              .titleMediumPrimary),
                                                      SizedBox(height: 3.v),
                                                      Text(
                                                          myProfileController
                                                                  .userProfileModel
                                                                  .value
                                                                  .personalData
                                                                  ?.personalEmail ??
                                                              "",
                                                          style: CustomTextStyles
                                                              .bodyLargePrimary)
                                                    ]))
                                          ]))),
                              SizedBox(height: 10.h),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 11.h, vertical: 10.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder16),
                                  child: SingleChildScrollView(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // SizedBox(height: 4.v),
                                          ListTile(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  AppRoutes.snapshotScreen);
                                            },
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            title: Text("Snapshot",
                                                style: theme
                                                    .textTheme.titleMedium),
                                            subtitle: Text(
                                                "User snapshot details",
                                                style: CustomTextStyles
                                                    .bodyMediumGray600_1),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12.h,
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  AppRoutes
                                                      .personalDetailsScreen);
                                            },
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            title: Text("Personal Details",
                                                style: theme
                                                    .textTheme.titleMedium),
                                            subtitle: Text(
                                                "User snapshot details",
                                                style: CustomTextStyles
                                                    .bodyMediumGray600_1),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12.h,
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  AppRoutes
                                                      .professionalProfileScreen);
                                            },
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            title: Text("professional Details ",
                                                style: theme
                                                    .textTheme.titleMedium),
                                            subtitle: Text(
                                                "User snapshot details",
                                                style: CustomTextStyles
                                                    .bodyMediumGray600_1),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12.h,
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  AppRoutes
                                                      .relationshipsScreen);
                                            },
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            title: Text("Relationships",
                                                style: theme
                                                    .textTheme.titleMedium),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12.h,
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  AppRoutes
                                                      .healthProfileScreen);
                                            },
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            title: Text("Health Profile",
                                                style: theme
                                                    .textTheme.titleMedium),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12.h,
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  AppRoutes
                                                      .financialProfileScreen);
                                            },
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            title: Text("Financial Profile",
                                                style: theme
                                                    .textTheme.titleMedium),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12.h,
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {},
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            title: Text("Protection",
                                                style: theme
                                                    .textTheme.titleMedium),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12.h,
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  AppRoutes
                                                      .documentVaultScreen);
                                            },
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            title: Text("Documents Vault",
                                                style: theme
                                                    .textTheme.titleMedium),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12.h,
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  AppRoutes.loginScreen);
                                            },
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            title: Text("Log Out",
                                                style: theme
                                                    .textTheme.titleMedium),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12.h,
                                            ),
                                          ),
                                        ]),
                                  ))
                            ]),
                          ))),
            )));
  }
}
