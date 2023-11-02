import '../password_security_screen/widgets/userpassword_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
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
        body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 12.v),
                child: Container(
                    margin:
                        EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                    decoration: AppDecoration.fillLightblue50,
                    child: Column(children: [
                      Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: const EdgeInsets.all(0),
                          color: theme.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.roundedBorder16),
                          child: Container(
                              height: 348.v,
                              width: 366.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 41.h, vertical: 18.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            margin: EdgeInsets.only(left: 1.h),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 47.h,
                                                vertical: 20.v),
                                            decoration: AppDecoration
                                                .fillLightBlue
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder9),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(height: 82.v),
                                                  Text("User ID Number",
                                                      style: CustomTextStyles
                                                          .bodyMediumPrimary_1),
                                                  Text("004777",
                                                      style: CustomTextStyles
                                                          .titleLargePrimary),
                                                  SizedBox(height: 11.v),
                                                  Text("E-mail",
                                                      style: CustomTextStyles
                                                          .bodyMediumPrimary_1),
                                                  Text("smith94@gmail.com",
                                                      style: CustomTextStyles
                                                          .bodyLargePrimary),
                                                  SizedBox(height: 9.v),
                                                  Text("SMS",
                                                      style: CustomTextStyles
                                                          .bodyMediumPrimary_1),
                                                  Text("+12 ****** 117",
                                                      style: CustomTextStyles
                                                          .bodyLargePrimary)
                                                ]))),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgImage8112x112,
                                        height: 112.adaptSize,
                                        width: 112.adaptSize,
                                        radius: BorderRadius.circular(56.h),
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(top: 2.v))
                                  ]))),
                      SizedBox(height: 11.v),
                      ListView.separated(
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
                          })
                    ])))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
