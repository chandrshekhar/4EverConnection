import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forever_connection/Controllers/Auth%20Controller/signup_controller.dart';
import 'package:forever_connection/Services/Auth%20Services/auth_services.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/utils/address_search.dart';
import 'package:forever_connection/core/utils/alery_dailog.dart';
import 'package:forever_connection/core/utils/dob_formater.dart';
import 'package:forever_connection/core/utils/place_service.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_radio_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:forever_connection/widgets/phone_number_formating_widget.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();
  final signUpController = Get.put(SignupController());

  final zipCodeFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 30.h),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.h,
                        ),
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
                            SizedBox(height: 30.h),
                            Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Are you already a client?",
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Obx(
                                            () => CustomRadioButton(
                                              text: "Yes",
                                              value: "YES",
                                              groupValue: signUpController
                                                  .isAlreadyAccount.value,
                                              onChange: (value) {
                                                CustomAlretDialogs()
                                                    .openDialogforCheckClient(
                                                        context,
                                                        signUpController);
                                                signUpController
                                                    .checkAccount(value);
                                              },
                                            ),
                                          ),
                                          Obx(
                                            () => CustomRadioButton(
                                              text: "No",
                                              value: "No",
                                              groupValue: signUpController
                                                  .isAlreadyAccount.value,
                                              onChange: (value) {
                                                signUpController
                                                    .checkAccount(value);
                                                CustomAlretDialogs()
                                                    .openDialogForNoClient(
                                                        context,
                                                        signUpController);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                                    controller: signUpController
                                        .firstNameController.value,
                                    margin: EdgeInsets.only(left: 22.h),
                                    hintText: "First Name",
                                    labelText: "First Name",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 38.v),
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
                                    controller: signUpController
                                        .lastnameController.value,
                                    margin: EdgeInsets.only(left: 22.h),
                                    hintText: "Last Name",
                                    labelText: "Last Name",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 38.v),
                            PhoneNumberTextFieldWidget(
                                ignore: false,
                                phoneController: signUpController
                                    .mobileNumberController.value,
                                lable: "Mobile number"),
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
                                    textInputType: TextInputType.emailAddress,
                                    controller:
                                        signUpController.emailController.value,
                                    margin: EdgeInsets.only(left: 22.h),
                                    hintText: "Mail Address",
                                    labelText: "Mail Address",
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
                                padding:
                                    EdgeInsets.fromLTRB(20.h, 4.v, 20.h, 8.v),
                                child: Obx(
                                  () => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomRadioButton(
                                        text: "Male",
                                        value: "Male",
                                        groupValue: signUpController
                                            .selectedGender.value,
                                        onChange: (value) {
                                          signUpController
                                              .genderSelected(value);
                                        },
                                      ),
                                      CustomRadioButton(
                                        text: "Female",
                                        value: "Female",
                                        groupValue: signUpController
                                            .selectedGender.value,
                                        onChange: (value) {
                                          signUpController
                                              .genderSelected(value);
                                        },
                                      ),
                                      CustomRadioButton(
                                        text: "Other",
                                        value: "Other",
                                        groupValue: signUpController
                                            .selectedGender.value,
                                        onChange: (value) {
                                          signUpController
                                              .genderSelected(value);
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
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9/]")),
                                      LengthLimitingTextInputFormatter(10),
                                      CustomDateTextFormatter(),
                                    ],
                                    onChange: (value) {
                                      // signUpController.dobFormate(value,"/");
                                    },
                                    // onTap: () =>
                                    //     signUpController.selectDate(context),
                                    controller:
                                        signUpController.dobController.value,
                                    margin: EdgeInsets.only(left: 22.h),
                                    hintText: "MM/DD/YYYY",
                                    labelText: "Date of Birth ",
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }

                                      return null;
                                    },
                                    controller: signUpController
                                        .occupationController.value,
                                    margin: EdgeInsets.only(left: 22.h),
                                    hintText: "Occupation ",
                                    labelText: "Occupation ",
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
                                      top: 7.v, bottom: 4.v, right: 22.v),
                                ),
                                Expanded(
                                  child: CustomTextFormField(
                                    onTap: () async {
                                      // generate a new token here
                                      final sessionToken = const Uuid().v4();
                                      final Suggestion? result =
                                          await showSearch(
                                        context: context,
                                        delegate: AddressSearch(sessionToken),
                                      );
                                      // This will change the text displayed in the TextField
                                      if (result != null) {
                                        final placeDetails =
                                            await PlaceApiProvider(sessionToken)
                                                .getPlaceDetailFromId(
                                                    result.placeId);
                                        signUpController.addressController.value
                                            .text = result.description;
                                        signUpController.zipController.value
                                            .text = placeDetails.zipCode ?? "";
                                      }
                                      // ignore: use_build_context_synchronously
                                      FocusScope.of(context)
                                          .requestFocus(zipCodeFocus);
                                    },
                                    controller: signUpController
                                        .addressController.value,
                                    readOnly: true,
                                    //  margin: EdgeInsets.only(left: 0.h),
                                    labelText: "Address",
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
                                    focusNode: zipCodeFocus,
                                    controller:
                                        signUpController.aptController.value,
                                    margin: EdgeInsets.only(left: 22.h),
                                    labelText: "Apt Ste",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextFormField(
                                    controller:
                                        signUpController.zipController.value,
                                    margin: EdgeInsets.only(left: 22.h),
                                    hintText: "ZIP",
                                    labelText: "ZIP",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }

                                      return null;
                                    },
                                    controller: signUpController
                                        .businessNameController.value,
                                    margin: EdgeInsets.only(left: 22.h),
                                    hintText: "Your Business Name (If any)",
                                    labelText: "Your Business Name (If any)",
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
                                  child: Obx(
                                    () => CustomTextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'This field is required';
                                        }

                                        return null;
                                      },
                                      controller: signUpController
                                          .passwordController.value,
                                      margin: EdgeInsets.only(left: 22.h),
                                      hintText: "Password",
                                      labelText: "Password",
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      suffix: InkWell(
                                        onTap: () {
                                          signUpController.visiablePassword(
                                              !signUpController
                                                  .passwordVigiable.value);
                                        },
                                        child: Icon(
                                            signUpController
                                                    .passwordVigiable.value
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 18.h),
                                      ),
                                      suffixConstraints: BoxConstraints(
                                        maxHeight: 30.v,
                                      ),
                                      obscureText: !signUpController
                                          .passwordVigiable.value,
                                    ),
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
                                      style:
                                          CustomTextStyles.bodySmallGray600_1,
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
                                          text: "Spanish",
                                          value: "Spanish",
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
                                Obx(
                                  () => Checkbox(
                                      value: signUpController.aggrement.value,
                                      onChanged: (value) {
                                        signUpController
                                            .acceptAggrement(value!);
                                      }),
                                ),
                                Expanded(
                                  child: RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'By clicking Register Now, you agree to our  ',
                                        style: CustomTextStyles
                                            .bodySmallGray600Light,
                                      ),
                                      TextSpan(
                                        text: 'Terms of Service ',
                                        style: TextStyle(
                                            color: AppColors.darkBlue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            launch(
                                                'https://4everconnection.com/terms/');
                                          },
                                      ),
                                      TextSpan(
                                        text: 'and ',
                                        style: CustomTextStyles
                                            .bodySmallGray600Light,
                                      ),
                                      TextSpan(
                                        text: 'Privacy Policy ',
                                        style: TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            launch(
                                                'https://4everconnection.com/privacy/');
                                          },
                                      ),
                                      TextSpan(
                                        text:
                                            'You may receive SMS Notifications from us and can opt out any time.',
                                        style: CustomTextStyles
                                            .bodySmallGray600Light,
                                      ),
                                    ],
                                  )),
                                )
                              ],
                            ),
                            Obx(
                              () => signUpController.isRegisterLoadng.value ==
                                      true
                                  ? const Center(
                                      child:
                                          CircularProgressIndicator.adaptive())
                                  : CustomElevatedButton(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          signUpController.register(context);
                                        } else {
                                          print("pandey");
                                        }
                                      },
                                      text: "Register",
                                      buttonTextStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.adaptSize),
                                      buttonStyle: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  AppColors.darkBlue)),
                                      margin: EdgeInsets.only(
                                          top: 30.v,
                                          right: 50.adaptSize,
                                          left: 50.adaptSize),
                                      alignment: Alignment.topCenter,
                                    ),
                            ),
                            SizedBox(height: 20.h),
                            Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Joined us before?  ",
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
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      playerWidget()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget playerWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.adaptSize),
      decoration: BoxDecoration(
        color: AppColors.darkBlue.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Text(
            "Why Register?",
            style:
                TextStyle(fontSize: 22.adaptSize, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 200.h,
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.adaptSize)),
            child: Center(
                child: Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 60.adaptSize,
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: AppColors.buttonColor2,
                size: 18.adaptSize,
              ),
              Icon(
                Icons.star,
                color: AppColors.buttonColor2,
                size: 18.adaptSize,
              ),
              Icon(
                Icons.star,
                color: AppColors.buttonColor2,
                size: 18.adaptSize,
              ),
              Icon(
                Icons.star,
                color: AppColors.buttonColor2,
                size: 18.adaptSize,
              ),
              Icon(
                Icons.star,
                color: AppColors.buttonColor2,
                size: 18.adaptSize,
              ),
              Text("   5.0",
                  style: TextStyle(
                      fontSize: 17.adaptSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              Text(" (475 reviews)",
                  style: TextStyle(
                      fontSize: 17.adaptSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black))
            ],
          )
        ],
      ),
    );
  }
}
