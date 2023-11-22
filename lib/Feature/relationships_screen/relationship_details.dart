import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Personal%20Details%20Controller/personal_details-controller.dart';
import 'package:forever_connection/Controllers/Relationship%20Controller/relationship_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/size_utils.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:forever_connection/theme/theme_helper.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';
import 'package:forever_connection/widgets/custom_radio_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:forever_connection/widgets/phone_number_formating_widget.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/custom_elevated_button.dart';

class RelationshipDetailsScreen extends StatelessWidget {
  RelationshipDetailsScreen({
    required this.relationshipType,
    super.key,
  });

  final String relationshipType;

  final resControlle = Get.put(RelationShipController());
  final personalDetailsController = Get.put(PersonalDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarImage(
              svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
              margin: EdgeInsets.only(left: 24.h, top: 20.v, bottom: 30.v),
              onTap: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: relationshipType ?? ""),
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
        child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 11.v),
            child: Column(children: [
              SizedBox(height: 11.v),
              Container(
                  margin: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.h, vertical: 12.v),
                  decoration: AppDecoration.outlineBlack.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Personal Profile",
                            style: theme.textTheme.titleMedium),
                        SizedBox(height: 24.v),
                        rowWidget(
                            controller: resControlle.firstNameController.value,
                            svgpath: ImageConstant.imgUser,
                            labelText: "First Name"),
                        SizedBox(height: 38.v),
                        rowWidget(
                            controller: resControlle.middlenameController.value,
                            svgpath: ImageConstant.imgUser,
                            labelText: "Middle Name"),
                        SizedBox(height: 39.v),
                        rowWidget(
                            controller: resControlle.lastNameController.value,
                            svgpath: ImageConstant.imgUser,
                            labelText: "Last Name"),
                        SizedBox(height: 38.v),
                        PhoneNumberTextFieldWidget(
                          readOnly: true,
                          phoneController: resControlle.phoneController.value,
                          lable: "Mobile Phone",
                          suffix: InkWell(
                            onTap: () async {
                              try {
                                final Uri phoneLaunchUri = Uri(
                                    scheme: 'tel',
                                    path: resControlle
                                        .phoneController.value.text);

                                launchUrl(phoneLaunchUri);
                                // launchUrl(Uri.parse(url));
                              } catch (e) {
                                log(e.toString());
                              }
                            },
                            child: Container(
                                color: AppColors.floatingActionButtonColor,
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.h, horizontal: 10.v),
                                child: const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          ),
                        ),
                        SizedBox(height: 38.v),
                        PhoneNumberTextFieldWidget(
                          phoneController:
                              resControlle.homephoneController.value,
                          readOnly: true,
                          lable: "Home Phone",
                          suffix: InkWell(
                            onTap: () async {
                              try {
                                final Uri phoneLaunchUri = Uri(
                                    scheme: 'tel',
                                    path: resControlle
                                        .homephoneController.value.text);

                                launchUrl(phoneLaunchUri);
                                // launchUrl(Uri.parse(url));
                              } catch (e) {
                                log(e.toString());
                              }
                            },
                            child: Container(
                                color: AppColors.floatingActionButtonColor,
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.h, horizontal: 10.v),
                                child: const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          ),
                        ),
                        SizedBox(height: 38.v),
                        rowWidget(
                            controller: resControlle.emailController.value,
                            svgpath: ImageConstant.imgVector,
                            labelText: "Personal Email"),
                        SizedBox(height: 38.v),
                        rowWidget(
                            controller:
                                resControlle.homeaddressController.value,
                            svgpath: ImageConstant.imgLocation,
                            labelText: "Home Address"),
                        SizedBox(height: 39.v),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: 20.v,
                                  width: 17.h,
                                  margin:
                                      EdgeInsets.only(top: 3.v, bottom: 12.v)),
                              CustomTextFormField(
                                  readOnly: true,
                                  width: 113.h,
                                  controller:
                                      resControlle.aptsteContoller.value,
                                  margin: EdgeInsets.only(left: 22.h, top: 2.v),
                                  labelText: "Apt, Ste"),
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: 20.v,
                                  width: 17.h,
                                  margin: EdgeInsets.only(
                                      left: 43.h, top: 3.v, bottom: 12.v)),
                              CustomTextFormField(
                                  readOnly: true,
                                  width: 109.h,
                                  controller: resControlle.zipController.value,
                                  margin: EdgeInsets.only(left: 22.h),
                                  labelText: "ZIP")
                            ]),
                        SizedBox(height: 38.v),
                        rowWidget(
                            svgpath: ImageConstant.imgCalendar,
                            controller:
                                resControlle.dateOfBirthController.value,
                            labelText: "Date of Birth"),
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
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomRadioButton(
                                      text: "Male",
                                      value: "Male",
                                      groupValue: "Male",
                                      onChange: (p0) {},
                                    ),
                                    CustomRadioButton(
                                        text: "Female",
                                        value: "Female",
                                        groupValue: "",
                                        onChange: (value) {}),
                                    CustomRadioButton(
                                        text: "Other",
                                        value: "Other",
                                        groupValue: "",
                                        onChange: (value) {}),
                                  ]),
                            )),
                        SizedBox(height: 25.v),
                        rowWidget(
                            controller: resControlle.socielsecurityNumber.value,
                            svgpath: ImageConstant.imgCall,
                            labelText: "Social Security Number"),
                        SizedBox(height: 40.v),
                        rowWidget(
                            controller:
                                resControlle.birthcountryController.value,
                            svgpath: ImageConstant.imgLocation,
                            labelText: "Country of Birth"),
                        SizedBox(height: 40.v),
                        rowWidget(
                            controller: resControlle
                                .birthcitizencountryController.value,
                            svgpath: ImageConstant.imgLocation,
                            labelText: "Country of Citizenship"),
                        SizedBox(height: 14.v)
                      ])),
              SizedBox(height: 13.v),
              Container(
                margin: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 25.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text("Professional Profile",
                            style: theme.textTheme.titleMedium)),
                    rowWidget(
                        controller: resControlle.businessnameController.value,
                        svgpath: ImageConstant.imgFile,
                        labelText: "Business Name"),
                    Padding(
                      padding: EdgeInsets.only(left: 1.h, top: 39.v),
                      child: PhoneNumberTextFieldWidget(
                        readOnly: true,
                        phoneController:
                            resControlle.businessphoneController.value,
                        lable: "Business Phone",
                        suffix: InkWell(
                          onTap: () async {
                            try {
                              final Uri phoneLaunchUri = Uri(
                                  scheme: 'tel',
                                  path: resControlle
                                      .businessphoneController.value.text);

                              launchUrl(phoneLaunchUri);
                              // launchUrl(Uri.parse(url));
                            } catch (e) {
                              log(e.toString());
                            }
                          },
                          child: Container(
                              color: AppColors.floatingActionButtonColor,
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.v),
                              child: const Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 15,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 39.v),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgVideocamera,
                                  height: 17.adaptSize,
                                  width: 17.adaptSize,
                                  margin:
                                      EdgeInsets.only(top: 6.v, bottom: 13.v)),
                              Expanded(
                                  child: CustomTextFormField(
                                      readOnly: true,
                                      controller: resControlle
                                          .businessfaxController.value,
                                      margin: EdgeInsets.only(left: 22.h),
                                      labelText: "Business Fax"))
                            ])),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 39.v),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgVector,
                                  height: 17.adaptSize,
                                  width: 17.adaptSize,
                                  margin:
                                      EdgeInsets.only(top: 6.v, bottom: 13.v)),
                              Expanded(
                                  child: CustomTextFormField(
                                      readOnly: true,
                                      controller: resControlle
                                          .businessemailController.value,
                                      margin: EdgeInsets.only(left: 22.h),
                                      labelText: "Business Email",
                                      textInputType:
                                          TextInputType.emailAddress))
                            ])),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 39.v),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgGlobe,
                                  height: 17.v,
                                  width: 19.h,
                                  margin:
                                      EdgeInsets.only(top: 6.v, bottom: 13.v)),
                              Expanded(
                                  child: CustomTextFormField(
                                      readOnly: true,
                                      controller: resControlle
                                          .businesswebsitecontroller.value,
                                      margin: EdgeInsets.only(left: 20.h),
                                      labelText: "Business Website"))
                            ])),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 39.v),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgUser,
                                  height: 19.v,
                                  width: 17.h,
                                  margin:
                                      EdgeInsets.only(top: 4.v, bottom: 13.v)),
                              Expanded(
                                  child: CustomTextFormField(
                                readOnly: true,
                                margin: EdgeInsets.only(left: 22.h),
                                controller: resControlle
                                    .businessPositionController.value,
                                labelText: "Position",
                              ))
                            ])),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 41.v),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgCarGray600,
                                  height: 17.adaptSize,
                                  width: 17.adaptSize,
                                  margin:
                                      EdgeInsets.only(top: 3.v, bottom: 14.v)),
                              Expanded(
                                  child: CustomTextFormField(
                                      readOnly: true,
                                      margin: EdgeInsets.only(left: 22.h),
                                      controller:
                                          resControlle.myidealController.value,
                                      labelText: "My Ideal Occupation"))
                            ])),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 39.v),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgVectorGray60018x22,
                                  height: 18.v,
                                  width: 22.h,
                                  margin:
                                      EdgeInsets.only(top: 6.v, bottom: 12.v)),
                              Expanded(
                                  child: CustomTextFormField(
                                readOnly: true,
                                margin: EdgeInsets.only(left: 17.h),
                                controller:
                                    resControlle.educationlevelcontroller.value,
                                labelText: "Education Level",
                              ))
                            ])),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 42.v),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgVectorGray60018x22,
                                  height: 18.v,
                                  width: 22.h,
                                  margin:
                                      EdgeInsets.only(top: 3.v, bottom: 12.v)),
                              Expanded(
                                  child: CustomTextFormField(
                                      readOnly: true,
                                      controller:
                                          resControlle.degreeController.value,
                                      margin: EdgeInsets.only(left: 17.h),
                                      labelText: "Degree"))
                            ])),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 39.v),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgUser,
                                  height: 19.v,
                                  width: 17.h,
                                  margin:
                                      EdgeInsets.only(top: 4.v, bottom: 13.v)),
                              Expanded(
                                  child: CustomTextFormField(
                                readOnly: true,
                                margin: EdgeInsets.only(left: 22.h),
                                controller:
                                    resControlle.affiliationsController.value,
                                labelText: "Affiliations",
                              ))
                            ])),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 39.v),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: 20.v,
                                  width: 17.h,
                                  margin:
                                      EdgeInsets.only(top: 4.v, bottom: 12.v)),
                              Expanded(
                                  child: CustomTextFormField(
                                readOnly: true,
                                onTap: () async {
                                  // var address = await Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         AddressAutoCompleteWidget(),
                                  //   ),
                                  // );
                                  // relationship
                                  //     .businessAddressaddress
                                  //     .value
                                  //     .text = address;
                                },
                                margin: EdgeInsets.only(left: 22.h),
                                labelText: "Business Address",
                                controller: resControlle
                                    .businessAddressaddressController.value,
                              ))
                            ])),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 1.h, top: 40.v, bottom: 13.v),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgLocation,
                              height: 20.v,
                              width: 17.h,
                              margin: EdgeInsets.only(top: 3.v, bottom: 12.v)),
                          CustomTextFormField(
                              readOnly: true,
                              controller: resControlle
                                  .businessaptsteoneController.value,
                              width: 113.h,
                              margin: EdgeInsets.only(left: 22.h, top: 2.v),
                              labelText: "Apt, Ste"),
                          CustomImageView(
                              svgPath: ImageConstant.imgLocation,
                              height: 20.v,
                              width: 17.h,
                              margin: EdgeInsets.only(
                                  left: 43.h, top: 3.v, bottom: 12.v)),
                          CustomTextFormField(
                              readOnly: true,
                              width: 109.h,
                              controller:
                                  resControlle.businessziponeController.value,
                              margin: EdgeInsets.only(left: 22.h),
                              labelText: "ZIP",
                              textInputAction: TextInputAction.done)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 5.v),
                    Obx(
                      () => personalDetailsController.isLoadingEdit.value
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : Expanded(
                              child: CustomElevatedButton(
                                  onTap: () async {
                                    await personalDetailsController
                                        .getMagicLink(context);
                                  },
                                  text: "Edit",
                                  buttonTextStyle:
                                      TextStyle(fontSize: 22.adaptSize),
                                  rightIcon: Container(
                                      margin: EdgeInsets.only(left: 16.h),
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightPrimary))),
                            ),
                    )
                  ],
                ),
              ),
            ])),
      ),
    );
  }

  Widget rowWidget(
      {String? svgpath, String? labelText, TextEditingController? controller}) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomImageView(
          svgPath: ImageConstant.imgUser,
          height: 19.v,
          width: 17.h,
          margin: EdgeInsets.only(top: 4.v, bottom: 13.v)),
      Expanded(
          child: CustomTextFormField(
              controller: controller,
              readOnly: true,
              margin: EdgeInsets.only(left: 22.h),
              labelText: labelText))
    ]);
  }
}
