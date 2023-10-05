import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.lightBlue90001,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 99.h,
                  vertical: 62.v,
                ),
                decoration: AppDecoration.fillLightBlue,
                child: CustomImageView(
                  svgPath: ImageConstant.imgVectorPrimary186x191,
                  height: 186.v,
                  width: 191.h,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 327.v),
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 58.v,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.customBorderTL94,
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Reset Password",
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 72.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgCar,
                          height: 17.adaptSize,
                          width: 17.adaptSize,
                          margin: EdgeInsets.symmetric(vertical: 7.v),
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            controller: passwordController,
                            margin: EdgeInsets.only(left: 22.h),
                            hintText: "Password",
                            textInputType: TextInputType.visiblePassword,
                            suffix: Container(
                              margin: EdgeInsets.only(
                                left: 30.h,
                                top: 6.v,
                                bottom: 6.v,
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgShare,
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                              maxHeight: 31.v,
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 45.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgCar,
                          height: 17.adaptSize,
                          width: 17.adaptSize,
                          margin: EdgeInsets.symmetric(vertical: 7.v),
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            controller: confirmpasswordController,
                            margin: EdgeInsets.only(left: 22.h),
                            hintText: "Confirm Password",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            suffix: Container(
                              margin: EdgeInsets.only(
                                left: 30.h,
                                top: 6.v,
                                bottom: 6.v,
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgShare,
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                              maxHeight: 31.v,
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(height: 16.v),
                    CustomElevatedButton(
                      text: "Submitting...",
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 11.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            7.h,
                          ),
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgEllipse627,
                          height: 14.adaptSize,
                          width: 14.adaptSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
