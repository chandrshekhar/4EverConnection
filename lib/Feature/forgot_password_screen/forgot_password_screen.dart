import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

import '../../Controllers/Auth Controller/forgot_password_controller.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key})
      : super(
          key: key,
        );
  TextEditingController mobileNumberController = TextEditingController();
  final forgetPasswordController = Get.put(ForgotPasswordController());
  final _formKey = GlobalKey<FormState>();
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
              SizedBox(height: 50.v),
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
                    Form(
                      key: _formKey,
                      child: Row(
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
                              controller: forgetPasswordController
                                  .emailController.value,
                              margin: EdgeInsets.only(left: 21.h),
                              hintText: "Email ID",
                              hintStyle: CustomTextStyles.bodyMediumGray600_1,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80.v),
                    Obx(
                      () => forgetPasswordController.isLoginLoading.value
                          ? const CircularProgressIndicator.adaptive()
                          : CustomElevatedButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  forgetPasswordController
                                      .sednEmailForOtp(context);
                                }
                              },
                              text: "Send Login Link",
                              rightIcon: Container(
                                margin: EdgeInsets.only(left: 16.h),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightPrimary,
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: 40.v),
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushNamed(
                                  context, AppRoutes.loginScreen),
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
