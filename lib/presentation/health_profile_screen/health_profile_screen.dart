import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class HealthProfileScreen extends StatelessWidget {
  HealthProfileScreen({Key? key}) : super(key: key);

  TextEditingController heightftoneController = TextEditingController();

  TextEditingController heightinchsoneController = TextEditingController();

  TextEditingController weightlbsoneController = TextEditingController();

  TextEditingController smokervalueoneController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController doctorstreetController = TextEditingController();

  TextEditingController degreevalueoneController = TextEditingController();

  TextEditingController aptsteController = TextEditingController();

  TextEditingController zipvalueoneController = TextEditingController();

  TextEditingController edittextController = TextEditingController();

  TextEditingController edittextoneController = TextEditingController();

  TextEditingController edittexttwoController = TextEditingController();

  TextEditingController edittextthreeController = TextEditingController();

  TextEditingController edittextfourController = TextEditingController();

  TextEditingController fatherageoneController = TextEditingController();

  TextEditingController fatheragethreeController = TextEditingController();

  TextEditingController edittextfiveController = TextEditingController();

  TextEditingController edittextsixController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                title: AppbarTitle(text: "Health Profile"),
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
                                                  controller:
                                                      heightftoneController,
                                                  margin: EdgeInsets.only(
                                                      left: 24.h),
                                                  hintText: "Height (FT)"))
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
                                                  controller:
                                                      heightinchsoneController,
                                                  margin: EdgeInsets.only(
                                                      left: 27.h),
                                                  hintText: "Height (Inchs)"))
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
                                                  controller:
                                                      weightlbsoneController,
                                                  margin: EdgeInsets.only(
                                                      left: 23.h),
                                                  hintText: "Weight (LBS)"))
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
                                                  ImageConstant.imgComputer,
                                              height: 16.v,
                                              width: 23.h,
                                              margin: EdgeInsets.only(
                                                  top: 7.v, bottom: 13.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      smokervalueoneController,
                                                  margin: EdgeInsets.only(
                                                      left: 16.h),
                                                  hintText: "Smoker",
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
                                                  controller: nameController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Doctor Name"))
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
                                                  hintText: "Doctor Phone",
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
                                                  ImageConstant.imgCalendar,
                                              height: 19.v,
                                              width: 17.h,
                                              margin: EdgeInsets.only(
                                                  top: 4.v, bottom: 13.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller: dateController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText:
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
                                              svgPath:
                                                  ImageConstant.imgLocation,
                                              height: 20.v,
                                              width: 17.h,
                                              margin: EdgeInsets.only(
                                                  top: 3.v, bottom: 12.v)),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  controller:
                                                      doctorstreetController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Doctor Street"))
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
                                              hintText: "ZIP")
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
                                    Row(children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgEdit,
                                          height: 18.adaptSize,
                                          width: 18.adaptSize,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 4.v)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 21.h),
                                          child: Text("Reason",
                                              style: theme.textTheme.bodyLarge))
                                    ]),
                                    SizedBox(height: 4.v),
                                    CustomTextFormField(
                                        controller: edittextController,
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineBlack),
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
                                    CustomTextFormField(
                                        controller: edittextoneController,
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineBlack),
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
                                    CustomTextFormField(
                                        controller: edittexttwoController,
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineBlack),
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
                                    CustomTextFormField(
                                        controller: edittextthreeController,
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineBlack),
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
                                    CustomTextFormField(
                                      
                                        controller: edittextfourController,
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineBlack),
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
                                                      fatherageoneController,
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
                                                      fatheragethreeController,
                                                  margin: EdgeInsets.only(
                                                      left: 22.h),
                                                  hintText: "Mother Age"))
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
                                    CustomTextFormField(
                                        controller: edittextfiveController,
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineBlack),
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
                                    CustomTextFormField(
                                        controller: edittextsixController,
                                        textInputAction: TextInputAction.done,
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineBlack)
                                  ])),
                          Container(
                              margin: EdgeInsets.only(
                                  left: 12.h, top: 24.v, right: 12.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 139.h, vertical: 14.v),
                              decoration: AppDecoration.fillYellow.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder4),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Save",
                                        style: CustomTextStyles
                                            .bodyLargePrimary16),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowrightPrimary,
                                        height: 11.v,
                                        width: 6.h,
                                        margin: EdgeInsets.only(
                                            top: 7.v, bottom: 6.v))
                                  ])),
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
