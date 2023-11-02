import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/utils/address_autocomplete_widget.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:forever_connection/widgets/phone_number_formating_widget.dart';
import 'package:get/get.dart';

import '../../Controllers/Professional Details/professional_details_controller.dart';

// ignore_for_file: must_be_immutable
class ProfessionalProfileScreen extends StatelessWidget {
  ProfessionalProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final professionalProfileController = Get.put(ProfessionalDetalsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: AppbarTitle(text: "Professional Profile"),
            actions: [
              AppbarImage1(
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.notificationsScreen);
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
                                                controller:
                                                    professionalProfileController
                                                        .businessnameController
                                                        .value,
                                                margin: EdgeInsets.only(
                                                    left: 23.h),
                                                labelText: "Business Name"))
                                      ]),
                                  SizedBox(height: 39.v),
                                  const PhoneNumberTextFieldWidget(
                                    lable: "Business Phone",
                                  ),
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
                                                    professionalProfileController
                                                        .businessfaxoneController
                                                        .value,
                                                margin: EdgeInsets.only(
                                                    left: 22.h),
                                                labelText: "Business Fax"))
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
                                                    professionalProfileController
                                                        .businessemailController
                                                        .value,
                                                margin: EdgeInsets.only(
                                                    left: 22.h),
                                                labelText: "Business Email",
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
                                            svgPath: ImageConstant.imgUser,
                                            height: 19.v,
                                            width: 17.h,
                                            margin: EdgeInsets.only(
                                                top: 4.v, bottom: 13.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                controller:
                                                    professionalProfileController
                                                        .positionvalueController
                                                        .value,
                                                margin: EdgeInsets.only(
                                                    left: 22.h),
                                                labelText: "Position",
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
                                                top: 6.v, bottom: 12.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                controller:
                                                    professionalProfileController
                                                        .educationlevelController
                                                        .value,
                                                margin: EdgeInsets.only(
                                                    left: 19.h),
                                                labelText: "Education Level",
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
                                            svgPath: ImageConstant.imgUser,
                                            height: 19.v,
                                            width: 17.h,
                                            margin: EdgeInsets.only(
                                                top: 4.v, bottom: 13.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                controller:
                                                    professionalProfileController
                                                        .affiliationsvalController
                                                        .value,
                                                margin: EdgeInsets.only(
                                                    left: 22.h),
                                                labelText: "Affiliations"))
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
                                                onTap: () async {
                                                  var address =
                                                      await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddressAutoCompleteWidget(),
                                                    ),
                                                  );
                                                  professionalProfileController
                                                      .addressController
                                                      .value
                                                      .text = address;
                                                },
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
                                            svgPath:
                                                ImageConstant.imgLocation,
                                            height: 20.v,
                                            width: 17.h,
                                            margin: EdgeInsets.only(
                                                top: 3.v, bottom: 12.v)),
                                        CustomTextFormField(
                                            width: 113.h,
                                            controller:
                                                professionalProfileController
                                                    .aptsteController.value,
                                            margin: EdgeInsets.only(
                                                left: 22.h, top: 2.v),
                                            labelText: "Apt, Ste"),
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
                                                professionalProfileController
                                                    .zipvalueoneController
                                                    .value,
                                            margin:
                                                EdgeInsets.only(left: 22.h),
                                            labelText: "ZIP",
                                            textInputAction:
                                                TextInputAction.done)
                                      ]),
                                  SizedBox(height: 26.v)
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
                      ])))),
        ));
  }
}
