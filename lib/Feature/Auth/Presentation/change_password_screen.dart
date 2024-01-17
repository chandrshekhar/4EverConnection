import 'package:flutter/material.dart';
import 'package:forever_connection/core/utils/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.lightBlue50,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarImage(
              svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
              margin: EdgeInsets.only(left: 24.h, top: 20.v, bottom: 30.v),
              onTap: () {
                onTapArrowleftone(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Change Password "),
          actions: [
            AppbarImage1(
                svgPath: ImageConstant.imgCart,
                margin: EdgeInsets.fromLTRB(24.h, 15.v, 24.h, 24.v))
          ],
          styleType: Style.bgShadow),
      body: SafeArea(
        bottom: false,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 12.v),
            child: Container(
              margin: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
              decoration: AppDecoration.fillLightblue50,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 32.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCar,
                                      height: 17.adaptSize,
                                      width: 17.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 3.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: passwordController,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "Old password",
                                          labelText: "Old password",
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          suffix: Container(
                                              margin: EdgeInsets.only(
                                                  left: 30.h,
                                                  top: 6.v,
                                                  bottom: 6.v),
                                              child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgShare)),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 34.v),
                                          obscureText: true))
                                ]),
                            SizedBox(height: 41.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCar,
                                      height: 17.adaptSize,
                                      width: 17.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 3.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: newpasswordController,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "New password",
                                          labelText: "Confirm password",

                                          textInputType:
                                              TextInputType.visiblePassword,
                                          suffix: Container(
                                              margin: EdgeInsets.only(
                                                  left: 30.h,
                                                  top: 6.v,
                                                  bottom: 6.v),
                                              child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgShare)),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 34.v),
                                          obscureText: true))
                                ]),
                            SizedBox(height: 41.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCar,
                                      height: 17.adaptSize,
                                      width: 17.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 4.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: confirmpasswordController,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "Confirm password",
                                          labelText: "Confirm password",
                                          textInputAction: TextInputAction.done,
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          suffix: Container(
                                              margin: EdgeInsets.only(
                                                  left: 30.h,
                                                  top: 7.v,
                                                  bottom: 7.v),
                                              child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgShare)),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 34.v),
                                          obscureText: true))
                                ])
                          ])),
                  CustomElevatedButton(
                      text: "Save",
                      margin:
                          EdgeInsets.only(left: 12.h, top: 440.v, right: 12.h),
                      rightIcon: Container(
                          margin: EdgeInsets.only(left: 16.h),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgArrowrightPrimary)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
