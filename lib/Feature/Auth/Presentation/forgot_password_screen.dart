import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:forever_connection/theme/custom_text_style.dart';
import 'package:forever_connection/theme/theme_helper.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

import '../../../Controllers/Auth Controller/forgot_password_controller.dart';

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
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.fill
                    // fit: BoxFit.cover,
                    ),
              ),
              child: Center(
                child: CustomImageView(
                  imagePath: ImageConstant.appLogo,
                  height: 155.h,
                  width: 155.w,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.customBorderTL94,
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 15.h),
                      Text(
                        "Trouble Logging in?",
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        "let’s get you a new one",
                        style: CustomTextStyles.titleMedium18,
                      ),
                      Container(
                        width: 282.h,
                        margin: EdgeInsets.only(
                          left: 29.w,
                          top: 8.h,
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
                      SizedBox(height: 50.h),
                      Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgVector,
                              height: 17.h,
                              width: 17.w,
                              margin: EdgeInsets.only(
                                top: 2.h,
                                bottom: 10.h,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller: forgetPasswordController
                                    .emailController.value,
                                margin: EdgeInsets.only(left: 21.h),
                                hintText: "Email ID",
                                labelText: "Email ID",
                                hintStyle: CustomTextStyles.bodyMediumGray600_1,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return "Please enter a valid email address";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 70.h),
                      Obx(
                        () => forgetPasswordController.isLoginLoading.value
                            ? const CircularProgressIndicator.adaptive()
                            : CustomElevatedButton(
                                buttonStyle: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColors.darkBlue)),
                                margin: EdgeInsets.symmetric(horizontal: 40.w),
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    forgetPasswordController
                                        .sednEmailForOtp(context);
                                  }
                                },
                                text: "Send Login Link",
                              ),
                      ),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.loginScreen);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Back to ",
                                style: CustomTextStyles.bodyMediumGray600,
                              ),
                              TextSpan(
                                text: "Login",
                                style:
                                    CustomTextStyles.titleSmallPrimaryContainer,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
