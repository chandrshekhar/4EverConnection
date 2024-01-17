import 'package:cached_network_image/cached_network_image.dart';
import 'package:forever_connection/Feature/My%20Profile/Controller/user_profile_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:get/get.dart';

import '../password_security_screen/widgets/userpassword_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/core/utils/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';

// ignore: must_be_immutable
class PasswordSecurityScreen extends StatelessWidget {
  PasswordSecurityScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> passowrdSecurityDataList = [
    {
      "icon": ImageConstant.imgVideocameraLightBlue90001,
      "name": "Password",
      "desc":
          "Please update your password to provide added security to your account. Protect your information and your money.",
    },
    {
      "icon": ImageConstant.imgFingerprint,
      "name": "2-Step Varification",
      "desc":
          "Add an extra layer of security to your account by using a one-time security code in addition to your password each time you log in.",
    },
    {
      "icon": ImageConstant.imgCheckmark,
      "name": "Security Question",
      "desc":
          "For your protection, please choose 2 security questions. This way, we can verify it’s really you if there’s ever a doubt.",
    }
  ];

  final userProfileController = Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.lightBlue50,
        appBar: CustomAppBar(
            leadingWidth: 44.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                margin: EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
                onTap: () {
                  onTapArrowleftone(context);
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Password & Security"),
            actions: [
              AppbarImage1(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
                  },
                  svgPath: ImageConstant.imgCart,
                  margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 25.v))
            ],
            styleType: Style.bgShadow),
        body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 12.v),
            child: Column(children: [
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: const EdgeInsets.all(0),
                  color: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Container(
                      height: 310.v,
                      width: 366.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 18.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                margin: EdgeInsets.only(left: 1.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 47.h, vertical: 20.v),
                                decoration: AppDecoration.fillLightBlue
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder9),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 82.v),
                                      Text("User ID Number",
                                          style: CustomTextStyles
                                              .bodyMediumPrimary_1),
                                      Text(
                                          "${userProfileController.userProfileModel.value.personalData?.userId ?? ""}",
                                          style: CustomTextStyles
                                              .titleLargePrimary),
                                      SizedBox(height: 11.v),
                                      Text("E-mail",
                                          style: CustomTextStyles
                                              .bodyMediumPrimary_1),
                                      Text(
                                          "${userProfileController.userProfileModel.value.personalData?.personalEmail ?? ""}",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyles
                                              .bodyLargePrimary),
                                    ]))),
                        CachedNetworkImage(
                          imageUrl: userProfileController
                                  .userProfileModel.value.personalData?.photo ??
                              "", // Replace with the actual image URL
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 50,
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
                      ]))),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.h),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 11.v);
                    },
                    itemCount: passowrdSecurityDataList.length,
                    itemBuilder: (context, index) {
                      return UserpasswordItemWidget(
                          icon: passowrdSecurityDataList[index]['icon'],
                          name: passowrdSecurityDataList[index]['name'],
                          desc: passowrdSecurityDataList[index]['desc'],
                          onTap: () {});
                    }),
              )
            ])));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
