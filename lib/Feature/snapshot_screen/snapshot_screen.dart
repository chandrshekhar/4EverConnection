import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Personal%20Details%20Controller/personal_details-controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/utils/address_autocomplete_widget.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import '../../Controllers/Snapshot Controller/snapshot_controller.dart';
import '../../widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class SnapshotScreen extends StatelessWidget {
  SnapshotScreen({Key? key}) : super(key: key);

  final snapshotController = Get.put(UserSnapshotController());
  final personalDetailsController = Get.put(PersonalDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.lightBlue50,
      appBar: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarImage(
              svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
              margin: EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 11.v),
        child: Column(
          children: [
            Obx(
              () => Container(
                  margin: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                  padding: EdgeInsets.all(11.h),
                  decoration: AppDecoration.outlineBlack.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgUser,
                              height: 19.v,
                              width: 17.h,
                              margin: EdgeInsets.only(top: 4.v, bottom: 13.v)),
                          Expanded(
                              child: CustomTextFormField(
                            readOnly: true,
                            controller:
                                snapshotController.firstNameController.value,
                            margin: EdgeInsets.only(left: 22.h),
                            labelText: "First Name",
                          ))
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
                              margin: EdgeInsets.only(top: 4.v, bottom: 13.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  controller: snapshotController
                                      .middleNameController.value,
                                  margin: EdgeInsets.only(left: 22.h),
                                  labelText: "Middle Name"))
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
                              margin: EdgeInsets.only(top: 4.v, bottom: 13.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  controller: snapshotController
                                      .lastNameController.value,
                                  margin: EdgeInsets.only(left: 22.h),
                                  labelText: "Last Name"))
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
                              margin: EdgeInsets.only(top: 1.v, bottom: 12.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  controller: snapshotController
                                      .companyNameController.value,
                                  margin: EdgeInsets.only(left: 23.h),
                                  labelText: "Company Name"))
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
                              margin: EdgeInsets.only(top: 4.v, bottom: 13.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  margin: EdgeInsets.only(left: 22.h),
                                  labelText: "Position",
                                  controller: snapshotController
                                      .positionController.value,
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
                              margin: EdgeInsets.only(top: 3.v, bottom: 14.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  controller: snapshotController
                                      .occupationController.value,
                                  margin: EdgeInsets.only(left: 22.h),
                                  labelText: "Occupation"))
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
                              margin: EdgeInsets.only(top: 3.v, bottom: 14.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  controller: snapshotController
                                      .idealOccupationController.value,
                                  margin: EdgeInsets.only(left: 22.h),
                                  labelText: "Ideal Occupation"))
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
                              margin: EdgeInsets.only(top: 8.v, bottom: 13.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  controller: snapshotController
                                      .phoneNumberController.value,
                                  margin: EdgeInsets.only(left: 24.h),
                                  labelText: "Mobile Phone",
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
                              margin: EdgeInsets.only(top: 8.v, bottom: 13.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  controller: snapshotController
                                      .homePhoneController.value,
                                  margin: EdgeInsets.only(left: 24.h),
                                  labelText: "Home Phone",
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
                              margin: EdgeInsets.only(top: 8.v, bottom: 13.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  controller: snapshotController
                                      .businessPhoneController.value,
                                  margin: EdgeInsets.only(left: 24.h),
                                  labelText: "Business Phone",
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
                              margin: EdgeInsets.only(top: 6.v, bottom: 13.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  controller: snapshotController
                                      .businessFaxController.value,
                                  margin: EdgeInsets.only(left: 22.h),
                                  labelText: "Business Fax"))
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
                              margin: EdgeInsets.only(top: 4.v, bottom: 12.v)),
                          Expanded(
                              child: CustomTextFormField(
                                  readOnly: true,
                                  controller: snapshotController
                                      .homeAddressController.value,
                                  margin: EdgeInsets.only(left: 22.h),
                                  labelText: "Home Address"))
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
                              margin: EdgeInsets.only(top: 3.v, bottom: 12.v)),
                          CustomTextFormField(
                              readOnly: true,
                              controller:
                                  snapshotController.homeAptSteController.value,
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
                              textInputType: TextInputType.number,
                              readOnly: true,
                              controller:
                                  snapshotController.homeZipController.value,
                              width: 109.h,
                              margin: EdgeInsets.only(left: 22.h),
                              labelText: "ZIP")
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
                              margin: EdgeInsets.only(top: 4.v, bottom: 12.v)),
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
                                    snapshotController.businessAddressController
                                        .value.text = address;
                                  },
                                  readOnly: true,
                                  controller: snapshotController
                                      .businessAddressController.value,
                                  margin: EdgeInsets.only(left: 22.h),
                                  labelText: "Business Address"))
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
                              margin: EdgeInsets.only(top: 3.v, bottom: 12.v)),
                          CustomTextFormField(
                              readOnly: true,
                              controller: snapshotController
                                  .businessAptStecontroller.value,
                              width: 113.h,
                              margin: EdgeInsets.only(left: 22.h, top: 2.v),
                              labelText: "Apt, Ste"),
                          const Spacer(),
                          CustomTextFormField(
                              textInputType: TextInputType.number,
                              readOnly: true,
                              controller: snapshotController
                                  .businessZipController.value,
                              width: 109.h,
                              labelText: "ZIP")
                        ]),
                    SizedBox(height: 20.v)
                  ])),
            ),
            SizedBox(height: 12.v),
            Container(
              margin: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 22.v),
              decoration: AppDecoration.outlineBlack
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgUser,
                        height: 19.v,
                        width: 17.h,
                        margin: EdgeInsets.only(top: 1.v, bottom: 13.v)),
                    Expanded(
                        child: CustomTextFormField(
                            readOnly: true,
                            controller:
                                snapshotController.spouseController.value,
                            margin: EdgeInsets.only(left: 22.h),
                            labelText: "Spouse"))
                  ]),
                  SizedBox(height: 40.v),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgCall,
                        height: 15.adaptSize,
                        width: 15.adaptSize,
                        margin: EdgeInsets.only(top: 7.v, bottom: 13.v)),
                    Expanded(
                        child: CustomTextFormField(
                            readOnly: true,
                            controller: snapshotController
                                .spouseLifePartnerPhoneController.value,
                            margin: EdgeInsets.only(left: 24.h),
                            labelText: "Spouse / Life Partner Phone",
                            textInputType: TextInputType.phone))
                  ]),
                  SizedBox(height: 39.v),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgVector,
                        height: 17.adaptSize,
                        width: 17.adaptSize,
                        margin: EdgeInsets.only(top: 6.v, bottom: 13.v)),
                    Expanded(
                        child: CustomTextFormField(
                            readOnly: true,
                            controller: snapshotController
                                .personalEmailController.value,
                            margin: EdgeInsets.only(left: 22.h),
                            labelText: "Personal Email",
                            textInputType: TextInputType.emailAddress))
                  ]),
                  SizedBox(height: 39.v),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgVector,
                        height: 17.adaptSize,
                        width: 17.adaptSize,
                        margin: EdgeInsets.only(top: 6.v, bottom: 13.v)),
                    Expanded(
                        child: CustomTextFormField(
                            readOnly: true,
                            controller: snapshotController
                                .businessEmailController.value,
                            margin: EdgeInsets.only(left: 22.h),
                            labelText: "Business Email",
                            textInputType: TextInputType.emailAddress))
                  ]),
                  SizedBox(height: 39.v),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgGlobe,
                        height: 17.v,
                        width: 19.h,
                        margin: EdgeInsets.only(top: 6.v, bottom: 13.v)),
                    Expanded(
                        child: CustomTextFormField(
                            readOnly: true,
                            controller:
                                snapshotController.websiteUrlController.value,
                            margin: EdgeInsets.only(left: 20.h),
                            labelText: "Website",
                            textInputAction: TextInputAction.done))
                  ]),
                  SizedBox(height: 30.v),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 5),
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
                                buttonTextStyle: TextStyle(fontSize: 22),
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
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
