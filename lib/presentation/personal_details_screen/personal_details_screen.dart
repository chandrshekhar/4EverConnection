import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_radio_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PersonalDetailsScreen extends StatefulWidget {
  PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController phoneController1 = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController aptsteController = TextEditingController();

  TextEditingController zipvalueoneController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  List<String> radioList = ["lbl_male", "lbl_female", "lbl_other"];
  String gender = "lbl_male";

  TextEditingController socialSecurityNController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController countryController1 = TextEditingController();

  String radioGroup = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      onTapArrowleftone(context);
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
                                                          firstNameController,
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
                                                          nameController,
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
                                                          lastNameController,
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
                                                          phoneController,
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
                                                          phoneController1,
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
                                                          emailController,
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
                                                          addressController,
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
                                                  controller: aptsteController,
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
                                                      zipvalueoneController,
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
                                                          dateOfBirthController,
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
                                        child: Row(children: [
                                          CustomRadioButton(
                                              text: "Male",
                                              value: radioList[0],
                                              groupValue: gender,
                                              onChange: (value) {
                                                setState(() {
                                                  gender = value;
                                                });
                                              }),
                                          CustomRadioButton(
                                              text: "Female",
                                              value: radioList[1],
                                              groupValue: gender,
                                              margin:
                                                  EdgeInsets.only(left: 12.h),
                                              onChange: (value) {
                                                setState(() {
                                                  gender = value;
                                                });
                                              }),
                                          CustomRadioButton(
                                              text: "Other",
                                              value: radioList[2],
                                              groupValue: gender,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              onChange: (value) {
                                                setState(() {
                                                  gender = value;
                                                });
                                              })
                                        ])),
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
                                                      socialSecurityNController,
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
                                                  controller: countryController,
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
                                                      countryController1,
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
                                                      BoxConstraints(
                                                          maxHeight: 34.v)))
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
                                        child: Row(children: [
                                          CustomRadioButton(
                                              text: "Yes",
                                              value: "Yes",
                                              groupValue: radioGroup,
                                              onChange: (value) {
                                                setState(() {
                                                  radioGroup = value;
                                                });
                                              }),
                                          CustomRadioButton(
                                              text: "No",
                                              value: "No",
                                              groupValue: radioGroup,
                                              onChange: (value) {
                                                setState(() {
                                                  radioGroup = value;
                                                });
                                              }),
                                        ]))
                                  ])),
                          CustomElevatedButton(
                              text: "Save",
                              margin: EdgeInsets.only(
                                  left: 12.h, top: 21.v, right: 12.h),
                              rightIcon: Container(
                                  margin: EdgeInsets.only(left: 16.h),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgArrowrightPrimary))),
                          SizedBox(height: 9.v),
                          Text("Cancel", style: theme.textTheme.titleMedium)
                        ]))))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
