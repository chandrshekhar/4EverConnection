import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_radio_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import '../../Controllers/Personal Details Controller/personal_details-controller.dart';

// ignore_for_file: must_be_immutable
class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final personalDetailsController = Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.lightBlue50,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: 44.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                    margin:
                        EdgeInsets.only(left: 24.h, top: 20.v, bottom: 30.v),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Personal Details"),
                actions: [
                  AppbarImage1(
                      svgPath: ImageConstant.imgCart,
                      margin: EdgeInsets.fromLTRB(24.h, 15.v, 24.h, 24.v))
                ],
                styleType: Style.bgShadow),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 11.v),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 12.h, right: 12.h, bottom: 5.v),
                        child: Column(children: [
                          Container(
                              padding: EdgeInsets.all(11.h),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 1.h),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgUser,
                                                  height: 19.v,
                                                  width: 17.h,
                                                  margin: EdgeInsets.only(
                                                      top: 4.v, bottom: 13.v)),
                                              Expanded(
                                                  child: CustomTextFormField(
                                                      controller:
                                                          personalDetailsController
                                                              .firstNameController
                                                              .value,
                                                      margin: EdgeInsets.only(
                                                          left: 22.h),
                                                      hintText: "First Name"))
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.h, top: 39.v),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgUser,
                                                  height: 19.v,
                                                  width: 17.h,
                                                  margin: EdgeInsets.only(
                                                      top: 4.v, bottom: 13.v)),
                                              Expanded(
                                                  child: CustomTextFormField(
                                                      controller:
                                                          personalDetailsController
                                                              .middleNameController
                                                              .value,
                                                      margin: EdgeInsets.only(
                                                          left: 22.h),
                                                      hintText: "Middle Name"))
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.h, top: 40.v),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgUser,
                                                  height: 19.v,
                                                  width: 17.h,
                                                  margin: EdgeInsets.only(
                                                      top: 3.v, bottom: 13.v)),
                                              Expanded(
                                                  child: CustomTextFormField(
                                                      controller:
                                                          personalDetailsController
                                                              .lastNameController
                                                              .value,
                                                      margin: EdgeInsets.only(
                                                          left: 22.h),
                                                      hintText: "Last Name"))
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.h, top: 39.v),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgCall,
                                                  height: 15.adaptSize,
                                                  width: 15.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      top: 8.v, bottom: 13.v)),
                                              Expanded(
                                                  child: CustomTextFormField(
                                                      controller:
                                                          personalDetailsController
                                                              .mobilePhoneController
                                                              .value,
                                                      margin: EdgeInsets.only(
                                                          left: 24.h),
                                                      hintText: "Mobile Phone",
                                                      textInputType:
                                                          TextInputType.phone))
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.h, top: 39.v),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgCall,
                                                  height: 15.adaptSize,
                                                  width: 15.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      top: 8.v, bottom: 13.v)),
                                              Expanded(
                                                  child: CustomTextFormField(
                                                      controller:
                                                          personalDetailsController
                                                              .homePhoneController
                                                              .value,
                                                      margin: EdgeInsets.only(
                                                          left: 24.h),
                                                      hintText: "Home Phone",
                                                      textInputType:
                                                          TextInputType.phone))
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.h, top: 39.v),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgVector,
                                                  height: 17.adaptSize,
                                                  width: 17.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      top: 6.v, bottom: 13.v)),
                                              Expanded(
                                                  child: CustomTextFormField(
                                                      controller:
                                                          personalDetailsController
                                                              .personalEmailController
                                                              .value,
                                                      margin: EdgeInsets.only(
                                                          left: 22.h),
                                                      hintText:
                                                          "Personal Email",
                                                      textInputType:
                                                          TextInputType
                                                              .emailAddress))
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.h, top: 39.v),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgLocation,
                                                  height: 20.v,
                                                  width: 17.h,
                                                  margin: EdgeInsets.only(
                                                      top: 4.v, bottom: 12.v)),
                                              Expanded(
                                                  child: CustomTextFormField(
                                                      controller:
                                                          personalDetailsController
                                                              .homeAddressController
                                                              .value,
                                                      margin: EdgeInsets.only(
                                                          left: 22.h),
                                                      hintText: "Home Address"))
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.h, top: 40.v),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgLocation,
                                                  height: 20.v,
                                                  width: 17.h,
                                                  margin: EdgeInsets.only(
                                                      top: 3.v, bottom: 12.v)),
                                              CustomTextFormField(
                                                  width: 113.h,
                                                  controller:
                                                      personalDetailsController
                                                          .aptSteController
                                                          .value,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h, top: 2.v),
                                                  hintText: "Apt, Ste"),
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgLocation,
                                                  height: 20.v,
                                                  width: 17.h,
                                                  margin: EdgeInsets.only(
                                                      left: 43.h,
                                                      top: 3.v,
                                                      bottom: 12.v)),
                                              CustomTextFormField(
                                                  width: 109.h,
                                                  controller:
                                                      personalDetailsController
                                                          .zipController.value,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "ZIP")
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.h, top: 39.v),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgCalendar,
                                                  height: 19.v,
                                                  width: 17.h,
                                                  margin: EdgeInsets.only(
                                                      top: 4.v, bottom: 13.v)),
                                              Expanded(
                                                  child: CustomTextFormField(
                                                      controller:
                                                          personalDetailsController
                                                              .dobControlle
                                                              .value,
                                                      margin: EdgeInsets.only(
                                                          left: 22.h),
                                                      hintText:
                                                          "Date of Birth"))
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.h, top: 28.v),
                                        child: Row(children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgLink,
                                              height: 19.adaptSize,
                                              width: 19.adaptSize,
                                              margin:
                                                  EdgeInsets.only(top: 7.v)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              child: Text("Gender",
                                                  style: theme
                                                      .textTheme.bodyLarge))
                                        ])),
                                    SizedBox(height: 11.v),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Obx(
                                          () => Row(children: [
                                            CustomRadioButton(
                                                text: "Male",
                                                value: "Male",
                                                groupValue:
                                                    personalDetailsController
                                                        .radioGroup.value,
                                                onChange: (value) {
                                                  personalDetailsController
                                                      .selectGender(value);
                                                }),
                                            CustomRadioButton(
                                                text: "Female",
                                                value: "Female",
                                                groupValue:
                                                    personalDetailsController
                                                        .radioGroup.value,
                                                margin:
                                                    EdgeInsets.only(left: 12.h),
                                                onChange: (value) {
                                                  personalDetailsController
                                                      .selectGender(value);
                                                }),
                                            CustomRadioButton(
                                                text: "Other",
                                                value: "Other",
                                                groupValue:
                                                    personalDetailsController
                                                        .radioGroup.value,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                onChange: (value) {
                                                  personalDetailsController
                                                      .selectGender(value);
                                                })
                                          ]),
                                        )),
                                    SizedBox(height: 8.v)
                                  ])),
                          SizedBox(height: 10.v),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 19.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgCall,
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              margin: EdgeInsets.only(
                                                  top: 6.v, bottom: 13.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      personalDetailsController
                                                          .sociealsecurityController
                                                          .value,
                                                  margin: EdgeInsets.only(
                                                      left: 24.h),
                                                  hintText:
                                                      "Social Security Number",
                                                  textInputType:
                                                      TextInputType.number))
                                        ]),
                                    SizedBox(height: 41.v),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgLocation,
                                              height: 20.v,
                                              width: 17.h,
                                              margin: EdgeInsets.only(
                                                  top: 2.v, bottom: 12.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      personalDetailsController
                                                          .countruyofbirthControlle
                                                          .value,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Country of Birth",
                                                  suffix: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              30.h,
                                                              10.v,
                                                              15.h,
                                                              10.v),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgVectorGray6004x7)),
                                                  suffixConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 34.v)))
                                        ]),
                                    SizedBox(height: 41.v),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgLocation,
                                              height: 20.v,
                                              width: 17.h,
                                              margin: EdgeInsets.only(
                                                  top: 2.v, bottom: 12.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      personalDetailsController
                                                          .countryOfCitizenshipControlle
                                                          .value,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText:
                                                      "Country of Citizenship",
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  suffix: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              30.h,
                                                              10.v,
                                                              15.h,
                                                              10.v),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgVectorGray6004x7)),
                                                  suffixConstraints:
                                                      BoxConstraints(maxHeight: 34.v)))
                                        ]),
                                    SizedBox(height: 30.v),
                                    Row(children: [
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgVectorGray60015x17,
                                          height: 15.v,
                                          width: 17.h,
                                          margin: EdgeInsets.only(
                                              top: 5.v, bottom: 6.v)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 22.h),
                                          child: Text("Language Preferences",
                                              style: theme.textTheme.bodyLarge))
                                    ]),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 37.h, top: 9.v, bottom: 4.v),
                                        child: Obx(
                                          () => Row(children: [
                                            CustomRadioButton(
                                                text: "Yes",
                                                value: "Yes",
                                                groupValue:
                                                    personalDetailsController
                                                        .radioGroupLanguage
                                                        .value,
                                                onChange: (value) {
                                                  personalDetailsController
                                                      .selectLanguage(value);
                                                }),
                                            CustomRadioButton(
                                                text: "No",
                                                value: "No",
                                                groupValue:
                                                    personalDetailsController
                                                        .radioGroupLanguage
                                                        .value,
                                                onChange: (value) {
                                                  personalDetailsController
                                                      .selectLanguage(value);
                                                }),
                                          ]),
                                        ))
                                  ])),
                         
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.v),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomElevatedButton(
                                      buttonStyle: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red)),
                                      text: "Cancel",
                                      rightIcon: Container(
                                          margin: EdgeInsets.only(left: 16.h),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ))),
                                ),
                                SizedBox(width: 5.v),
                                Expanded(
                                  child: CustomElevatedButton(
                                      text: "Save",
                                      rightIcon: Container(
                                          margin: EdgeInsets.only(left: 16.h),
                                          child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowrightPrimary))),
                                ),
                              ],
                            ),
                          ),
                     
                          // Text("Cancel", style: theme.textTheme.titleMedium)
                        ]))))));
  }
}
