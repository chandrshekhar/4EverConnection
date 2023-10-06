import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.lightBlue90001,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 89.v),
              CustomImageView(
                svgPath: ImageConstant.imgVectorPrimary,
                height: 203.v,
                width: 194.h,
              ),
               SizedBox(height:50.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 33.v,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.customBorderTL94,
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 25.v),
                    Text(
                      "Trouble Logging in?",
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 25.v),
                    Text(
                      "let’s get you a new one",
                      style: CustomTextStyles.titleMedium18,
                    ),
                    Container(
                      width: 282.h,
                      margin: EdgeInsets.only(
                        left: 29.h,
                        top: 8.v,
                        right: 29.h,
                      ),
                      child: Text(
                        "Please enter your email address. You will receive an OTP to create a new password via e-mail.",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyMediumOnErrorContainer_1,
                      ),
                    ),
                    SizedBox(height: 70.v),
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
                            controller: mobileNumberController,
                            margin: EdgeInsets.only(left: 21.h),
                            hintText: "Email ID / Mobile Number",
                            hintStyle: CustomTextStyles.bodyMediumGray600_1,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 54.v),
                    CustomElevatedButton(
                      onTap: () {
                        Navigator.pushNamed(context,AppRoutes.resetPasswordScreen);
                      },
                      text: "Send Login Link",
                      rightIcon: Container(
                        margin: EdgeInsets.only(left: 16.h),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgArrowrightPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Back to ",
                            style: CustomTextStyles.bodyMediumGray600,
                          ),
                          TextSpan(
                            text: "Login",
                            style: CustomTextStyles.titleSmallPrimaryContainer,
                            recognizer: TapGestureRecognizer()..onTap = () =>  Navigator.pushNamed(context, AppRoutes.loginScreen),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
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
