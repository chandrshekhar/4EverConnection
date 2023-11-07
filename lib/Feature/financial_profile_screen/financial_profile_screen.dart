import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:forever_connection/widgets/phone_number_formating_widget.dart';

import '../../core/utils/address_autocomplete_widget.dart';

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.lightBlue50,
        appBar: CustomAppBar(
            leadingWidth: 44.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                margin: EdgeInsets.only(left: 24.h, top: 20.v, bottom: 30.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Financial Profile"),
            actions: [
              AppbarImage1(
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
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
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
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText:
                                                    "Tax Professional Name"))
                                      ]),
                                  SizedBox(height: 39.v),
                                   PhoneNumberTextFieldWidget(
                                    phoneController:phoneController ,
                                    lable: "Mobile Phone",
                                  ),
                                  SizedBox(height: 39.v),
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
                                                top: 4.v, bottom: 12.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                readOnly: true,
                                                onTap: () async {
                                                  var address =
                                                      await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddressAutoCompleteWidget(),
                                                    ),
                                                  );
                                                  addressController.text =
                                                      address;
                                                },
                                                controller: addressController,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText: "Address"))
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
                                                ImageConstant.imgVectorGray600,
                                            height: 16.adaptSize,
                                            width: 16.adaptSize,
                                            margin: EdgeInsets.only(
                                                top: 6.v, bottom: 13.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                                controller: assetsController,
                                                margin:
                                                    EdgeInsets.only(left: 23.h),
                                                labelText: "Assets"))
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
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText: "Liabilities"))
                                      ]),
                                  SizedBox(height: 39.v),
                                  SizedBox(
                                      height: 112.v,
                                      width: 342.h,
                                      child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Align(
                                                alignment: Alignment.topCenter,
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
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            4.v,
                                                                        bottom:
                                                                            13.v)),
                                                            Expanded(
                                                                child: CustomTextFormField(
                                                                    controller:
                                                                        networthController,
                                                                    margin: EdgeInsets.only(
                                                                        left: 22
                                                                            .h),
                                                                    labelText:
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
                                                labelText: "Income",
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
                                                controller: expensesController,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText: "Expenses"))
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
                                                controller: cashflowController,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText: "Cashflow"))
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
                                      labelText: "Financial Health Notes",
                                      prefix: Container(
                                          margin: EdgeInsets.only(
                                              top: 5.v,
                                              right: 21.h,
                                              bottom: 5.v),
                                          child: CustomImageView(
                                              svgPath: ImageConstant.imgEdit)),
                                      prefixConstraints:
                                          BoxConstraints(maxHeight: 156.v),
                                      contentPadding:
                                          EdgeInsets.only(right: 30.h)),
                                  SizedBox(height: 40.v),
                                  custominputFieldWithContainer(
                                    title: "Outcome",
                                    imagePath: ImageConstant.imgUser,
                                  ),
                                  SizedBox(height: 39.v),
                                  custominputFieldWithContainer(
                                    title: "Health Issues",
                                    imagePath: ImageConstant.imgMap,
                                  ),
                                  SizedBox(height: 39.v),
                                  custominputFieldWithContainer(
                                    title: "Medications",
                                    imagePath: ImageConstant.imgUser,
                                  ),
                                  SizedBox(height: 42.v),
                                  SizedBox(height: 39.v),
                                  custominputFieldWithContainer(
                                    title: "Age of Siblings",
                                    imagePath: ImageConstant.imgCalendar,
                                  ),
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
                                                controller: fatherageController,
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
                                      controller: editController),
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
                                                controller: motherageController,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText: "Mother Age"))
                                      ]),
                                  SizedBox(height: 39.v),
                                  custominputFieldWithContainer(
                                      title: "(If death) Age and Cause",
                                      imagePath: ImageConstant.imgEdit,
                                      controller: editController),
                                  SizedBox(height: 39.v),
                                  custominputFieldWithContainer(
                                      title: "Other Health Notes",
                                      imagePath: ImageConstant.imgEdit,
                                      controller: editController),
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
                      ])))),
        ));
  }

  Widget custominputFieldWithContainer(
      {TextEditingController? controller,
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
          padding: EdgeInsets.all(2.v),
          decoration: BoxDecoration(
              border: Border.all(color: appTheme.black900, width: 1.h)),
          child: TextFormField(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
