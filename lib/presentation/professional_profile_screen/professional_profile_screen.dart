import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProfessionalProfileScreen extends StatelessWidget {
  ProfessionalProfileScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController businessfaxoneController = TextEditingController();

  TextEditingController businessemailController = TextEditingController();

  TextEditingController businesswebsiteController = TextEditingController();

  TextEditingController positionvalueController = TextEditingController();

  TextEditingController idealoccupationController = TextEditingController();

  TextEditingController educationlevelController = TextEditingController();

  TextEditingController degreevalueoneController = TextEditingController();

  TextEditingController affiliationsvalController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController aptsteController = TextEditingController();

  TextEditingController zipvalueoneController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                title: AppbarTitle(text: "Professional Profile"),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.h, vertical: 21.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  controller: nameController,
                                                  margin: EdgeInsets.only(
                                                      left: 23.h),
                                                  hintText: "Business Name"))
                                        ]),
                                    SizedBox(height: 39.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  hintText: "Business Phone",
                                                  textInputType:
                                                      TextInputType.phone))
                                        ]),
                                    SizedBox(height: 39.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgVideocamera,
                                              height: 17.adaptSize,
                                              width: 17.adaptSize,
                                              margin: EdgeInsets.only(
                                                  top: 6.v, bottom: 13.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      businessfaxoneController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Business Fax"))
                                        ]),
                                    SizedBox(height: 39.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  controller:
                                                      businessemailController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Business Email",
                                                  textInputType: TextInputType
                                                      .emailAddress))
                                        ]),
                                    SizedBox(height: 39.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  controller:
                                                      businesswebsiteController,
                                                  margin: EdgeInsets.only(
                                                      left: 20.h),
                                                  hintText: "Business Website"))
                                        ]),
                                    SizedBox(height: 39.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                      positionvalueController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Position",
                                                  suffix: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
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
                                        ]),
                                    SizedBox(height: 41.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgCarGray600,
                                              height: 17.adaptSize,
                                              width: 17.adaptSize,
                                              margin: EdgeInsets.only(
                                                  top: 3.v, bottom: 14.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      idealoccupationController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText:
                                                      "My Ideal Occupation"))
                                        ]),
                                    SizedBox(height: 39.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                      educationlevelController,
                                                  margin: EdgeInsets.only(
                                                      left: 19.h),
                                                  hintText: "Education Level",
                                                  suffix: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
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
                                        ]),
                                    SizedBox(height: 42.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                      degreevalueoneController,
                                                  margin: EdgeInsets.only(
                                                      left: 17.h),
                                                  hintText: "Degree"))
                                        ]),
                                    SizedBox(height: 39.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                      affiliationsvalController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Affiliations"))
                                        ]),
                                    SizedBox(height: 39.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  hintText: "Business Address"))
                                        ]),
                                    SizedBox(height: 40.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                              controller: zipvalueoneController,
                                              margin:
                                                  EdgeInsets.only(left: 22.h),
                                              hintText: "ZIP",
                                              textInputAction:
                                                  TextInputAction.done)
                                        ]),
                                    SizedBox(height: 26.v)
                                  ])),
                          CustomElevatedButton(
                              text: "Save",
                              margin: EdgeInsets.only(
                                  left: 12.h, top: 17.v, right: 12.h),
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
