import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class FinancialProfileScreen extends StatelessWidget {
  FinancialProfileScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController assetsController = TextEditingController();

  TextEditingController liabilitiesController = TextEditingController();

  TextEditingController networthController = TextEditingController();

  TextEditingController incomeController = TextEditingController();

  TextEditingController expensesController = TextEditingController();

  TextEditingController cashflowController = TextEditingController();

  TextEditingController editController = TextEditingController();

  TextEditingController fatherageController = TextEditingController();

  TextEditingController motherageController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
    backgroundColor: appTheme.lightBlue50,
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
                title: AppbarTitle(text: "Financial Profile"),
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
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 12.h, right: 12.h, bottom: 5.v),
                        decoration: AppDecoration.fillLightblue50,
                        child: Column(children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 11.v),
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
                                                  hintText:
                                                      "Tax Professional Name"))
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
                                                  hintText: "Phone",
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
                                                  hintText: "Address"))
                                        ]),
                                    SizedBox(height: 40.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorGray600,
                                              height: 16.adaptSize,
                                              width: 16.adaptSize,
                                              margin: EdgeInsets.only(
                                                  top: 6.v, bottom: 13.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller: assetsController,
                                                  margin: EdgeInsets.only(
                                                      left: 23.h),
                                                  hintText: "Assets"))
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
                                                      liabilitiesController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Liabilities"))
                                        ]),
                                    SizedBox(height: 39.v),
                                    SizedBox(
                                        height: 112.v,
                                        width: 342.h,
                                        child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgUser,
                                                                  height: 19.v,
                                                                  width: 17.h,
                                                                  margin: EdgeInsets.only(
                                                                      top: 4.v,
                                                                      bottom: 13
                                                                          .v)),
                                                              Expanded(
                                                                  child: CustomTextFormField(
                                                                      controller:
                                                                          networthController,
                                                                      margin: EdgeInsets.only(
                                                                          left: 22
                                                                              .h),
                                                                      hintText:
                                                                          "Net Worth"))
                                                            ]),
                                                        SizedBox(height: 47.v),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgComputerGray600,
                                                            height: 12.v,
                                                            width: 17.h)
                                                      ])),
                                              CustomTextFormField(
                                                  width: 303.h,
                                                  controller: incomeController,
                                                  hintText: "Income",
                                                  alignment:
                                                      Alignment.bottomRight)
                                            ])),
                                    SizedBox(height: 42.v),
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
                                                  top: 1.v, bottom: 13.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      expensesController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Expenses"))
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
                                                  .imgComputerGray600,
                                              height: 12.v,
                                              width: 17.h,
                                              margin: EdgeInsets.only(
                                                  top: 8.v, bottom: 16.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      cashflowController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Cashflow"))
                                        ]),
                                    SizedBox(height: 22.v)
                                  ])),
                          SizedBox(height: 10.v),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 17.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomTextFormField(
                                        controller: editController,
                                        hintText: "Financial Health Notes",
                                        prefix: Container(
                                            margin: EdgeInsets.only(
                                                top: 5.v,
                                                right: 21.h,
                                                bottom: 5.v),
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgEdit)),
                                        prefixConstraints:
                                            BoxConstraints(maxHeight: 156.v),
                                        contentPadding:
                                            EdgeInsets.only(right: 30.h)),
                                    SizedBox(height: 40.v),
                                    Row(children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgUser,
                                          height: 19.v,
                                          width: 17.h,
                                          margin: EdgeInsets.only(
                                              top: 3.v, bottom: 4.v)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 22.h),
                                          child: Text("Outcome",
                                              style: theme.textTheme.bodyLarge))
                                    ]),
                                    SizedBox(height: 4.v),
                                    Container(
                                        height: 124.v,
                                        width: 342.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appTheme.black900,
                                                width: 1.h))),
                                    SizedBox(height: 39.v),
                                    Row(children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgMap,
                                          height: 19.v,
                                          width: 17.h,
                                          margin: EdgeInsets.only(top: 7.v)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 21.h),
                                          child: Text("Health Issues",
                                              style: theme.textTheme.bodyLarge))
                                    ]),
                                    SizedBox(height: 5.v),
                                    Container(
                                        height: 124.v,
                                        width: 342.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appTheme.black900,
                                                width: 1.h))),
                                    SizedBox(height: 39.v),
                                    Row(children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgUser,
                                          height: 19.v,
                                          width: 17.h,
                                          margin: EdgeInsets.only(
                                              top: 4.v, bottom: 3.v)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 22.h),
                                          child: Text("Medications",
                                              style: theme.textTheme.bodyLarge))
                                    ]),
                                    SizedBox(height: 5.v),
                                    Container(
                                        height: 124.v,
                                        width: 342.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appTheme.black900,
                                                width: 1.h))),
                                    SizedBox(height: 42.v),
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
                                                  top: 1.v, bottom: 6.v)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 22.h),
                                              child: Text("Age of Siblings",
                                                  style: theme
                                                      .textTheme.bodyLarge))
                                        ]),
                                    SizedBox(height: 2.v),
                                    Container(
                                        height: 124.v,
                                        width: 342.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appTheme.black900,
                                                width: 1.h))),
                                    SizedBox(height: 42.v),
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
                                                  top: 1.v, bottom: 13.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      fatherageController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Father Age"))
                                        ]),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 40.v, right: 74.h),
                                        child: Row(children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgEdit,
                                              height: 18.adaptSize,
                                              width: 18.adaptSize,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 4.v)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 21.h),
                                              child: Text(
                                                  "(If death) Age and Cause",
                                                  style: theme
                                                      .textTheme.bodyLarge))
                                        ])),
                                    SizedBox(height: 4.v),
                                    Container(
                                        height: 90.v,
                                        width: 342.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appTheme.black900,
                                                width: 1.h))),
                                    SizedBox(height: 42.v),
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
                                                  top: 1.v, bottom: 13.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      motherageController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Mother Age",
                                                  textInputAction:
                                                      TextInputAction.done))
                                        ]),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 40.v, right: 74.h),
                                        child: Row(children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgEdit,
                                              height: 18.adaptSize,
                                              width: 18.adaptSize,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 4.v)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 21.h),
                                              child: Text(
                                                  "(If death) Age and Cause",
                                                  style: theme
                                                      .textTheme.bodyLarge))
                                        ])),
                                    SizedBox(height: 4.v),
                                    Container(
                                        height: 90.v,
                                        width: 342.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appTheme.black900,
                                                width: 1.h))),
                                    SizedBox(height: 39.v),
                                    Row(children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgEdit,
                                          height: 18.adaptSize,
                                          width: 18.adaptSize,
                                          margin: EdgeInsets.only(
                                              top: 5.v, bottom: 3.v)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 21.h),
                                          child: Text("Other Health Notes",
                                              style: theme.textTheme.bodyLarge))
                                    ]),
                                    SizedBox(height: 5.v),
                                    Container(
                                        height: 90.v,
                                        width: 342.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appTheme.black900,
                                                width: 1.h))),
                                    SizedBox(height: 2.v)
                                  ])),
                          CustomElevatedButton(
                              text: "Save",
                              margin: EdgeInsets.only(
                                  left: 12.h, top: 32.v, right: 12.h),
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
