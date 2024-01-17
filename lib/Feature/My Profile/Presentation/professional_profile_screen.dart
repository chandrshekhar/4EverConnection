import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/My%20Profile/Controller/personal_details-controller.dart';
import 'package:forever_connection/core/utils/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:forever_connection/widgets/phone_number_formating_widget.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controller/professional_details_controller.dart';

// ignore_for_file: must_be_immutable
class ProfessionalProfileScreen extends StatelessWidget {
  ProfessionalProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final professionalProfileController =
      Get.put(ProfessionalDetailsController());
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
            title: AppbarTitle(text: "Professional Profile"),
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
          bottom: true,
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 11.v),
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                      child: Obx(
                        () => professionalProfileController
                                    .professionalDataLoading ==
                                true
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : Column(children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.h, vertical: 21.v),
                                    decoration: AppDecoration.outlineBlack
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder16),
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
                                                    svgPath:
                                                        ImageConstant.imgFile,
                                                    height: 20.v,
                                                    width: 16.h,
                                                    margin: EdgeInsets.only(
                                                        top: 4.v,
                                                        bottom: 12.v)),
                                                Expanded(
                                                    child: CustomTextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            professionalProfileController
                                                                .businessnameController
                                                                .value,
                                                        margin: EdgeInsets.only(
                                                            left: 23.h),
                                                        labelText:
                                                            "Business Name"))
                                              ]),
                                          SizedBox(height: 39.v),
                                          PhoneNumberTextFieldWidget(
                                            readOnly: true,
                                            phoneController:
                                                professionalProfileController
                                                    .businessphoneController
                                                    .value,
                                            lable: "Business Phone",
                                            suffix: InkWell(
                                              onTap: () async {
                                                try {
                                                  final Uri phoneLaunchUri = Uri(
                                                      scheme: 'tel',
                                                      path: professionalProfileController
                                                          .businessphoneController
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
                                          ),
                                          SizedBox(height: 39.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgVideocamera,
                                                    height: 17.adaptSize,
                                                    width: 17.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        top: 6.v,
                                                        bottom: 13.v)),
                                                Expanded(
                                                    child: CustomTextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            professionalProfileController
                                                                .businessfaxoneController
                                                                .value,
                                                        margin: EdgeInsets.only(
                                                            left: 22.h),
                                                        labelText:
                                                            "Business Fax"))
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
                                                        ImageConstant.imgVector,
                                                    height: 17.adaptSize,
                                                    width: 17.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        top: 6.v,
                                                        bottom: 13.v)),
                                                Expanded(
                                                    child: CustomTextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            professionalProfileController
                                                                .businessEmailController
                                                                .value,
                                                        margin: EdgeInsets.only(
                                                            left: 22.h),
                                                        labelText:
                                                            "Business Email",
                                                        textInputType:
                                                            TextInputType
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
                                                    svgPath:
                                                        ImageConstant.imgGlobe,
                                                    height: 17.v,
                                                    width: 19.h,
                                                    margin: EdgeInsets.only(
                                                        top: 6.v,
                                                        bottom: 13.v)),
                                                Expanded(
                                                    child: CustomTextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            professionalProfileController
                                                                .businesswebsiteController
                                                                .value,
                                                        margin: EdgeInsets.only(
                                                            left: 20.h),
                                                        labelText:
                                                            "Business Website"))
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
                                                        ImageConstant.imgUser,
                                                    height: 19.v,
                                                    width: 17.h,
                                                    margin: EdgeInsets.only(
                                                        top: 4.v,
                                                        bottom: 13.v)),
                                                Expanded(
                                                    child: CustomTextFormField(
                                                  readOnly: true,
                                                  controller:
                                                      professionalProfileController
                                                          .positionvalueController
                                                          .value,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  labelText: "Position",
                                                ))
                                              ]),
                                          SizedBox(height: 41.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgCarGray600,
                                                    height: 17.adaptSize,
                                                    width: 17.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        top: 3.v,
                                                        bottom: 14.v)),
                                                Expanded(
                                                    child: CustomTextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            professionalProfileController
                                                                .idealoccupationController
                                                                .value,
                                                        margin: EdgeInsets.only(
                                                            left: 22.h),
                                                        labelText:
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
                                                        top: 6.v,
                                                        bottom: 12.v)),
                                                Expanded(
                                                    child: CustomTextFormField(
                                                  readOnly: true,
                                                  controller:
                                                      professionalProfileController
                                                          .educationlevelController
                                                          .value,
                                                  margin: EdgeInsets.only(
                                                      left: 19.h),
                                                  labelText: "Education Level",
                                                ))
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
                                                        top: 3.v,
                                                        bottom: 12.v)),
                                                Expanded(
                                                    child: CustomTextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            professionalProfileController
                                                                .degreevalueoneController
                                                                .value,
                                                        margin: EdgeInsets.only(
                                                            left: 17.h),
                                                        labelText: "Degree"))
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
                                                        ImageConstant.imgUser,
                                                    height: 19.v,
                                                    width: 17.h,
                                                    margin: EdgeInsets.only(
                                                        top: 4.v,
                                                        bottom: 13.v)),
                                                Expanded(
                                                    child: CustomTextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            professionalProfileController
                                                                .affiliationsvalController
                                                                .value,
                                                        margin: EdgeInsets.only(
                                                            left: 22.h),
                                                        labelText:
                                                            "Affiliations"))
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
                                                        .imgLocation,
                                                    height: 20.v,
                                                    width: 17.h,
                                                    margin: EdgeInsets.only(
                                                        top: 4.v,
                                                        bottom: 12.v)),
                                                Expanded(
                                                    child: CustomTextFormField(
                                                        readOnly: true,
                                                        // onTap: () async {
                                                        //   var address =
                                                        //       await Navigator
                                                        //           .push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //       builder: (context) =>
                                                        //           AddressAutoCompleteWidget(),
                                                        //     ),
                                                        //   );
                                                        //   professionalProfileController
                                                        //       .addressController
                                                        //       .value
                                                        //       .text = address;
                                                        // },
                                                        controller:
                                                            professionalProfileController
                                                                .addressController
                                                                .value,
                                                        margin: EdgeInsets.only(
                                                            left: 22.h),
                                                        labelText:
                                                            "Business Address"))
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
                                                        .imgLocation,
                                                    height: 20.v,
                                                    width: 17.h,
                                                    margin: EdgeInsets.only(
                                                        top: 3.v,
                                                        bottom: 12.v)),
                                                CustomTextFormField(
                                                    readOnly: true,
                                                    width: 113.h,
                                                    controller:
                                                        professionalProfileController
                                                            .aptsteController
                                                            .value,
                                                    margin: EdgeInsets.only(
                                                        left: 22.h, top: 2.v),
                                                    labelText: "Apt, Ste"),
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgLocation,
                                                    height: 20.v,
                                                    width: 17.h,
                                                    margin: EdgeInsets.only(
                                                        left: 43.h,
                                                        top: 3.v,
                                                        bottom: 12.v)),
                                                CustomTextFormField(
                                                    readOnly: true,
                                                    width: 109.h,
                                                    controller:
                                                        professionalProfileController
                                                            .zipvalueoneController
                                                            .value,
                                                    margin: EdgeInsets.only(
                                                        left: 22.h),
                                                    labelText: "ZIP",
                                                    textInputAction:
                                                        TextInputAction.done)
                                              ]),
                                          SizedBox(height: 26.v)
                                        ])),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.v),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
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
                                                          .getMagicLink(
                                                              context);
                                                    },
                                                    text: "Edit",
                                                    buttonTextStyle: TextStyle(
                                                        fontSize: 22.adaptSize),
                                                    rightIcon: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 16.h),
                                                        child: CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgArrowrightPrimary))),
                                              ),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                      )))),
        ));
  }
}
