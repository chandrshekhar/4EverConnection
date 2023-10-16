import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Auth%20Controller/signup_controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_radio_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String radioGroup = "";

  String radioGroup1 = "";

  String radioGroup2 = "";

  bool byclickingregis = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final signUpController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF1B608C),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CustomImageView(
                  imagePath: ImageConstant.appLogo,
                  height: 190.adaptSize,
                  width: 190.adaptSize,
                ),
                SizedBox(height: 44.h),
                Container(
                  margin: EdgeInsets.only(bottom: 23.v),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.h,
                    vertical: 36.v,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusStyle.customBorderTL94,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.h, 24.v, 10.h, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Create Your Account",
                            style: theme.textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 65.v,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgUser,
                                height: 19.v,
                                width: 17.h,
                                margin: EdgeInsets.only(
                                  top: 5.v,
                                  bottom: 2.v,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 22.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Are you already a client?",
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomRadioButton(
                                          text: "Yes",
                                          value: "Yes",
                                          groupValue: radioGroup,
                                          onChange: (value) {
                                            setState(() {
                                              radioGroup = value;
                                            });
                                          },
                                        ),
                                        CustomRadioButton(
                                          text: "No",
                                          value: "No",
                                          groupValue: radioGroup,
                                          onChange: (value) {
                                            setState(() {
                                              radioGroup = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.v),
                        Row(
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgUser,
                              height: 19.v,
                              width: 17.h,
                              margin: EdgeInsets.only(
                                top: 7.v,
                                bottom: 5.v,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller:
                                    signUpController.firstNameController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                hintText: "Full Name",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Scan ID",
                                style: CustomTextStyles.bodyLarge16,
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgInfo,
                                height: 13.adaptSize,
                                width: 13.adaptSize,
                                margin: EdgeInsets.only(
                                  left: 8.h,
                                  top: 5.v,
                                  bottom: 5.v,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.v),
                        Row(
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgCall,
                              height: 15.adaptSize,
                              width: 15.adaptSize,
                              margin: EdgeInsets.only(
                                top: 9.v,
                                bottom: 7.v,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller: signUpController
                                    .mobileNumberController.value,
                                margin: EdgeInsets.only(left: 24.h),
                                hintText: "Mobile Number",
                                textInputType: TextInputType.phone,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.v),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgVector,
                              height: 17.adaptSize,
                              width: 17.adaptSize,
                              margin: EdgeInsets.only(
                                top: 7.v,
                                bottom: 10.v,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller:
                                    signUpController.emailController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                hintText: "Mail Address",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.v),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgVector,
                              height: 17.adaptSize,
                              width: 17.adaptSize,
                              margin: EdgeInsets.only(
                                top: 7.v,
                                bottom: 10.v,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller:
                                    signUpController.addressController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                hintText: "Confirm Mail Address",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.v),
                        Row(
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgUser,
                              height: 17.v,
                              width: 15.h,
                              margin: EdgeInsets.only(
                                top: 7.v,
                                bottom: 2.v,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: Text(
                                "Gender",
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20.h, 4.v, 20.h, 8.v),
                            child: Obx(
                              () => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomRadioButton(
                                    text: "Male",
                                    value: "Male",
                                    groupValue:
                                        signUpController.selectedGender.value,
                                    onChange: (value) {
                                      signUpController.genderSelected(value);
                                    },
                                  ),
                                  CustomRadioButton(
                                    text: "Female",
                                    value: "Female",
                                    groupValue:
                                        signUpController.selectedGender.value,
                                    onChange: (value) {
                                      signUpController.genderSelected(value);
                                    },
                                  ),
                                  CustomRadioButton(
                                    text: "Other",
                                    value: "Other",
                                    groupValue:
                                        signUpController.selectedGender.value,
                                    onChange: (value) {
                                      signUpController.genderSelected(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 38.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgCalendar,
                              height: 19.v,
                              width: 17.h,
                              margin: EdgeInsets.symmetric(vertical: 6.v),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller:
                                    signUpController.dobController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                hintText: "Date of Birth ",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgCarGray600,
                              height: 17.adaptSize,
                              width: 17.adaptSize,
                              margin: EdgeInsets.only(
                                top: 7.v,
                                bottom: 5.v,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller:
                                    signUpController.occupationController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                hintText: "Occupation ",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgLocation,
                              height: 20.v,
                              width: 17.h,
                              margin: EdgeInsets.only(
                                top: 7.v,
                                bottom: 4.v,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller:
                                    signUpController.addressController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                hintText: "Address",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.v),
                        Row(
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgLocation,
                              height: 20.v,
                              width: 17.h,
                              margin: EdgeInsets.only(
                                top: 4.v,
                                bottom: 2.v,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller:
                                    signUpController.aptController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                hintText: "Apt",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgLocation,
                              height: 20.v,
                              width: 17.h,
                              margin: EdgeInsets.only(
                                top: 6.v,
                                bottom: 4.v,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller:
                                    signUpController.zipController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                hintText: "ZIP",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgQrcode,
                              height: 20.v,
                              width: 17.h,
                              margin: EdgeInsets.only(
                                top: 2.v,
                                bottom: 8.v,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller: signUpController
                                    .businessNameController.value,
                                margin: EdgeInsets.only(left: 22.h),
                                hintText: "Your Business Name (If any)",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.v),
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
                                controller:
                                    signUpController.passwordController.value,
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
                        SizedBox(height: 38.v),
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
                                controller: signUpController
                                    .cnfPasswordController.value,
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
                        SizedBox(height: 38.v),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgVectorGray60015x17,
                              height: 15.v,
                              width: 17.h,
                              margin: EdgeInsets.only(
                                top: 5.v,
                                bottom: 6.v,
                              ),
                            ),
                            SizedBox(width: 2.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Language Preferences",
                                  style: theme.textTheme.bodyLarge,
                                ),
                                SizedBox(height: 3.v),
                                Text(
                                  "I want to receive Emails and Text Messages in:",
                                  style: CustomTextStyles.bodySmallGray600_1,
                                ),
                                Obx(
                                  () => Row(children: [
                                    CustomRadioButton(
                                      text: "English",
                                      value: "English",
                                      groupValue: signUpController
                                          .selectedlanguage.value,
                                      onChange: (value) {
                                        signUpController
                                            .languageSelected(value);
                                      },
                                    ),
                                    SizedBox(width: 20.h),
                                    CustomRadioButton(
                                      text: "Spenish",
                                      value: "Spenish",
                                      groupValue: signUpController
                                          .selectedlanguage.value,
                                      onChange: (value) {
                                        signUpController
                                            .languageSelected(value);
                                      },
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.v),
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Expanded(
                              child: Text(
                                "By clicking Register Now, you agree to our Terms of Service and Privacy Policy. You may receive SMS Notifications from us and can opt out any time.",
                              ),
                            )
                          ],
                        ),
                        // CustomCheckboxButton(
                        //   text:
                        //       "By clicking Register Now, you agree to our Terms of Service and Privacy Policy. You may receive SMS Notifications from us and can opt out any time.",
                        //   isExpandedText: true,
                        //   value: byclickingregis,
                        //   textStyle: CustomTextStyles.bodySmallGray600Light,
                        //   onChange: (value) {
                        //     byclickingregis = value;
                        //   },
                        // ),
                        CustomElevatedButton(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.loginScreen);
                          },
                          width: 342.h,
                          text: "Sign up",
                          margin: EdgeInsets.only(top: 30.v),
                          rightIcon: Container(
                            margin: EdgeInsets.only(left: 16.h),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgArrowrightPrimary,
                            ),
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        SizedBox(height: 10.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Joined us before? ",
                                  style: CustomTextStyles.bodyMediumGray600,
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            AppRoutes.loginScreen,
                                            (route) => false),
                                  text: "Login Now",
                                  style: CustomTextStyles
                                      .titleSmallPrimaryContainer,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 38.v),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            color: appTheme.blueGray100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.roundedBorder16,
                            ),
                            child: Container(
                              height: 174.v,
                              width: 325.h,
                              decoration: AppDecoration.fillBlueGray.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder16,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgImage24,
                                    height: 174.v,
                                    width: 325.h,
                                    radius: BorderRadius.circular(
                                      16.h,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 139.h,
                                        vertical: 63.v,
                                      ),
                                      decoration: AppDecoration
                                          .fillOnErrorContainer
                                          .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder16,
                                      ),
                                      child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgVectorYellow90002,
                                        height: 47.adaptSize,
                                        width: 47.adaptSize,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "******  ",
                                    style:
                                        CustomTextStyles.titleSmallYellow900),
                                TextSpan(
                                  text: "5.0 ",
                                  style: CustomTextStyles.bodyMediumGray600,
                                ),
                                TextSpan(
                                  text: "(457 reviews)",
                                  style: CustomTextStyles.bodySmallGray600,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20.v),
                            width: 249.h,
                            child: Text(
                              "Lorem ipsum dolor sit amet consectetur. Vel nibh tortor orci et nisl sed pellentesque lectus nec. Elementum enim neque volutpat duis diam varius vestibulum. Egestas molestie lobortis pellentesque elementum interdum sed scelerisque.",
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodySmallGray600Light10
                                  .copyWith(
                                height: 1.69,
                              ),
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
        ),
      ),
    );
  }
}
