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
class RelationshipsScreen extends StatelessWidget {
  RelationshipsScreen({Key? key}) : super(key: key);

  TextEditingController relationshipsvaController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController phoneController1 = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController aptsteController = TextEditingController();

  TextEditingController zipController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  String radioGroup = "";

  TextEditingController group458Controller = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController countryController1 = TextEditingController();

  TextEditingController nameController1 = TextEditingController();

  TextEditingController phoneController2 = TextEditingController();

  TextEditingController businessfaxController = TextEditingController();

  TextEditingController businessemailController = TextEditingController();

  TextEditingController businessController = TextEditingController();

  TextEditingController vectorfourController = TextEditingController();

  TextEditingController myidealController = TextEditingController();

  TextEditingController vectorsevenController = TextEditingController();

  TextEditingController degreeController = TextEditingController();

  TextEditingController vectortenController = TextEditingController();

  TextEditingController addressController1 = TextEditingController();

  TextEditingController aptsteoneController = TextEditingController();

  TextEditingController ziponeController = TextEditingController();



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
                title: AppbarTitle(text: "Relationships"),
                actions: [
                  AppbarImage1(
                      svgPath: ImageConstant.imgCart,
                      margin: EdgeInsets.fromLTRB(24.h, 15.v, 24.h, 24.v))
                ],
                styleType: Style.bgShadow),
            body: SingleChildScrollView(
                padding: EdgeInsets.only(top: 11.v),
                child: Column(children: [
                  Container(
                     margin: EdgeInsets.only(
                    left: 12.h, right: 12.h, bottom: 5.v),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 26.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius:
                              BorderRadiusStyle.roundedBorder16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgUser,
                                height: 19.v,
                                width: 17.h,
                                margin: EdgeInsets.only(
                                    top: 6.v, bottom: 13.v)),
                            Expanded(
                                child: CustomTextFormField(
                                    controller:
                                        relationshipsvaController,
                                    margin: EdgeInsets.only(
                                        left: 22.h, top: 4.v),
                                    hintText: "Choose Relationship",
                                    suffix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 10.v, 15.h, 10.v),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgVectorGray6004x7)),
                                    suffixConstraints: BoxConstraints(
                                        maxHeight: 34.v)))
                          ])),
                  SizedBox(height: 11.v),
                  Container(
                     margin: EdgeInsets.only(
                        left: 12.h, right: 12.h, bottom: 5.v),
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.h, vertical: 12.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius:
                              BorderRadiusStyle.roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Personal Profile",
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 24.v),
                            Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgUser,
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
                                ]),
                            SizedBox(height: 38.v),
                            Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgUser,
                                      height: 19.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 4.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: nameController,
                                          margin: EdgeInsets.only(
                                              left: 22.h),
                                          hintText: "Middle Name"))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgUser,
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
                                ]),
                            SizedBox(height: 38.v),
                            Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCall,
                                      height: 15.adaptSize,
                                      width: 15.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 8.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: phoneController,
                                          margin: EdgeInsets.only(
                                              left: 24.h),
                                          hintText: "Mobile Phone",
                                          textInputType:
                                              TextInputType.phone))
                                ]),
                            SizedBox(height: 38.v),
                            Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCall,
                                      height: 15.adaptSize,
                                      width: 15.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 8.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: phoneController1,
                                          margin: EdgeInsets.only(
                                              left: 24.h),
                                          hintText: "Home Phone",
                                          textInputType:
                                              TextInputType.phone))
                                ]),
                            SizedBox(height: 38.v),
                            Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgVector,
                                      height: 17.adaptSize,
                                      width: 17.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 6.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: emailController,
                                          margin: EdgeInsets.only(
                                              left: 22.h),
                                          hintText: "Personal Email",
                                          textInputType: TextInputType
                                              .emailAddress))
                                ]),
                            SizedBox(height: 38.v),
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
                                          top: 4.v, bottom: 12.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: addressController,
                                          margin: EdgeInsets.only(
                                              left: 22.h),
                                          hintText: "Home Address"))
                                ]),
                            SizedBox(height: 39.v),
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
                                      controller: zipController,
                                      margin:
                                          EdgeInsets.only(left: 22.h),
                                      hintText: "ZIP")
                                ]),
                            SizedBox(height: 38.v),
                            Row(
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
                                          hintText: "Date of Birth"))
                                ]),
                            SizedBox(height: 27.v),
                            Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgLink,
                                  height: 19.adaptSize,
                                  width: 19.adaptSize,
                                  margin: EdgeInsets.only(top: 7.v)),
                              Padding(
                                  padding: EdgeInsets.only(left: 20.h),
                                  child: Text("Gender",
                                      style: theme.textTheme.bodyLarge))
                            ]),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 37.h,
                                        top: 11.v,
                                        right: 33.h),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomRadioButton(
                                              text: "Male",
                                              value: "Male",
                                              groupValue: radioGroup,
                                              onChange: (value) {
                                                radioGroup = value;
                                              }),
                                          Container(
                                              height: 16.adaptSize,
                                              width: 16.adaptSize,
                                              margin: EdgeInsets.only(
                                                  left: 12.h,
                                                  top: 6.v,
                                                  bottom: 4.v),
                                              decoration: BoxDecoration(
                                                  color: appTheme
                                                      .blueGray100,
                                                  borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                              8.h))),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.h),
                                              child: Text("Female",
                                                  style: theme.textTheme
                                                      .bodyLarge)),
                                          Container(
                                              height: 16.adaptSize,
                                              width: 16.adaptSize,
                                              margin: EdgeInsets.only(
                                                  left: 22.h,
                                                  top: 6.v,
                                                  bottom: 4.v),
                                              decoration: BoxDecoration(
                                                  color: appTheme
                                                      .blueGray100,
                                                  borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                              8.h))),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.h),
                                              child: Text("Other",
                                                  style: theme.textTheme
                                                      .bodyLarge))
                                        ]))),
                            SizedBox(height: 39.v),
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
                                              group458Controller,
                                          margin: EdgeInsets.only(
                                              left: 24.h),
                                          hintText:
                                              "Social Security Number",
                                          textInputType:
                                              TextInputType.number))
                                ]),
                            SizedBox(height: 40.v),
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
                            SizedBox(height: 40.v),
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
                            SizedBox(height: 14.v)
                          ])),
                  SizedBox(height: 13.v),
                  Container(
                     margin: EdgeInsets.only(
                        left: 12.h, right: 12.h, bottom: 5.v),
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.h, vertical: 25.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius:
                              BorderRadiusStyle.roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("Professional Profile",
                                    style:
                                        theme.textTheme.titleMedium)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 1.h, top: 28.v),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath:
                                              ImageConstant.imgFile,
                                          height: 20.v,
                                          width: 16.h,
                                          margin: EdgeInsets.only(
                                              top: 4.v, bottom: 12.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller:
                                                  nameController1,
                                              margin: EdgeInsets.only(
                                                  left: 23.h),
                                              hintText:
                                                  "Business Name"))
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
                                                  phoneController2,
                                              margin: EdgeInsets.only(
                                                  left: 24.h),
                                              hintText:
                                                  "Business Phone",
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
                                          svgPath: ImageConstant
                                              .imgVideocamera,
                                          height: 17.adaptSize,
                                          width: 17.adaptSize,
                                          margin: EdgeInsets.only(
                                              top: 6.v, bottom: 13.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller:
                                                  businessfaxController,
                                              margin: EdgeInsets.only(
                                                  left: 22.h),
                                              hintText: "Business Fax"))
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
                                                  businessemailController,
                                              margin: EdgeInsets.only(
                                                  left: 22.h),
                                              hintText:
                                                  "Business Email",
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
                                              ImageConstant.imgGlobe,
                                          height: 17.v,
                                          width: 19.h,
                                          margin: EdgeInsets.only(
                                              top: 6.v, bottom: 13.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller:
                                                  businessController,
                                              margin: EdgeInsets.only(
                                                  left: 20.h),
                                              hintText:
                                                  "Business Website"))
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
                                                  vectorfourController,
                                              margin: EdgeInsets.only(
                                                  left: 22.h),
                                              hintText: "Position",
                                              suffix: Container(
                                                  margin: EdgeInsets
                                                      .fromLTRB(
                                                          30.h,
                                                          12.v,
                                                          15.h,
                                                          12.v),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVectorGray6004x7)),
                                              suffixConstraints:
                                                  BoxConstraints(
                                                      maxHeight: 36.v)))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 1.h, top: 41.v),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgCarGray600,
                                          height: 17.adaptSize,
                                          width: 17.adaptSize,
                                          margin: EdgeInsets.only(
                                              top: 3.v, bottom: 14.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller:
                                                  myidealController,
                                              margin: EdgeInsets.only(
                                                  left: 22.h),
                                              hintText:
                                                  "My Ideal Occupation"))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 1.h, top: 39.v),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgVectorGray60018x22,
                                          height: 18.v,
                                          width: 22.h,
                                          margin: EdgeInsets.only(
                                              top: 6.v, bottom: 12.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller:
                                                  vectorsevenController,
                                              margin: EdgeInsets.only(
                                                  left: 17.h),
                                              hintText:
                                                  "Education Level",
                                              suffix: Container(
                                                  margin: EdgeInsets
                                                      .fromLTRB(
                                                          30.h,
                                                          12.v,
                                                          15.h,
                                                          12.v),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVectorGray6004x7)),
                                              suffixConstraints:
                                                  BoxConstraints(
                                                      maxHeight: 36.v)))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 1.h, top: 42.v),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgVectorGray60018x22,
                                          height: 18.v,
                                          width: 22.h,
                                          margin: EdgeInsets.only(
                                              top: 3.v, bottom: 12.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller:
                                                  degreeController,
                                              margin: EdgeInsets.only(
                                                  left: 17.h),
                                              hintText: "Degree"))
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
                                                  vectortenController,
                                              margin: EdgeInsets.only(
                                                  left: 22.h),
                                              hintText: "Affiliations",
                                              suffix: Container(
                                                  margin: EdgeInsets
                                                      .fromLTRB(
                                                          30.h,
                                                          12.v,
                                                          15.h,
                                                          12.v),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVectorGray6004x7)),
                                              suffixConstraints:
                                                  BoxConstraints(
                                                      maxHeight: 36.v)))
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
                                                  addressController1,
                                              margin: EdgeInsets.only(
                                                  left: 22.h),
                                              hintText:
                                                  "Business Address",
                                              suffix: Container(
                                                  margin: EdgeInsets
                                                      .fromLTRB(
                                                          30.h,
                                                          12.v,
                                                          15.h,
                                                          12.v),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVectorGray6004x7)),
                                              suffixConstraints:
                                                  BoxConstraints(
                                                      maxHeight: 36.v)))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 1.h, top: 40.v, bottom: 13.v),
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
                                              aptsteoneController,
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
                                          controller: ziponeController,
                                          margin: EdgeInsets.only(
                                              left: 22.h),
                                          hintText: "ZIP",
                                          textInputAction:
                                              TextInputAction.done)
                                    ]))
                          ])),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 12.h, top: 18.v, right: 12.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevatedButton(
                                width: 167.h,
                                text: "Save",
                                rightIcon: Container(
                                    margin: EdgeInsets.only(left: 16.h),
                                    child: CustomImageView(
                                        svgPath: ImageConstant
                                            .imgArrowrightPrimary))),
                            CustomElevatedButton(
                                width: 167.h,
                                text: "Delete",
                                margin: EdgeInsets.only(left: 8.h),
                                rightIcon: Container(
                                    margin: EdgeInsets.only(left: 16.h),
                                    child: CustomImageView(
                                        svgPath: ImageConstant
                                            .imgArrowrightPrimary)),
                                buttonStyle: CustomButtonStyles.fillRed)
                          ])),
                  SizedBox(height: 9.v),
                   CustomElevatedButton(
                                width: 167.h,
                                text: "Cancel",
                                margin: EdgeInsets.only(left: 8.h),
                                rightIcon: Container(
                                    margin: EdgeInsets.only(left: 16.h),
                                    child: CustomImageView(
                                        svgPath: ImageConstant
                                            .imgArrowrightPrimary)),
                                buttonStyle: CustomButtonStyles.fillLightBlueTL20),
                  
                ]))));
  }
}
