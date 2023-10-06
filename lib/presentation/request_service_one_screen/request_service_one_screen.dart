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
  TextEditingController vectorController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  String servicetype = "";

  List<String> radioList = ["lbl_in_person", "lbl_phone", "lbl_video"];

  TextEditingController commentController = TextEditingController();

  String? selectedValue;

  @override
  void initState() {
    super.initState();
    // Initialize the selected value
    selectedValue = 'In person';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                                                    controller:
                                                        vectorController,
                                                    margin: EdgeInsets.only(
                                                        left: 21.h),
                                                    hintText: "Select Date",
                                                    suffix: Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                30.h,
                                                                10.v,
                                                                15.h,
                                                                10.v),
                                                        child: CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgCalendar)),
                                                    suffixConstraints:
                                                        BoxConstraints(
                                                            maxHeight: 36.v)))
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
                                                    hintText:
                                                        "Select professional",
                                                    items: dropdownItemList,
                                                    borderDecoration:
                                                        DropDownStyleHelper
                                                            .underLineBlack,
                                                    onChanged: (value) {}))
                                          ]),
                                      SizedBox(height: 29.v),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                svgPath: ImageConstant.imgUser,
                                                height: 19.v,
                                                width: 17.h,
                                                margin: EdgeInsets.only(
                                                    top: 2.v, bottom: 13.v)),
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
                                                    hintText:
                                                        "Select professional",
                                                    items: dropdownItemList,
                                                    borderDecoration:
                                                        DropDownStyleHelper
                                                            .underLineBlack,
                                                    onChanged: (value) {}))
                                          ]),
                                      SizedBox(height: 29.v),
                                      Text("Service type",
                                          style: theme.textTheme.bodyLarge),
                                      SizedBox(height: 8.v),
                                      Row(
                                        children: <Widget>[
                                          Radio(
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue),
                                            value: 'In person',
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue = value;
                                              });
                                            },
                                          ),
                                          const Text('In person'),
                                          SizedBox(width: 20.v),
                                          Radio(
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue),
                                            value: 'Phone',
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue = value;
                                              });
                                            },
                                          ),
                                          const Text('Phone'),
                                          SizedBox(width: 20.v),
                                          Radio(
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue),
                                            value: 'Video',
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue = value;
                                              });
                                            },
                                          ),
                                          const Text('Video'),
                                        ],
                                      ),
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 12.h, top: 23.v, right: 12.h),
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisExtent: 52.v,
                                            crossAxisCount: 4,
                                            mainAxisSpacing: 5.h,
                                            crossAxisSpacing: 5.h),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 28,
                                    itemBuilder: (context, index) {
                                      return const TimedisplayItemWidget();
                                    })),
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
                text: "Save",
                margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 22.v),
                rightIcon: Container(
                    margin: EdgeInsets.only(left: 16.h),
                    child: CustomImageView(
                        svgPath: ImageConstant.imgArrowrightPrimary)))));
  }
}
