import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Auth%20Controller/login_controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
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
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.37,
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
                    height: 155.adaptSize,
                    width: 155.adaptSize,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.h,
                    vertical: 10.v,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login to Your Account",
                          style: theme.textTheme.headlineSmall,
                        ),
                        SizedBox(height: 40.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgUser,
                              height: 17.adaptSize,
                              width: 17.adaptSize,
                              margin: EdgeInsets.only(
                                top: 2.v,
                                bottom: 10.v,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                textInputType: TextInputType.emailAddress,
                                controller:
                                    loginController.userNameController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                labelText: "Username",
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
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                  value:
                                      loginController.rememberMeCheckBox.value,
                                  onChanged: (value) {
                                    loginController.rememberMe(value!);
                                  }),
                            ),
                            Text(
                              "Remember Me",
                              style: TextStyle(
                                fontSize: 21.adaptSize,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 50.v),
                        Obx(
                          () => CustomElevatedButton(
                            margin:
                                EdgeInsets.symmetric(horizontal: 40.adaptSize),
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
                                : Container(),
                            buttonStyle: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.buttonColor2)),
                            buttonTextStyle: CustomTextStyles.bodyLargePrimary,
                          ),
                        ),
                        SizedBox(height: 40.adaptSize),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.signUpScreen);
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "New User?   ",
                                  style: CustomTextStyles.bodyMediumGray600,
                                ),
                                TextSpan(
                                  text: "REGISTER",
                                  style: CustomTextStyles
                                      .titleSmallPrimaryContainer,
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
      ),
    );
  }
}
