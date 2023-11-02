import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Relationship%20Controller/relationship_controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/utils/address_autocomplete_widget.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_radio_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

// ignore_for_file: must_be_immutable
class RelationshipsScreen extends StatelessWidget {
  RelationshipsScreen({Key? key}) : super(key: key);

  final relationshipController = Get.put(RelationShipController());

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
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.notificationsScreen);
                      },
                      svgPath: ImageConstant.imgCart,
                      margin: EdgeInsets.fromLTRB(24.h, 15.v, 24.h, 24.v))
                ],
                styleType: Style.bgShadow),
            body: SingleChildScrollView(
                padding: EdgeInsets.only(top: 11.v),
                child: Column(children: [
                  Container(
                      margin:
                          EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 26.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgUser,
                                height: 19.v,
                                width: 17.h,
                                margin:
                                    EdgeInsets.only(top: 6.v, bottom: 13.v)),
                            Expanded(
                                child: CustomTextFormField(
                                    controller: relationshipController
                                        .relationshipsvaController.value,
                                    margin:
                                        EdgeInsets.only(left: 22.h, top: 4.v),
                                    labelText: "Choose Relationship",
                                    suffix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 10.v, 15.h, 10.v),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgVectorGray6004x7)),
                                    suffixConstraints:
                                        BoxConstraints(maxHeight: 34.v)))
                          ])),
                  SizedBox(height: 11.v),
                  Container(
                      margin:
                          EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.h, vertical: 12.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Personal Profile",
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 24.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgUser,
                                      height: 19.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 4.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: relationshipController
                                              .firstNameController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          labelText: "First Name"))
                                ]),
                            SizedBox(height: 38.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgUser,
                                      height: 19.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 4.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: relationshipController
                                              .middlenameController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          labelText: "Middle Name"))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgUser,
                                      height: 19.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 3.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: relationshipController
                                              .lastNameController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          labelText: "Last Name"))
                                ]),
                            SizedBox(height: 38.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCall,
                                      height: 15.adaptSize,
                                      width: 15.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 8.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: relationshipController
                                              .phoneController.value,
                                          margin: EdgeInsets.only(left: 24.h),
                                          labelText: "Mobile Phone",
                                          textInputType: TextInputType.phone))
                                ]),
                            SizedBox(height: 38.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCall,
                                      height: 15.adaptSize,
                                      width: 15.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 8.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: relationshipController
                                              .homephoneController.value,
                                          margin: EdgeInsets.only(left: 24.h),
                                          labelText: "Home Phone",
                                          textInputType: TextInputType.phone))
                                ]),
                            SizedBox(height: 38.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgVector,
                                      height: 17.adaptSize,
                                      width: 17.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 6.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: relationshipController
                                              .emailController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          labelText: "Personal Email",
                                          textInputType:
                                              TextInputType.emailAddress))
                                ]),
                            SizedBox(height: 38.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLocation,
                                      height: 20.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 4.v, bottom: 12.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          onTap: () async {
                                            var address = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddressAutoCompleteWidget(),
                                              ),
                                            );
                                            relationshipController
                                                .homeaddressController
                                                .value
                                                .text = address;
                                          },
                                          controller: relationshipController
                                              .homeaddressController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          labelText: "Home Address"))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLocation,
                                      height: 20.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 3.v, bottom: 12.v)),
                                  CustomTextFormField(
                                      width: 113.h,
                                      controller: relationshipController
                                          .aptsteContoller.value,
                                      margin:
                                          EdgeInsets.only(left: 22.h, top: 2.v),
                                      labelText: "Apt, Ste"),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLocation,
                                      height: 20.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          left: 43.h, top: 3.v, bottom: 12.v)),
                                  CustomTextFormField(
                                      width: 109.h,
                                      controller: relationshipController
                                          .zipController.value,
                                      margin: EdgeInsets.only(left: 22.h),
                                      labelText: "ZIP")
                                ]),
                            SizedBox(height: 38.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCalendar,
                                      height: 19.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 4.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: relationshipController
                                              .dateOfBirthController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          labelText: "Date of Birth"))
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
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 30.h, top: 5.v, right: 33.h),
                                    child: Obx(
                                      () => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomRadioButton(
                                                text: "Male",
                                                value: "Male",
                                                groupValue:
                                                    relationshipController
                                                        .radioGroup.value,
                                                onChange: (value) {
                                                  relationshipController
                                                      .selectGender(value);
                                                }),
                                            CustomRadioButton(
                                                text: "Female",
                                                value: "Female",
                                                groupValue:
                                                    relationshipController
                                                        .radioGroup.value,
                                                onChange: (value) {
                                                  relationshipController
                                                      .selectGender(value);
                                                }),
                                            CustomRadioButton(
                                                text: "Other",
                                                value: "Other",
                                                groupValue:
                                                    relationshipController
                                                        .radioGroup.value,
                                                onChange: (value) {
                                                  relationshipController
                                                      .selectGender(value);
                                                }),
                                          ]),
                                    ))),
                            SizedBox(height: 25.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCall,
                                      height: 15.adaptSize,
                                      width: 15.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 6.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: relationshipController
                                              .socielsecurityNumber.value,
                                          margin: EdgeInsets.only(left: 24.h),
                                          labelText: "Social Security Number",
                                          textInputType: TextInputType.number))
                                ]),
                            SizedBox(height: 40.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLocation,
                                      height: 20.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 2.v, bottom: 12.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: relationshipController
                                              .birthcountryController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          labelText: "Country of Birth",
                                          suffix: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  30.h, 10.v, 15.h, 10.v),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgVectorGray6004x7)),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 34.v)))
                                ]),
                            SizedBox(height: 40.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLocation,
                                      height: 20.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 2.v, bottom: 12.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: relationshipController
                                              .birthcitizencountryController
                                              .value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          labelText: "Country of Citizenship",
                                          suffix: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  30.h, 10.v, 15.h, 10.v),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgVectorGray6004x7)),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 34.v)))
                                ]),
                            SizedBox(height: 14.v)
                          ])),
                  SizedBox(height: 13.v),
                  Container(
                      margin:
                          EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.h, vertical: 25.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("Professional Profile",
                                    style: theme.textTheme.titleMedium)),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 28.v),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgFile,
                                          height: 20.v,
                                          width: 16.h,
                                          margin: EdgeInsets.only(
                                              top: 4.v, bottom: 12.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller: relationshipController
                                                  .businessnameController.value,
                                              margin:
                                                  EdgeInsets.only(left: 23.h),
                                              labelText: "Business Name"))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 39.v),
                                child: Row(
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
                                              controller: relationshipController
                                                  .businessphoneController
                                                  .value,
                                              margin:
                                                  EdgeInsets.only(left: 24.h),
                                              labelText: "Business Phone",
                                              textInputType:
                                                  TextInputType.phone))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 39.v),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgVideocamera,
                                          height: 17.adaptSize,
                                          width: 17.adaptSize,
                                          margin: EdgeInsets.only(
                                              top: 6.v, bottom: 13.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller: relationshipController
                                                  .businessfaxController.value,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              labelText: "Business Fax"))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 39.v),
                                child: Row(
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
                                              controller: relationshipController
                                                  .businessemailController
                                                  .value,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              labelText: "Business Email",
                                              textInputType:
                                                  TextInputType.emailAddress))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 39.v),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgGlobe,
                                          height: 17.v,
                                          width: 19.h,
                                          margin: EdgeInsets.only(
                                              top: 6.v, bottom: 13.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller: relationshipController
                                                  .businesswebsitecontroller
                                                  .value,
                                              margin:
                                                  EdgeInsets.only(left: 20.h),
                                              labelText: "Business Website"))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 39.v),
                                child: Row(
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
                                              controller: relationshipController
                                                  .businessPositionController
                                                  .value,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              labelText: "Position",
                                              suffix: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      30.h, 12.v, 15.h, 12.v),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVectorGray6004x7)),
                                              suffixConstraints: BoxConstraints(
                                                  maxHeight: 36.v)))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 41.v),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgCarGray600,
                                          height: 17.adaptSize,
                                          width: 17.adaptSize,
                                          margin: EdgeInsets.only(
                                              top: 3.v, bottom: 14.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller: relationshipController
                                                  .myidealController.value,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              labelText: "My Ideal Occupation"))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 39.v),
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
                                              controller: relationshipController
                                                  .educationlevelcontroller
                                                  .value,
                                              margin:
                                                  EdgeInsets.only(left: 17.h),
                                              labelText: "Education Level",
                                              suffix: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      30.h, 12.v, 15.h, 12.v),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVectorGray6004x7)),
                                              suffixConstraints: BoxConstraints(
                                                  maxHeight: 36.v)))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 42.v),
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
                                              controller: relationshipController
                                                  .degreeController.value,
                                              margin:
                                                  EdgeInsets.only(left: 17.h),
                                              labelText: "Degree"))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 39.v),
                                child: Row(
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
                                              controller: relationshipController
                                                  .affiliationsController.value,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              labelText: "Affiliations",
                                              suffix: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      30.h, 12.v, 15.h, 12.v),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVectorGray6004x7)),
                                              suffixConstraints: BoxConstraints(
                                                  maxHeight: 36.v)))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h, top: 39.v),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgLocation,
                                          height: 20.v,
                                          width: 17.h,
                                          margin: EdgeInsets.only(
                                              top: 4.v, bottom: 12.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              onTap: () async {
                                                var address =
                                                    await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddressAutoCompleteWidget(),
                                                  ),
                                                );
                                                relationshipController
                                                    .businessAddressaddressController
                                                    .value
                                                    .text = address;
                                              },
                                              controller: relationshipController
                                                  .businessAddressaddressController
                                                  .value,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              labelText: "Business Address",
                                              suffix: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      30.h, 12.v, 15.h, 12.v),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVectorGray6004x7)),
                                              suffixConstraints: BoxConstraints(
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
                                          svgPath: ImageConstant.imgLocation,
                                          height: 20.v,
                                          width: 17.h,
                                          margin: EdgeInsets.only(
                                              top: 3.v, bottom: 12.v)),
                                      CustomTextFormField(
                                          width: 113.h,
                                          controller: relationshipController
                                              .businessaptsteoneController
                                              .value,
                                          margin: EdgeInsets.only(
                                              left: 22.h, top: 2.v),
                                          labelText: "Apt, Ste"),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgLocation,
                                          height: 20.v,
                                          width: 17.h,
                                          margin: EdgeInsets.only(
                                              left: 43.h,
                                              top: 3.v,
                                              bottom: 12.v)),
                                      CustomTextFormField(
                                          width: 109.h,
                                          controller: relationshipController
                                              .businessziponeController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          labelText: "ZIP",
                                          textInputAction: TextInputAction.done)
                                    ]))
                          ])),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 12.h, top: 18.v, right: 12.h),
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
                  // CustomElevatedButton(
                  //     width: 167.h,
                  //     text: "Cancel",
                  //     margin: EdgeInsets.only(left: 8.h),
                  //     rightIcon: Container(
                  //         margin: EdgeInsets.only(left: 16.h),
                  //         child: CustomImageView(
                  //             svgPath: ImageConstant.imgArrowrightPrimary)),
                  //     buttonStyle: CustomButtonStyles.fillLightBlueTL20),
                ]))));
  }
}
