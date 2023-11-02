import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Auth%20Controller/login_controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  bool englishName = false;

  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      backgroundColor: const Color(0xFF1B608C),
      body: SingleChildScrollView(
        child: SafeArea(
          // bottom: false,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 80.h),
                CustomImageView(
                  imagePath: ImageConstant.appLogo,
                  height: 190.adaptSize,
                  width: 190.adaptSize,
                ),
                SizedBox(height: 50.h),
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
                      SizedBox(height: 30.v),
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
                              controller:
                                  loginController.userNameController.value,
                              margin: EdgeInsets.only(left: 22.h),
                              hintText: "Username",
                              labelText: "Username",
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
                      SizedBox(height: 2.v),
                      GestureDetector(
                        onTap: () {},
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
                            child: Obx(
                              () => CustomTextFormField(
                                controller:
                                    loginController.passwordController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                hintText: "Password",
                                labelText: "Password",
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                  onTap: () {
                                    loginController.visiablePassword(
                                        !loginController
                                            .passwordVigiable.value);
                                  },
                                  child: Icon(
                                      !loginController.passwordVigiable.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      size: 18.h),
                                ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 30.v,
                                ),
                                obscureText:
                                    loginController.passwordVigiable.value,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  if (value.length < 7) {
                                    return "password should be 8 char";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.v),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.forgotPasswordScreen);
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
                          child: Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                    value: loginController
                                        .rememberMeCheckBox.value,
                                    onChanged: (value) {
                                      loginController.rememberMe(value!);
                                    }),
                              ),
                              const Text(
                                "Remember Me",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: 50.v),
                      Obx(
                        () => CustomElevatedButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              loginController.login(context);
                            }

                            // Navigator.pushNamed(
                            //     context, AppRoutes.dashboardScreen);
                          },
                          text: "Login",
                          rightIcon: loginController.isLoginLoading.value
                              ? const CircularProgressIndicator.adaptive()
                              : Container(
                                  margin: EdgeInsets.only(left: 16.h),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgArrowrightPrimary,
                                  ),
                                ),
                          buttonStyle: CustomButtonStyles.fillYellow,
                          buttonTextStyle: CustomTextStyles.bodyLargePrimary,
                        ),
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
                              Navigator.pushNamed(
                                  context, AppRoutes.signUpScreen);
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
      ),
    );
  }
}
