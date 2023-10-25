import 'dart:developer';

import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Controller/reqiest_service_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../request_service_one_screen/widgets/timedisplay_item_widget.dart';
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
class RequestServiceOneScreen extends StatefulWidget {
  const RequestServiceOneScreen({Key? key}) : super(key: key);

  @override
  State<RequestServiceOneScreen> createState() =>
      _RequestServiceOneScreenState();
}

class _RequestServiceOneScreenState extends State<RequestServiceOneScreen> {
  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  String servicetype = "";

  List<String> radioList = ["lbl_in_person", "lbl_phone", "lbl_video"];

  TextEditingController commentController = TextEditingController();

  final requestServiceController = Get.put(RequestServiceController());
  @override
  void initState() {
    requestServiceController.partnerList.clear();
    requestServiceController.setLocalListToEmpty();
    requestServiceController.activeIndex.value = -1;
    requestServiceController.selectedDate.value = DateTime.now();
    requestServiceController.selectDateController.value.clear();
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
                margin:
                    EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Request Service"),
            actions: [
              AppbarImage1(
                  svgPath: ImageConstant.imgCart,
                  margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 25.v))
            ],
            styleType: Style.bgShadow),
        body: Column(children: [
          SizedBox(height: 12.v),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 12.h, right: 12.h, bottom: 5.v),
                      child: Column(children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 10.v),
                            decoration: AppDecoration.outlineBlack.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder16),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 4.v),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgCalendar,
                                            height: 18.adaptSize,
                                            width: 18.adaptSize,
                                            margin: EdgeInsets.only(
                                                top: 5.v, bottom: 13.v)),
                                        Expanded(
                                            child: CustomTextFormField(
                                          onTap: () {
                                            requestServiceController
                                                .selectDate(context);
                                          },
                                          controller:
                                              requestServiceController
                                                  .selectDateController
                                                  .value,
                                          margin:
                                              EdgeInsets.only(left: 21.h),
                                          readOnly: true,
                                          hintText: "Select Date",
                                          contentPadding: EdgeInsets.zero,
                                          suffix:
                                              Icon(Icons.calendar_month),
                                        ))
                                      ]),
                                  SizedBox(height: 29.v),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgSettings,
                                            height: 18.adaptSize,
                                            width: 18.adaptSize,
                                            margin: EdgeInsets.only(
                                                top: 5.v, bottom: 13.v)),
                                        Expanded(
                                            child: CustomDropDown(
                                                icon: Container(
                                                    margin:
                                                        EdgeInsets.fromLTRB(
                                                            30.h,
                                                            10.v,
                                                            15.h,
                                                            10.v),
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgVectorGray6004x7)),
                                                margin: EdgeInsets.only(
                                                    left: 22.h),
                                                hintText: "Service Needed",
                                                items:
                                                    requestServiceController
                                                        .listOfServices,
                                                whereUse: "professional",
                                                borderDecoration:
                                                    DropDownStyleHelper
                                                        .underLineBlack,
                                                onChanged: (value) async {
                                                  requestServiceController
                                                      .setServiceId(
                                                          value.id);
                                                  await requestServiceController
                                                      .getPartnerByServiceId(
                                                          value.id);
                                                }))
                                      ]),
                                  SizedBox(height: 29.v),
                                  Obx(
                                    () => requestServiceController
                                            .isPartnerLoading.value
                                        ? Center(
                                            child: LottieBuilder.asset(
                                              "assets/lottie/linear_loader.json",
                                              height: 60,
                                            ),
                                          )
                                        : Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgUser,
                                                  height: 19.v,
                                                  width: 17.h,
                                                  margin: EdgeInsets.only(
                                                      top: 2.v,
                                                      bottom: 13.v)),
                                              Expanded(
                                                child: Obx(
                                                  () => CustomDropDown(
                                                    icon: Container(
                                                      margin: EdgeInsets
                                                          .fromLTRB(
                                                              30.h,
                                                              10.v,
                                                              15.h,
                                                              10.v),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgVectorGray6004x7),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        left: 22.h),
                                                    hintText:
                                                        "Select Partner",
                                                    items:
                                                        requestServiceController
                                                            .partnerList
                                                            .value,
                                                    whereUse: "partner",
                                                    borderDecoration:
                                                        DropDownStyleHelper
                                                            .underLineBlack,
                                                    onChanged:
                                                        (value) async {
                                                      requestServiceController
                                                          .setPartnerId(
                                                              value.id);
                                                      await requestServiceController
                                                          .getUsedSlotList(
                                                              value.id);
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
                                  Text("Service type",
                                      style: theme.textTheme.bodyLarge),
                                  SizedBox(height: 8.v),
                                  Obx(() => Row(
                                        children: <Widget>[
                                          Radio(
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue),
                                            value: 'In-person',
                                            groupValue:
                                                requestServiceController
                                                    .selectedValue.value,
                                            onChanged: (value) {
                                              requestServiceController
                                                  .toggleBetweenRdioButton(
                                                      value);
                                            },
                                          ),
                                          const Text('In person'),
                                          SizedBox(width: 20.v),
                                          Radio(
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blue),
                                              value: 'Phone',
                                              groupValue:
                                                  requestServiceController
                                                      .selectedValue.value,
                                              onChanged: (value) {
                                                requestServiceController
                                                    .toggleBetweenRdioButton(
                                                        value);
                                              }),
                                          const Text('Phone'),
                                          SizedBox(width: 20.v),
                                          Radio(
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue),
                                            value: 'Video',
                                            groupValue:
                                                requestServiceController
                                                    .selectedValue.value,
                                            onChanged: (value) {
                                              requestServiceController
                                                  .toggleBetweenRdioButton(
                                                      value);
                                            },
                                          ),
                                          const Text('Video'),
                                        ],
                                      )),
                                ])),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 12.h, top: 23.v, right: 12.h),
                            child: Obx(() => requestServiceController
                                    .listOfTimeSlot.isNotEmpty
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisExtent: 52.v,
                                            crossAxisCount: 4,
                                            mainAxisSpacing: 5.h,
                                            crossAxisSpacing: 5.h),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: requestServiceController
                                        .listOfTimeSlot.length,
                                    itemBuilder: (context, index) {
                                      var rawData = requestServiceController
                                          .listOfTimeSlot[index]
                                          .toString();

                                      for (int i = 0;
                                          i <
                                              requestServiceController
                                                  .usedSlotList.length;
                                          i++) {
                                        if (requestServiceController
                                                .usedSlotList[i].time
                                                .toString() ==
                                            rawData.toString()) {
                                          requestServiceController
                                              .setColorChange(true);

                                          break;
                                        } else {
                                          requestServiceController
                                              .setColorChange(false);
                                        }
                                      }

                                      var item = rawData
                                          .toString()
                                          .padLeft(4, '0');
                                      return InkWell(
                                        onTap: requestServiceController
                                                .colorNeedToChange.value
                                            ? null
                                            : () {
                                                requestServiceController
                                                    .changeIndex(index);
                                                requestServiceController
                                                    .setLocalListToEmpty();
                                                requestServiceController
                                                    .selectSlots(item);
                                              },
                                        child: TimedisplayItemWidget(
                                          buttonColor:
                                              requestServiceController
                                                      .colorNeedToChange
                                                      .value
                                                  ? Colors.grey
                                                  : requestServiceController
                                                              .activeIndex
                                                              .value ==
                                                          index
                                                      ? Colors.blue
                                                      : Colors.white,
                                          textColor: requestServiceController
                                                  .colorNeedToChange.value
                                              ? Colors.white
                                              : requestServiceController
                                                          .activeIndex
                                                          .value ==
                                                      index
                                                  ? Colors.white
                                                  : AppColors
                                                      .floatingActionButtonColor,
                                          time:
                                              "${item.substring(0, 2)}:${item.toString().substring(2)}",
                                        ),
                                      );
                                    })
                                : const SizedBox())),
                        CustomTextFormField(
                            controller: commentController,
                            margin: EdgeInsets.only(
                                left: 12.h, top: 34.v, right: 12.h),
                            hintText: "Write your comments (optional)",
                            textInputAction: TextInputAction.done,
                            maxLines: 6,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 11.h, vertical: 17.v),
                            borderDecoration:
                                TextFormFieldStyleHelper.fillPrimary,
                            filled: true,
                            fillColor: theme.colorScheme.primary)
                      ]))))
        ]),
        bottomNavigationBar: CustomElevatedButton(
            onTap: () {
              log("Date as a strng ${requestServiceController.selectDateController.value.text}");
              log("Service need ${requestServiceController.serviceNeedId.value}");
              log("partner id ${requestServiceController.partnerId.value}");
              log("seleted slot ${requestServiceController.selectSlot.value}");
              log("Service type ${requestServiceController.selectedValue.value}");
            },
            text: "Save",
            margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 22.v),
            rightIcon: Container(
                margin: EdgeInsets.only(left: 16.h),
                child: CustomImageView(
                    svgPath: ImageConstant.imgArrowrightPrimary))));
  }
}
