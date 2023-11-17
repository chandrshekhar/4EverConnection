import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Financial%20profile/financial_profile_controller.dart';
import 'package:forever_connection/Controllers/Personal%20Details%20Controller/personal_details-controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:forever_connection/widgets/phone_number_formating_widget.dart';
import 'package:get/get.dart';

import '../../core/utils/address_autocomplete_widget.dart';

// ignore_for_file: must_be_immutable
class FinancialProfileScreen extends StatelessWidget {
  FinancialProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final financialController = Get.put(FinancialProfileController());
  final personalDetailsController = Get.put(PersonalDetailsController());
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
                                                controller: financialController
                                                    .taxProfessionalNameController
                                                    .value,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText:
                                                    "Tax Professional Name"))
                                      ]),
                                  SizedBox(height: 39.v),
                                  PhoneNumberTextFieldWidget(
                                    phoneController: financialController
                                        .phoneNumberController.value,
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
                                                  financialController
                                                      .addressController
                                                      .value
                                                      .text = address;
                                                },
                                                controller: financialController
                                                    .addressController.value,
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
                                                controller: financialController
                                                    .assetController.value,
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
                                                controller: financialController
                                                    .liabilitiesController
                                                    .value,
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
                                                                        financialController
                                                                            .netWorthController
                                                                            .value,
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
                                                controller: financialController
                                                    .incomeController.value,
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
                                                controller: financialController
                                                    .expansesController.value,
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
                                                controller: financialController
                                                    .cashflowController.value,
                                                margin:
                                                    EdgeInsets.only(left: 22.h),
                                                labelText: "Cashflow"))
                                      ]),
                                  SizedBox(height: 22.v)
                                ])),
                        SizedBox(height: 10.v),
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
                        SizedBox(height: 10.v),
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
