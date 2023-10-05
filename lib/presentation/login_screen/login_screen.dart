import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/custom_checkbox_button.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool englishName = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF1B608C),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80.h),
              CustomImageView(
                imagePath: ImageConstant.appLogo,
                height: 190.adaptSize,
                width: 190.adaptSize,
              ),
              SizedBox(height: 80.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 25.v,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusStyle.customBorderTL94,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 43.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgVector,
                          height: 17.adaptSize,
                          width: 17.adaptSize,
                          margin: EdgeInsets.only(
                            top: 2.v,
                            bottom: 10.v,
                          ),
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            controller: userNameController,
                            margin: EdgeInsets.only(left: 22.h),
                            hintText: "Username",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.v),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Use Face ID",
                          style: CustomTextStyles.titleSmallYellow900,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgCar,
                          height: 17.adaptSize,
                          width: 17.adaptSize,
                          margin: EdgeInsets.only(
                            top: 6.v,
                            bottom: 7.v,
                          ),
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            controller: passwordController,
                            margin: EdgeInsets.only(left: 22.h),
                            hintText: "Password",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            suffix: Container(
                              margin: EdgeInsets.only(
                                left: 30.h,
                                top: 7.v,
                                bottom: 7.v,
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgShare,
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                              maxHeight: 30.v,
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.v),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,AppRoutes.forgotPasswordScreen);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: CustomTextStyles.titleSmallYellow900,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomCheckboxButton(
                        alignment: Alignment.centerLeft,
                        text: "Remember me",
                        value: englishName,
                        onChange: (value) {
                          englishName = value;
                        },
                      ),
                    ),
                    SizedBox(height: 44.v),
                    CustomElevatedButton(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.dashboardScreen);
                      },
                      text: "Login",
                      rightIcon: Container(
                        margin: EdgeInsets.only(left: 16.h),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgArrowrightPrimary,
                        ),
                      ),
                      buttonStyle: CustomButtonStyles.fillYellow,
                      buttonTextStyle: CustomTextStyles.bodyLargePrimary,
                    ),
                    SizedBox(height: 8.v),
                    Text(
                      "OR",
                      style: CustomTextStyles.bodyMediumGray600_1,
                    ),
                    SizedBox(height: 9.v),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 28.v),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,AppRoutes.signUpScreen);
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "New User? ",
                                  style: CustomTextStyles.bodyMediumGray600,
                                ),
                                TextSpan(
                                  
                                  text: "Register Now",
                                  style: CustomTextStyles
                                      .titleSmallPrimaryContainer,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
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
    );
  }
}
