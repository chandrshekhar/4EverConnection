import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Health%20Profile%20Controller/health_profile_controller.dart';
import 'package:forever_connection/Controllers/Personal%20Details%20Controller/personal_details-controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class HealthProfileScreen extends StatelessWidget {
  HealthProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final healthProfileController = Get.put(HealthProfileController());
  final personalDetailsController = Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.lightBlue50,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: 44.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                margin: EdgeInsets.only(left: 24.h, top: 20.v, bottom: 30.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Health Profile"),
            actions: [
              AppbarImage1(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
                  },
                  svgPath: ImageConstant.imgCart,
                  margin: EdgeInsets.fromLTRB(24.h, 15.v, 24.h, 24.v))
            ],
            styleType: Style.bgShadow),
        body: SafeArea(
          bottom: false,
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 11.v),
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                      child: Column(children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11.h, vertical: 12.v),
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
                                            svgPath: ImageConstant.imgSort,
                                            height: 24.v,
                                            width: 12.h,
                                            margin: EdgeInsets.only(
                                                top: 1.v, bottom: 10.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                readOnly: true,
                                                controller:
                                                    healthProfileController
                                                        .heightInFtController
                                                        .value,
                                                margin:
                                                    EdgeInsets.only(left: 24.h),
                                                labelText: "Height (FT)"))
                                      ]),
                                  SizedBox(height: 40.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgSort,
                                            height: 24.v,
                                            width: 12.h,
                                            margin: EdgeInsets.only(
                                                top: 1.v, bottom: 10.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                readOnly: true,
                                                controller:
                                                    healthProfileController
                                                        .heightInChController
                                                        .value,
                                                margin:
                                                    EdgeInsets.only(left: 27.h),
                                                labelText: "Height (Inchs)"))
                                      ]),
                                  SizedBox(height: 40.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgMusic,
                                            height: 15.adaptSize,
                                            width: 15.adaptSize,
                                            margin: EdgeInsets.only(
                                                top: 6.v, bottom: 14.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                readOnly: true,
                                                controller:
                                                    healthProfileController
                                                        .weightLbsController
                                                        .value,
                                                margin:
                                                    EdgeInsets.only(left: 23.h),
                                                labelText: "Weight (LBS)"))
                                      ]),
                                  SizedBox(height: 39.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgComputer,
                                            height: 16.v,
                                            width: 23.h,
                                            margin: EdgeInsets.only(
                                                top: 7.v, bottom: 13.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                          readOnly: true,
                                          controller: healthProfileController
                                              .smakerController.value,
                                          margin: EdgeInsets.only(left: 16.h),
                                          labelText: "Smoker",
                                        ))
                                      ]),
                                  SizedBox(height: 40.v),
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
                                                top: 3.v, bottom: 13.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                readOnly: true,
                                                controller:
                                                    healthProfileController
                                                        .doctorname.value,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText: "Doctor Name"))
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
                                          readOnly: true,
                                          controller: healthProfileController
                                              .doctorPhoneController.value,
                                          margin: EdgeInsets.only(left: 24.h),
                                          labelText: "Doctor Phone",
                                          textInputType: TextInputType.phone,
                                          suffix: InkWell(
                                            onTap: () async {
                                              try {
                                                final Uri phoneLaunchUri = Uri(
                                                    scheme: 'tel',
                                                    path: healthProfileController
                                                        .doctorPhoneController
                                                        .value
                                                        .text);

                                                launchUrl(phoneLaunchUri);
                                                // launchUrl(Uri.parse(url));
                                              } catch (e) {
                                                log(e.toString());
                                              }
                                            },
                                            child: Container(
                                                color: AppColors
                                                    .floatingActionButtonColor,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.h,
                                                    horizontal: 10.v),
                                                child: const Icon(
                                                  Icons.call,
                                                  color: Colors.white,
                                                  size: 15,
                                                )),
                                          ),
                                        ))
                                      ]),
                                  SizedBox(height: 39.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgCalendar,
                                            height: 19.v,
                                            width: 17.h,
                                            margin: EdgeInsets.only(
                                                top: 4.v, bottom: 13.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                readOnly: true,
                                                controller:
                                                    healthProfileController
                                                        .dateOflastVisit.value,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText:
                                                    "Date of Last Visit"))
                                      ]),
                                  SizedBox(height: 40.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgLocation,
                                            height: 20.v,
                                            width: 17.h,
                                            margin: EdgeInsets.only(
                                                top: 3.v, bottom: 12.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                readOnly: true,
                                                controller:
                                                    healthProfileController
                                                        .doctorStreetController
                                                        .value,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText: "Doctor Street"))
                                      ]),
                                  SizedBox(height: 42.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            readOnly: true,
                                            width: 113.h,
                                            controller: healthProfileController
                                                .doctorAptController.value,
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
                                            readOnly: true,
                                            width: 109.h,
                                            controller: healthProfileController
                                                .doctorZipController.value,
                                            margin: EdgeInsets.only(left: 22.h),
                                            labelText: "ZIP")
                                      ]),
                                  SizedBox(height: 19.v)
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
                                children: [
                                  SizedBox(height: 2.v),
                                  custominputFieldWithContainer(
                                      title: "Reason",
                                      imagePath: ImageConstant.imgEdit,
                                      controller: healthProfileController
                                          .reasonController.value),
                                  SizedBox(height: 40.v),
                                  custominputFieldWithContainer(
                                      title: "Outcome",
                                      imagePath: ImageConstant.imgUser,
                                      controller: healthProfileController
                                          .outComeController.value),
                                  SizedBox(height: 39.v),
                                  custominputFieldWithContainer(
                                      title: "Health Issues",
                                      imagePath: ImageConstant.imgMap,
                                      controller: healthProfileController
                                          .healthInsurranceController.value),
                                  SizedBox(height: 39.v),
                                  custominputFieldWithContainer(
                                      title: "Medications",
                                      imagePath: ImageConstant.imgUser,
                                      controller: healthProfileController
                                          .medicationController.value),
                                  SizedBox(height: 42.v),
                                  SizedBox(height: 39.v),
                                  custominputFieldWithContainer(
                                      title: "Age of Siblings",
                                      imagePath: ImageConstant.imgCalendar,
                                      controller: healthProfileController
                                          .ageOfSibilingController.value),
                                  SizedBox(height: 42.v),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgCalendar,
                                            height: 19.v,
                                            width: 17.h,
                                            margin: EdgeInsets.only(
                                                top: 1.v, bottom: 13.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                readOnly: true,
                                                controller:
                                                    healthProfileController
                                                        .fatherAgeController
                                                        .value,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText: "Father Age"))
                                      ]),
                                  SizedBox(
                                    height: 40.v,
                                  ),
                                  custominputFieldWithContainer(
                                      title: "(If death) Age and Cause",
                                      imagePath: ImageConstant.imgEdit,
                                      controller: healthProfileController
                                          .fatherAgeAndCause.value),
                                  SizedBox(height: 42.v),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgCalendar,
                                            height: 19.v,
                                            width: 17.h,
                                            margin: EdgeInsets.only(
                                                top: 1.v, bottom: 13.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                readOnly: true,
                                                controller:
                                                    healthProfileController
                                                        .motherAge.value,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText: "Mother Age"))
                                      ]),
                                  SizedBox(height: 39.v),
                                  custominputFieldWithContainer(
                                      title: "(If death) Age and Cause",
                                      imagePath: ImageConstant.imgEdit,
                                      controller: healthProfileController
                                          .motherAgeAndCause.value),
                                  SizedBox(height: 39.v),
                                  custominputFieldWithContainer(
                                      title: "Other Health Notes",
                                      imagePath: ImageConstant.imgEdit,
                                      controller: healthProfileController
                                          .otherHealthNotes.value),
                                ])),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.v),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 5.v),
                              Obx(
                                () => personalDetailsController
                                        .isLoadingEdit.value
                                    ? const Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      )
                                    : Expanded(
                                        child: CustomElevatedButton(
                                            onTap: () async {
                                              await personalDetailsController
                                                  .getMagicLink(context);
                                            },
                                            text: "Edit",
                                            buttonTextStyle: TextStyle(
                                                fontSize: 22.adaptSize),
                                            rightIcon: Container(
                                                margin:
                                                    EdgeInsets.only(left: 16.h),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowrightPrimary))),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ])))),
        ));
  }

  Widget custominputFieldWithContainer(
      {required TextEditingController controller,
      required String imagePath,
      required String title}) {
    return Column(
      children: [
        Row(children: [
          CustomImageView(
              svgPath: imagePath,
              height: 18.adaptSize,
              width: 18.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 4.v)),
          Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(title, style: theme.textTheme.bodyLarge))
        ]),
        SizedBox(height: 4.v),
        Container(
          height: 90.v,
          width: 342.h,
          padding: EdgeInsets.all(10.v),
          decoration: BoxDecoration(
              border: Border.all(color: appTheme.black900, width: 1.h)),
          child: TextFormField(
            readOnly: true,
            decoration: const InputDecoration.collapsed(hintText: ""),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
