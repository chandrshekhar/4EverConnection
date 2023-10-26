import 'package:forever_connection/Feature/Connection/Controller/connection_controller.dart';
import 'package:forever_connection/Feature/request_service_one_screen/widgets/timedisplay_item_widget.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Controller/reqiest_service_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_drop_down.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreateConnectionScreen extends StatefulWidget {
  const CreateConnectionScreen({Key? key}) : super(key: key);

  @override
  State<CreateConnectionScreen> createState() => _CreateConnectionScreenState();
}

class _CreateConnectionScreenState extends State<CreateConnectionScreen> {
  final requestServiceController = Get.put(RequestServiceController());
  final connectionController = Get.put(ConnectionController());
  @override
  void initState() {
    super.initState();
    // Initialize the selected value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: AppbarTitle(text: "Create Connection"),
          styleType: Style.bgShadow),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.v),
              decoration: AppDecoration.outlineBlack
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 29.v),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgSettings,
                              height: 18.adaptSize,
                              width: 18.adaptSize,
                              margin: EdgeInsets.only(top: 5.v, bottom: 13.v)),
                          Expanded(
                              child: CustomDropDown(
                                  icon: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          30.h, 10.v, 15.h, 10.v),
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgVectorGray6004x7)),
                                  margin: EdgeInsets.only(left: 22.h),
                                  hintText: "Service Needed",
                                  items:
                                      requestServiceController.listOfServices,
                                  whereUse: "professional",
                                  borderDecoration:
                                      DropDownStyleHelper.underLineBlack,
                                  onChanged: (value) async {
                                    requestServiceController
                                        .setServiceId(value.id);
                                    await requestServiceController
                                        .getPartnerByServiceId(value.id);
                                  }))
                        ]),
                    SizedBox(height: 29.v),
                    Obx(
                      () => requestServiceController.isPartnerLoading.value
                          ? Center(
                              child: LottieBuilder.asset(
                                "assets/lottie/linear_loader.json",
                                height: 60,
                              ),
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgUser,
                                    height: 19.v,
                                    width: 17.h,
                                    margin: EdgeInsets.only(
                                        top: 2.v, bottom: 13.v)),
                                Expanded(
                                  child: Obx(
                                    () => CustomDropDown(
                                      icon: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 10.v, 15.h, 10.v),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgVectorGray6004x7),
                                      ),
                                      margin: EdgeInsets.only(left: 22.h),
                                      hintText: "Select Partner",
                                      items: requestServiceController
                                          .partnerList.value,
                                      whereUse: "partner",
                                      borderDecoration:
                                          DropDownStyleHelper.underLineBlack,
                                      onChanged: (value) async {
                                        requestServiceController
                                            .setPartnerId(value.id);
                                        await requestServiceController
                                            .getUsedSlotList(value.id);
                                        requestServiceController
                                            .setLocalListToEmpty();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 29.v),
                    CustomTextFormField(
                        controller:
                            connectionController.firstNameController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                        hintText: "First name *",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        validator: (value) {
                          if (value!.length < 10) {
                            return "Notes have atleast 10 character";
                          } else {
                            return null;
                          }
                        },
                        fillColor: theme.colorScheme.primary),
                    CustomTextFormField(
                        controller:
                            connectionController.middleNameController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "Middle name (if Any)",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    CustomTextFormField(
                        controller:
                            connectionController.lastNameController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "Last name *",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    CustomTextFormField(
                        controller: connectionController.phoneController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "Phone number *",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    CustomTextFormField(
                        controller:
                            connectionController.personalEmailController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "Personal Email *",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    CustomTextFormField(
                        controller:
                            connectionController.businessNameController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "Business Name (If Any)",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    CustomTextFormField(
                        controller:
                            connectionController.homeAddressController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "Home Address *",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    CustomTextFormField(
                        controller: connectionController.aptController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "Apt, Ste",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    CustomTextFormField(
                        controller: connectionController.zipController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "ZIP *",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: const OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    SizedBox(
                      height: 20.adaptSize,
                    ),
                    CustomElevatedButton(
                        onTap: () {
                          requestServiceController.addServiceRequest();
                        },
                        text: "Create Connection",
                        margin: EdgeInsets.only(
                            left: 24.h, right: 24.h, bottom: 22.v),
                        rightIcon: Container(
                            margin: EdgeInsets.only(left: 16.h),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgArrowrightPrimary)))
                  ]),
            ),
          ),
          SizedBox(
            height: 20.adaptSize,
          )
        ]),
      ),
    );
  }
}
