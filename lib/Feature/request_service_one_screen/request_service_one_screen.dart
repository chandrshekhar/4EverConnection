import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Controller/reqiest_service_controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_drawar_widget.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_menu_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:forever_connection/widgets/search_drpdown.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../request_service_one_screen/widgets/timedisplay_item_widget.dart';

// ignore_for_file: must_be_immutable
class RequestServiceOneScreen extends StatefulWidget {
  const RequestServiceOneScreen({Key? key}) : super(key: key);

  @override
  State<RequestServiceOneScreen> createState() =>
      _RequestServiceOneScreenState();
}

class _RequestServiceOneScreenState extends State<RequestServiceOneScreen> {
  final requestServiceController = Get.put(RequestServiceController());
  @override
  void initState() {
    requestServiceController.partnerList.clear();
    requestServiceController.setLocalListToEmpty();
    requestServiceController.activeIndex.value = -1;
    requestServiceController.selectedDate.value = DateTime.now();
    requestServiceController.selectDateController.value.clear();
    requestServiceController.serviceSearchController.value.clear();
    requestServiceController.partnerSearchController.value.clear();
    super.initState();
    // Initialize the selected value
  }

  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: appTheme.lightBlue50,
      key: globalKey,
      endDrawer: CustomDrawerWidget(),
      appBar: CustomAppBar(
          leadingWidth: 44.h,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context)),
          centerTitle: true,
          title: AppbarTitle(text: "Request Service"),
          actions: [
            AppbarImage1(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.notificationsScreen);
              },
              svgPath: ImageConstant.imgCart,

              // margin: EdgeInsets.fromLTRB(10.h, 14.v, 15.h, 15.v)
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: CustomMenuButtonWidget(globalKey: globalKey),
            ),
          ],
          styleType: Style.bgShadow),
      body: Column(children: [
        SizedBox(height: 12.v),
        Expanded(
            child: SingleChildScrollView(
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.h, vertical: 10.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder16),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 4.v),
                                SizedBox(height: 29.v),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.myservice,
                                          height: 18.adaptSize,
                                          width: 18.adaptSize,
                                          margin: EdgeInsets.only(
                                              top: 25.v, right: 15)),
                                      Expanded(
                                        child: Obx(
                                          () => SearchDropDownWidget(
                                            onClearPressed: () {
                                              requestServiceController
                                                  .serviceSearchController.value
                                                  .clear();
                                              requestServiceController
                                                  .serviceNeedId.value = (-1);
                                            },
                                            fromWhere: "service",
                                            lableName: "Select Service Needed",
                                            list: requestServiceController
                                                .listOfServices,
                                            controller: requestServiceController
                                                .serviceSearchController.value,
                                            suggestionsCallback: (pattern) {
                                              return requestServiceController
                                                  .listOfServices
                                                  .where((item) => item.name!
                                                      .toLowerCase()
                                                      .contains(pattern
                                                          .toLowerCase()))
                                                  .toList();
                                            },
                                            onSuggestionSelected:
                                                (suggestion) async {
                                              requestServiceController
                                                      .serviceSearchController
                                                      .value
                                                      .text =
                                                  suggestion.name.toString();
                                              requestServiceController
                                                  .setServiceId(suggestion.id);
                                              await requestServiceController
                                                  .getPartnerByServiceId(
                                                      suggestion.id);
                                            },
                                          ),
                                        ),
                                      ),
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
                                                svgPath: ImageConstant.imgUser,
                                                height: 19.v,
                                                width: 17.h,
                                                margin: EdgeInsets.only(
                                                    top: 25.v, right: 15)),
                                            Expanded(
                                              child: Obx(
                                                () => SearchDropDownWidget(
                                                  onClearPressed: () {
                                                    requestServiceController
                                                        .partnerSearchController
                                                        .value
                                                        .clear();
                                                    requestServiceController
                                                        .partnerId.value = (-1);
                                                  },
                                                  fromWhere: "partner",
                                                  lableName:
                                                      "Select Professional (Optional)",
                                                  list: requestServiceController
                                                      .partnerList,
                                                  controller:
                                                      requestServiceController
                                                          .partnerSearchController
                                                          .value,
                                                  suggestionsCallback:
                                                      (pattern) {
                                                    return requestServiceController
                                                        .partnerList
                                                        .where((item) => item
                                                            .fullName!
                                                            .toLowerCase()
                                                            .contains(pattern
                                                                .toLowerCase()))
                                                        .toList();
                                                  },
                                                  onSuggestionSelected:
                                                      (suggestion) async {
                                                    requestServiceController
                                                            .partnerSearchController
                                                            .value
                                                            .text =
                                                        suggestion.fullName
                                                            .toString();
                                                    requestServiceController
                                                        .setPartnerId(
                                                            suggestion.id);
                                                  },
                                                ),
                                                // CustomDropDown(
                                                //   icon: Container(
                                                //     margin:
                                                //         EdgeInsets.fromLTRB(
                                                //             30.h,
                                                //             10.v,
                                                //             15.h,
                                                //             10.v),
                                                //     child: CustomImageView(
                                                //         svgPath: ImageConstant
                                                //             .imgVectorGray6004x7),
                                                //   ),
                                                //   margin: EdgeInsets.only(
                                                //       left: 22.h),
                                                //   hintText: "Select Partner",
                                                //   items:
                                                //       requestServiceController
                                                //           .partnerList.value,
                                                //   whereUse: "partner",
                                                //   borderDecoration:
                                                //       DropDownStyleHelper
                                                //           .underLineBlack,
                                                //   onChanged: (value) async {
                                                //     requestServiceController
                                                //         .setPartnerId(
                                                //             value.id);
                                                //     await requestServiceController
                                                //         .getUsedSlotList(
                                                //             value.id);
                                                //     requestServiceController
                                                //         .setLocalListToEmpty();
                                                //   },
                                                // ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                                SizedBox(
                                  height: 40.adaptSize,
                                ),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgCalendar,
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
                                        controller: requestServiceController
                                            .selectDateController.value,
                                        margin: EdgeInsets.only(left: 21.h),
                                        readOnly: true,
                                        labelText: "Select Date",
                                        contentPadding: EdgeInsets.zero,
                                        suffix: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgCalendarLightBlue90001,
                                            height: 15,
                                            width: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ))
                                    ]),
                                SizedBox(height: 29.v),
                                Text("Select Service Method",
                                    style: theme.textTheme.bodyLarge),
                                SizedBox(height: 8.v),
                                Obx(() => Row(
                                      children: <Widget>[
                                        Radio(
                                          fillColor: MaterialStateProperty.all(
                                              Colors.blue),
                                          value: 'In-Person',
                                          groupValue: requestServiceController
                                              .selectedValue.value,
                                          onChanged: (value) {
                                            requestServiceController
                                                .toggleBetweenRdioButton(value);
                                          },
                                        ),
                                        const Text('In person'),
                                        SizedBox(width: 20.v),
                                        Radio(
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue),
                                            value: 'Phone',
                                            groupValue: requestServiceController
                                                .selectedValue.value,
                                            onChanged: (value) {
                                              requestServiceController
                                                  .toggleBetweenRdioButton(
                                                      value);
                                            }),
                                        const Text('Phone'),
                                        SizedBox(width: 20.v),
                                        Radio(
                                          fillColor: MaterialStateProperty.all(
                                              Colors.blue),
                                          value: 'Video',
                                          groupValue: requestServiceController
                                              .selectedValue.value,
                                          onChanged: (value) {
                                            requestServiceController
                                                .toggleBetweenRdioButton(value);
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
                                  physics: const NeverScrollableScrollPhysics(),
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

                                    var item =
                                        rawData.toString().padLeft(4, '0');
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
                                      child: Obx(
                                        () => TimedisplayItemWidget(
                                          buttonColor: requestServiceController
                                                  .colorNeedToChange.value
                                              ? Colors.grey
                                              : requestServiceController
                                                          .activeIndex.value ==
                                                      index
                                                  ? Colors.blue
                                                  : Colors.white,
                                          textColor: requestServiceController
                                                  .colorNeedToChange.value
                                              ? Colors.white
                                              : requestServiceController
                                                          .activeIndex.value ==
                                                      index
                                                  ? Colors.white
                                                  : AppColors
                                                      .floatingActionButtonColor,
                                          time:
                                              "${item.substring(0, 2)}:${item.toString().substring(2)}",
                                        ),
                                      ),
                                    );
                                  })
                              : const SizedBox())),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 10.v),
                        decoration: AppDecoration.outlineBlack.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder16),
                        child: Obx(
                          () => CustomTextFormField(
                              controller: requestServiceController
                                  .commentController.value,
                              margin: EdgeInsets.only(
                                  left: 12.h, right: 12.h, bottom: 20),
                              labelText: "Write your comments (optional)",
                              textInputAction: TextInputAction.newline,
                              textInputType: TextInputType.multiline,
                              maxLines: 4,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 11.h,
                              ),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              fillColor: theme.colorScheme.primary),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Obx(
                        () => requestServiceController.isAddServiceLoading.value
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : CustomElevatedButton(
                                onTap: () {
                                  if (requestServiceController.serviceSearchController.value.text.isNotEmpty &&
                                      requestServiceController
                                          .partnerSearchController
                                          .value
                                          .text
                                          .isNotEmpty &&
                                      requestServiceController
                                          .selectSlot.value.isNotEmpty &&
                                      requestServiceController
                                          .selectedValue.value.isNotEmpty) {
                                    requestServiceController
                                        .addServiceRequest(context);
                                  } else {
                                    ToastWidget.errorToast(
                                        error: "please select required field!");
                                  }
                                },
                                text: "Save",
                                margin: EdgeInsets.only(
                                    left: 15.h, right: 15.h, bottom: 22.v),
                                rightIcon: Container(
                                    margin: EdgeInsets.only(left: 16.h),
                                    child: CustomImageView(
                                        svgPath: ImageConstant
                                            .imgArrowrightPrimary))),
                      )
                    ]))))
      ]),
    );
  }
}
