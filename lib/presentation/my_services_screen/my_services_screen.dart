import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_drop_down.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_outlined_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class MyServicesScreen extends StatelessWidget {
  MyServicesScreen({Key? key}) : super(key: key);

  TextEditingController edittextController = TextEditingController();

  TextEditingController languageController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController edittextoneController = TextEditingController();

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  TextEditingController edittexttwoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 13.v),
                      decoration: AppDecoration.outlineBlack,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        CustomAppBar(
                            height: 31.v,
                            leadingWidth: 44.h,
                            leading: AppbarImage(
                                svgPath:
                                    ImageConstant.imgArrowleftOnerrorcontainer,
                                margin: EdgeInsets.only(
                                    left: 24.h, top: 6.v, bottom: 12.v),
                                onTap: () {
                                  onTapArrowleftone(context);
                                }),
                            centerTitle: true,
                            title: AppbarTitle(text: "My Services"),
                            actions: [
                              AppbarImage1(
                                  svgPath: ImageConstant.imgCart,
                                  margin:
                                      EdgeInsets.fromLTRB(24.h, 1.v, 24.h, 6.v))
                            ]),
                        Padding(
                            padding:
                                EdgeInsets.fromLTRB(24.h, 29.v, 24.h, 13.v),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomOutlinedButton(
                                      width: 167.h,
                                      text: "Services in Progress"),
                                  CustomElevatedButton(
                                      height: 40.v,
                                      width: 167.h,
                                      text: "Completed Services",
                                      margin: EdgeInsets.only(left: 8.h),
                                      buttonStyle:
                                          CustomButtonStyles.fillLightBlueTL20,
                                      buttonTextStyle:
                                          theme.textTheme.bodySmall!)
                                ]))
                      ])),
                  SizedBox(height: 9.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 12.h, right: 12.h, bottom: 5.v),
                              decoration: AppDecoration.fillLightblue50,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 13.h),
                                        child: Text("Completed Services",
                                            style: theme.textTheme.titleLarge)),
                                    SizedBox(height: 11.v),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.h, vertical: 9.v),
                                        decoration: AppDecoration.outlineBlack,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 7.h),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        3.v),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      "Service #",
                                                                      style: CustomTextStyles
                                                                          .bodyLargeBlack900),
                                                                  SizedBox(
                                                                      height:
                                                                          3.v),
                                                                  Text(
                                                                      "Start Date",
                                                                      style: CustomTextStyles
                                                                          .bodyLargeBlack900),
                                                                  SizedBox(
                                                                      height:
                                                                          2.v),
                                                                  Text(
                                                                      "Service",
                                                                      style: CustomTextStyles
                                                                          .bodyLargeBlack900),
                                                                  SizedBox(
                                                                      height:
                                                                          3.v),
                                                                  Text(
                                                                      "Collaborate",
                                                                      style: CustomTextStyles
                                                                          .bodyLargeBlack900),
                                                                  SizedBox(
                                                                      height:
                                                                          7.v),
                                                                  Text("Fee",
                                                                      style: CustomTextStyles
                                                                          .bodyLargeBlack900)
                                                                ])),
                                                        SizedBox(
                                                            height: 155.v,
                                                            width: 218.h,
                                                            child: Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                children: [
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child: Text(
                                                                          "S-6103",
                                                                          style: theme
                                                                              .textTheme
                                                                              .bodyLarge)),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                              top: 29
                                                                                  .v),
                                                                          child: Text(
                                                                              "09/22/2023",
                                                                              style: theme.textTheme.bodyLarge))),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: Text(
                                                                          "Home Mortgage",
                                                                          style: theme
                                                                              .textTheme
                                                                              .bodyLarge)),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomLeft,
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                              bottom: 35
                                                                                  .v),
                                                                          child: Text(
                                                                              "Collaboration Page",
                                                                              style: theme.textTheme.bodyLarge))),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomLeft,
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: 6
                                                                                  .h,
                                                                              bottom: 3
                                                                                  .v),
                                                                          child: Text(
                                                                              "",
                                                                              style: theme.textTheme.bodyLarge))),
                                                                  CustomTextFormField(
                                                                      width:
                                                                          146.h,
                                                                      controller:
                                                                          edittextController,
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomLeft),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVectorstroke,
                                                                      height:
                                                                          14.v,
                                                                      width:
                                                                          3.h,
                                                                      alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                      margin: EdgeInsets.only(
                                                                          top: 5
                                                                              .v,
                                                                          right:
                                                                              1.h)),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomRight,
                                                                      child: Container(
                                                                          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 11.v),
                                                                          decoration: AppDecoration.outlineBlack9003.copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
                                                                          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                            SizedBox(height: 6.v),
                                                                            SizedBox(
                                                                                width: 75.h,
                                                                                child: Text("Call us\nEmail us\nText us", maxLines: 5, overflow: TextOverflow.ellipsis, style: CustomTextStyles.bodyLargeBlack900.copyWith(height: 1.08)))
                                                                          ])))
                                                                ]))
                                                      ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 7.v,
                                                      right: 79.h,
                                                      bottom: 2.v),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.v,
                                                                    bottom:
                                                                        3.v),
                                                            child: Text(
                                                                "Status",
                                                                style: CustomTextStyles
                                                                    .bodyLargeBlack900)),
                                                        Container(
                                                            height: 33.v,
                                                            width: 146.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 58.h),
                                                            child: Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomLeft,
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: 12
                                                                                  .h,
                                                                              bottom: 1
                                                                                  .v),
                                                                          child: Text(
                                                                              "In progress",
                                                                              style: theme.textTheme.bodyLarge))),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVectorGray6004x7,
                                                                      height:
                                                                          4.v,
                                                                      width:
                                                                          7.h)
                                                                ]))
                                                      ]))
                                            ])),
                                    SizedBox(height: 9.v),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.h, vertical: 9.v),
                                        decoration: AppDecoration.outlineBlack,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.h),
                                                  child: Row(children: [
                                                    Text("Service #",
                                                        style: CustomTextStyles
                                                            .bodyLargeBlack900),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 30.h),
                                                        child: Text("S-6103",
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge)),
                                                    Spacer(),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgVectorstroke,
                                                        height: 14.v,
                                                        width: 3.h,
                                                        margin: EdgeInsets.only(
                                                            top: 5.v,
                                                            bottom: 7.v))
                                                  ])),
                                              SizedBox(height: 2.v),
                                              Row(children: [
                                                Text("Start Date",
                                                    style: CustomTextStyles
                                                        .bodyLargeBlack900),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 25.h),
                                                    child: Text("09/22/2023",
                                                        style: theme.textTheme
                                                            .bodyLarge))
                                              ]),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2.v, right: 78.h),
                                                  child: Row(children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 2.v),
                                                        child: Text("Service",
                                                            style: CustomTextStyles
                                                                .bodyLargeBlack900)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 49.h,
                                                                top: 2.v),
                                                        child: Text(
                                                            "Home Mortgage",
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge))
                                                  ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 51.h),
                                                  child: Row(children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 2.v),
                                                        child: Text(
                                                            "Collaborate",
                                                            style: CustomTextStyles
                                                                .bodyLargeBlack900)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.h,
                                                                top: 2.v),
                                                        child: Text(
                                                            "Collaboration Page",
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge))
                                                  ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2.v, right: 79.h),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.v,
                                                                    bottom:
                                                                        3.v),
                                                            child: Text("Fee",
                                                                style: CustomTextStyles
                                                                    .bodyLargeBlack900)),
                                                        CustomTextFormField(
                                                            width: 146.h,
                                                            controller:
                                                                languageController,
                                                            hintText: "")
                                                      ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 7.v,
                                                      right: 79.h,
                                                      bottom: 2.v),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.v,
                                                                    bottom:
                                                                        3.v),
                                                            child: Text(
                                                                "Status",
                                                                style: CustomTextStyles
                                                                    .bodyLargeBlack900)),
                                                        CustomDropDown(
                                                            width: 146.h,
                                                            icon: Container(
                                                                padding:
                                                                    EdgeInsets.fromLTRB(
                                                                        30.h,
                                                                        14.v,
                                                                        13.h,
                                                                        15.v),
                                                                margin: EdgeInsets
                                                                    .only(),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(
                                                                        3.h),
                                                                    border: Border.all(
                                                                        color: appTheme
                                                                            .black900,
                                                                        width: 1
                                                                            .h)),
                                                                child: CustomImageView(
                                                                    svgPath: ImageConstant
                                                                        .imgVectorGray6004x7)),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 58.h),
                                                            hintText:
                                                                "In progress",
                                                            items: dropdownItemList,
                                                            onChanged: (value) {})
                                                      ]))
                                            ])),
                                    SizedBox(height: 9.v),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.h, vertical: 9.v),
                                        decoration: AppDecoration.outlineBlack,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.h),
                                                  child: Row(children: [
                                                    Text("Service #",
                                                        style: CustomTextStyles
                                                            .bodyLargeBlack900),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 30.h),
                                                        child: Text("S-6103",
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge)),
                                                    Spacer(),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgVectorstroke,
                                                        height: 14.v,
                                                        width: 3.h,
                                                        margin: EdgeInsets.only(
                                                            top: 5.v,
                                                            bottom: 7.v))
                                                  ])),
                                              SizedBox(height: 2.v),
                                              Row(children: [
                                                Text("Start Date",
                                                    style: CustomTextStyles
                                                        .bodyLargeBlack900),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 25.h),
                                                    child: Text("09/22/2023",
                                                        style: theme.textTheme
                                                            .bodyLarge))
                                              ]),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2.v, right: 78.h),
                                                  child: Row(children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 2.v),
                                                        child: Text("Service",
                                                            style: CustomTextStyles
                                                                .bodyLargeBlack900)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 49.h,
                                                                top: 2.v),
                                                        child: Text(
                                                            "Home Mortgage",
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge))
                                                  ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 51.h),
                                                  child: Row(children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 2.v),
                                                        child: Text(
                                                            "Collaborate",
                                                            style: CustomTextStyles
                                                                .bodyLargeBlack900)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.h,
                                                                top: 2.v),
                                                        child: Text(
                                                            "Collaboration Page",
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge))
                                                  ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2.v, right: 79.h),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.v,
                                                                    bottom:
                                                                        3.v),
                                                            child: Text("Fee",
                                                                style: CustomTextStyles
                                                                    .bodyLargeBlack900)),
                                                        SizedBox(
                                                            height: 33.v,
                                                            width: 146.h,
                                                            child: Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: 6
                                                                                  .h,
                                                                              top: 2
                                                                                  .v),
                                                                          child: Text(
                                                                              "",
                                                                              style: theme.textTheme.bodyLarge))),
                                                                  CustomTextFormField(
                                                                      width:
                                                                          146.h,
                                                                      controller:
                                                                          edittextoneController,
                                                                      alignment:
                                                                          Alignment
                                                                              .center)
                                                                ]))
                                                      ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 7.v,
                                                      right: 79.h,
                                                      bottom: 2.v),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.v,
                                                                    bottom:
                                                                        3.v),
                                                            child: Text(
                                                                "Status",
                                                                style: CustomTextStyles
                                                                    .bodyLargeBlack900)),
                                                        CustomDropDown(
                                                            width: 146.h,
                                                            icon: Container(
                                                                padding:
                                                                    EdgeInsets.fromLTRB(
                                                                        30.h,
                                                                        14.v,
                                                                        13.h,
                                                                        15.v),
                                                                margin: EdgeInsets
                                                                    .only(),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(
                                                                        3.h),
                                                                    border: Border.all(
                                                                        color: appTheme
                                                                            .black900,
                                                                        width: 1
                                                                            .h)),
                                                                child: CustomImageView(
                                                                    svgPath: ImageConstant
                                                                        .imgVectorGray6004x7)),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 58.h),
                                                            hintText:
                                                                "In progress",
                                                            items: dropdownItemList1,
                                                            onChanged: (value) {})
                                                      ]))
                                            ])),
                                    SizedBox(height: 9.v),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.h, vertical: 9.v),
                                        decoration: AppDecoration.outlineBlack,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.h),
                                                  child: Row(children: [
                                                    Text("Service #",
                                                        style: CustomTextStyles
                                                            .bodyLargeBlack900),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 30.h),
                                                        child: Text("S-6103",
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge)),
                                                    Spacer(),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgVectorstroke,
                                                        height: 14.v,
                                                        width: 3.h,
                                                        margin: EdgeInsets.only(
                                                            top: 5.v,
                                                            bottom: 7.v))
                                                  ])),
                                              SizedBox(height: 2.v),
                                              Row(children: [
                                                Text("Start Date",
                                                    style: CustomTextStyles
                                                        .bodyLargeBlack900),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 25.h),
                                                    child: Text("09/22/2023",
                                                        style: theme.textTheme
                                                            .bodyLarge))
                                              ]),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2.v, right: 78.h),
                                                  child: Row(children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 2.v),
                                                        child: Text("Service",
                                                            style: CustomTextStyles
                                                                .bodyLargeBlack900)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 49.h,
                                                                top: 2.v),
                                                        child: Text(
                                                            "Home Mortgage",
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge))
                                                  ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 51.h),
                                                  child: Row(children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 2.v),
                                                        child: Text(
                                                            "Collaborate",
                                                            style: CustomTextStyles
                                                                .bodyLargeBlack900)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.h,
                                                                top: 2.v),
                                                        child: Text(
                                                            "Collaboration Page",
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge))
                                                  ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2.v, right: 79.h),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.v,
                                                                    bottom:
                                                                        3.v),
                                                            child: Text("Fee",
                                                                style: CustomTextStyles
                                                                    .bodyLargeBlack900)),
                                                        SizedBox(
                                                            height: 33.v,
                                                            width: 146.h,
                                                            child: Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: 6
                                                                                  .h,
                                                                              top: 2
                                                                                  .v),
                                                                          child: Text(
                                                                              "",
                                                                              style: theme.textTheme.bodyLarge))),
                                                                  CustomTextFormField(
                                                                      width:
                                                                          146.h,
                                                                      controller:
                                                                          edittexttwoController,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .done,
                                                                      alignment:
                                                                          Alignment
                                                                              .center)
                                                                ]))
                                                      ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 7.v,
                                                      right: 79.h,
                                                      bottom: 2.v),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.v,
                                                                    bottom:
                                                                        3.v),
                                                            child: Text(
                                                                "Status",
                                                                style: CustomTextStyles
                                                                    .bodyLargeBlack900)),
                                                        Container(
                                                            height: 33.v,
                                                            width: 146.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 58.h),
                                                            child: Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomLeft,
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: 12
                                                                                  .h,
                                                                              bottom: 1
                                                                                  .v),
                                                                          child: Text(
                                                                              "In progress",
                                                                              style: theme.textTheme.bodyLarge))),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVectorGray6004x7,
                                                                      height:
                                                                          4.v,
                                                                      width:
                                                                          7.h)
                                                                ]))
                                                      ]))
                                            ]))
                                  ]))))
                ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
