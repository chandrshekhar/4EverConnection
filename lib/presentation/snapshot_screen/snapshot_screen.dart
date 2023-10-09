import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_radio_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

import '../../Controllers/Snapshot Controller/snapshot_controller.dart';

// ignore_for_file: must_be_immutable
class SnapshotScreen extends StatefulWidget {
  SnapshotScreen({Key? key}) : super(key: key);

  @override
  State<SnapshotScreen> createState() => _SnapshotScreenState();
}

class _SnapshotScreenState extends State<SnapshotScreen> {
  final snapshotController = Get.put(UserSnapshotController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: appTheme.lightBlue50,
            appBar: CustomAppBar(
                leadingWidth: 44.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                    margin:
                        EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Snapshot"),
                actions: [
                  AppbarImage1(
                      svgPath: ImageConstant.imgCart,
                      margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 25.v))
                ],
                styleType: Style.bgShadow),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 11.v),
                    child: Column(children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 12.h, right: 12.h, bottom: 5.v),
                          padding: EdgeInsets.all(11.h),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder16),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          controller: snapshotController
                                              .firstNameController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "First Name"))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          controller: snapshotController
                                              .middleNameController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "Middle Name"))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          controller: snapshotController
                                              .lastNameController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "Last Name"))
                                ]),
                            SizedBox(height: 42.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgFile,
                                      height: 20.v,
                                      width: 16.h,
                                      margin: EdgeInsets.only(
                                          top: 1.v, bottom: 12.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: snapshotController
                                              .companyNameController.value,
                                          margin: EdgeInsets.only(left: 23.h),
                                          hintText: "Company Name"))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "Position",
                                          suffix: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  30.h, 12.v, 15.h, 12.v),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgVectorGray6004x7)),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 36.v)))
                                ]),
                            SizedBox(height: 41.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCarGray600,
                                      height: 17.adaptSize,
                                      width: 17.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 3.v, bottom: 14.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: snapshotController
                                              .occupationController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "Occupation"))
                                ]),
                            SizedBox(height: 41.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCarGray600,
                                      height: 17.adaptSize,
                                      width: 17.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 3.v, bottom: 14.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: snapshotController
                                              .idealOccupationController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "Ideal Occupation"))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          controller: snapshotController
                                              .phoneNumberController.value,
                                          margin: EdgeInsets.only(left: 24.h),
                                          hintText: "Mobile Phone",
                                          textInputType: TextInputType.phone))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          controller: snapshotController
                                              .homePhoneController.value,
                                          margin: EdgeInsets.only(left: 24.h),
                                          hintText: "Home Phone",
                                          textInputType: TextInputType.phone))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          controller: snapshotController
                                              .businessPhoneController.value,
                                          margin: EdgeInsets.only(left: 24.h),
                                          hintText: "Business Phone",
                                          textInputType: TextInputType.phone))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgVideocamera,
                                      height: 17.adaptSize,
                                      width: 17.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 6.v, bottom: 13.v)),
                                  Expanded(
                                      child: CustomTextFormField(
                                          controller: snapshotController
                                              .businessFaxController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "Business Fax"))
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          controller: snapshotController
                                              .homeAddressController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "Home Address"))
                                ]),
                            SizedBox(height: 40.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLocation,
                                      height: 20.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 3.v, bottom: 12.v)),
                                  CustomTextFormField(
                                      controller: snapshotController
                                          .homeAptSteController.value,
                                      width: 113.h,
                                      margin:
                                          EdgeInsets.only(left: 22.h, top: 2.v),
                                      hintText: "Apt, Ste"),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLocation,
                                      height: 20.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          left: 43.h, top: 3.v, bottom: 12.v)),
                                  CustomTextFormField(
                                      controller: snapshotController
                                          .homeZipController.value,
                                      width: 109.h,
                                      margin: EdgeInsets.only(left: 22.h),
                                      hintText: "ZIP")
                                ]),
                            SizedBox(height: 39.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          controller: snapshotController
                                              .businessAddressController.value,
                                          margin: EdgeInsets.only(left: 22.h),
                                          hintText: "Business Address"))
                                ]),
                            SizedBox(height: 40.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLocation,
                                      height: 20.v,
                                      width: 17.h,
                                      margin: EdgeInsets.only(
                                          top: 3.v, bottom: 12.v)),
                                  CustomTextFormField(
                                      controller: snapshotController
                                          .businessAptStecontroller.value,
                                      width: 113.h,
                                      margin:
                                          EdgeInsets.only(left: 22.h, top: 2.v),
                                      hintText: "Apt, Ste"),
                                  const Spacer(),
                                  CustomTextFormField(
                                      controller: snapshotController
                                          .businessZipController.value,
                                      width: 109.h,
                                      hintText: "ZIP")
                                ]),
                            SizedBox(height: 20.v)
                          ])),
                      SizedBox(height: 12.v),
                      Container(
                          margin: EdgeInsets.only(
                              left: 12.h, right: 12.h, bottom: 5.v),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.h, vertical: 22.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder16),
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
                                          svgPath: ImageConstant.imgUser,
                                          height: 19.v,
                                          width: 17.h,
                                          margin: EdgeInsets.only(
                                              top: 1.v, bottom: 13.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller: snapshotController
                                                  .spouseController.value,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              hintText: "Spouse"))
                                    ]),
                                SizedBox(height: 40.v),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgCall,
                                          height: 15.adaptSize,
                                          width: 15.adaptSize,
                                          margin: EdgeInsets.only(
                                              top: 7.v, bottom: 13.v)),
                                      Expanded(
                                          child: CustomTextFormField(
                                              controller: snapshotController
                                                  .spouseLifePartnerPhoneController
                                                  .value,
                                              margin:
                                                  EdgeInsets.only(left: 24.h),
                                              hintText:
                                                  "Spouse / Life Partner Phone",
                                              textInputType:
                                                  TextInputType.phone))
                                    ]),
                                SizedBox(height: 39.v),
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
                                              controller: snapshotController
                                                  .personalEmailController
                                                  .value,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              hintText: "Personal Email",
                                              textInputType:
                                                  TextInputType.emailAddress))
                                    ]),
                                SizedBox(height: 39.v),
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
                                              controller: snapshotController
                                                  .businessEmailController
                                                  .value,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              hintText: "Business Email",
                                              textInputType:
                                                  TextInputType.emailAddress))
                                    ]),
                                SizedBox(height: 39.v),
                                Row(
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
                                              controller: snapshotController
                                                  .websiteUrlController.value,
                                              margin:
                                                  EdgeInsets.only(left: 20.h),
                                              hintText: "Website",
                                              textInputAction:
                                                  TextInputAction.done))
                                    ]),
                                SizedBox(height: 30.v),
                                Row(children: [
                                  CustomImageView(
                                      svgPath:
                                          ImageConstant.imgVectorGray60015x17,
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
                                        left: 37.h, top: 9.v, bottom: 2.v),
                                    child: Obx(
                                      () => Row(children: [
                                        CustomRadioButton(
                                            text: "Yes",
                                            value: "Yes",
                                            groupValue: snapshotController
                                                .radioGroup.value,
                                            onChange: (value) {
                                              snapshotController
                                                  .languagePreference(value);
                                            }),
                                        CustomRadioButton(
                                            text: "No",
                                            value: "No",
                                            groupValue: snapshotController
                                                .radioGroup.value,
                                            onChange: (value) {
                                              snapshotController
                                                  .languagePreference(value);
                                            }),
                                      ]),
                                    ))
                              ]))
                    ])))));
  }
}
