import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Services/user_service_controller.dart';
import 'package:forever_connection/Models/user_services_model.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_outlined_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore_for_file: must_be_immutable
class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({Key? key}) : super(key: key);

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  TextEditingController edittextController = TextEditingController();

  TextEditingController languageController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController edittextoneController = TextEditingController();

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  String selectedItem = 'Item One';

  TextEditingController edittexttwoController = TextEditingController();

  int tapIndex = 0;

  final userServiceController = Get.put(UserServicesController());

  @override
  Widget build(BuildContext context) {
    userServiceController.getUserServices();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFE4F5FF),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 13.v),
              decoration: AppDecoration.outlineBlack,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                CustomAppBar(
                    height: 31.v,
                    leadingWidth: 44.h,
                    leading: AppbarImage(
                        svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                        margin:
                            EdgeInsets.only(left: 24.h, top: 6.v, bottom: 12.v),
                        onTap: () {
                          onTapArrowleftone(context);
                        }),
                    centerTitle: true,
                    title: AppbarTitle(text: "My Services"),
                    actions: [
                      AppbarImage1(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.notificationsScreen);
                          },
                          svgPath: ImageConstant.imgCart,
                          margin: EdgeInsets.fromLTRB(24.h, 1.v, 24.h, 6.v))
                    ]),
                Padding(
                    padding: EdgeInsets.fromLTRB(24.h, 29.v, 24.h, 13.v),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomOutlinedButton(
                              buttonStyle: tapIndex == 0
                                  ? CustomButtonStyles.fillLightBlueTL20
                                  : null,
                              buttonTextStyle: tapIndex == 0
                                  ? const TextStyle(color: Colors.white)
                                  : const TextStyle(color: Colors.black),
                              onTap: () {
                                setState(() {
                                  tapIndex = 0;
                                });
                              },
                              width: 167.h,
                              text: "Services in Progress"),
                          SizedBox(width: 5.v),
                          CustomOutlinedButton(
                              buttonTextStyle: tapIndex == 1
                                  ? const TextStyle(color: Colors.white)
                                  : const TextStyle(color: Colors.black),
                              buttonStyle: tapIndex == 1
                                  ? CustomButtonStyles.fillLightBlueTL20
                                  : null,
                              onTap: () {
                                setState(() {
                                  tapIndex = 1;
                                });
                              },
                              width: 167.h,
                              text: "Completed Services"),
                        ]))
              ])),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 13.v, horizontal: 15.v),
              child: Text("Completed Services",
                  style: theme.textTheme.titleLarge)),
          tapIndex == 0
              ? Obx(
                  () => userServiceController.isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator.adaptive())
                      : userServiceController.userServicesList.isEmpty
                          ? const Center(
                              child: Text("No Service"),
                            )
                          : Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: userServiceController
                                    .userServicesList.length,
                                itemBuilder: (context, index) {
                                  return serviceCard(userServiceController
                                      .userServicesList[index]);
                                },
                              ),
                            ),
                )
              : Container()
        ]));
  }

  Widget serviceCard(UserServicesModel userServicesModel) {
    return Container(
      margin: EdgeInsets.only(left: 8.v, right: 8.v, bottom: 6.v),
      padding: EdgeInsets.all(12.v),
      decoration: BoxDecoration(
          color: theme.cardColor, borderRadius: BorderRadius.circular(5.v)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Service #",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.v),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Text(userServicesModel.identifier.toString(),
                      style:
                          TextStyle(color: Color(0xFF6B6B6B), fontSize: 15))),
              const Spacer(),
              Container(
                height: 15.v,
                width: 10.v,
                margin: EdgeInsets.only(right: 10.v),
                child: PopupMenuButton<String>(
                  splashRadius: null,
                  icon: const Icon(
                    Icons.more_vert,
                    size: 18,
                  ),
                  padding: EdgeInsets.zero,
                  onSelected: (value) {},
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Option 2',
                        child: Text('Option 2'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Option 3',
                        child: Text('Option 3'),
                      ),
                    ];
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Start Date",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.v),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                      convertAndFormatDate(userServicesModel.dateCreated!),
                      style: const TextStyle(
                          color: Color(0xFF6B6B6B), fontSize: 15))),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Service ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.v),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Text(userServicesModel.service.toString(),
                      style:
                          TextStyle(color: Color(0xFF6B6B6B), fontSize: 15))),
              const Spacer()
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Collaborate",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.v),
                ),
              ),
              const Expanded(
                  flex: 2,
                  child: Text('Collaboration Page',
                      style:
                          TextStyle(color: Color(0xFF6B6B6B), fontSize: 15))),
              const Spacer(),
            ],
          ),
          SizedBox(height: 5.v),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Fee",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.v),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(left: 2),
                    decoration: BoxDecoration(border: Border.all(width: 0.1)),
                    child: CustomTextFormField(
                      hintText: "\$ ${userServicesModel.balance}",
                    ),
                  )),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: 10.v,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Status",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.v),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(left: 2),
                    decoration: BoxDecoration(border: Border.all(width: 0.1)),
                    child: DropdownButton<String>(
                      value: selectedItem,
                      isDense: true,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedItem = newValue!;
                        });
                      },
                      items: dropdownItemList.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                  )),
              const Spacer()
            ],
          ),
        ],
      ),
    );
  }

  String convertAndFormatDate(String inputDate) {
    final originalFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS-HH:mm");
    final parsedDate = originalFormat.parse(inputDate);

    final outputFormat = DateFormat("dd/MM/yyyy");
    return outputFormat.format(parsedDate);
  }

  // Widget customWidget() {
  //   print(tapIndex);
  //   return Expanded(
  //       child: SingleChildScrollView(
  //           child: Container(
  //               margin: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
  //               decoration: AppDecoration.fillLightblue50,
  //               child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                         padding: EdgeInsets.only(left: 13.h),
  //                         child: Text("Completed Services",
  //                             style: theme.textTheme.titleLarge)),
  //                     SizedBox(height: 11.v),
  //                     Container(
  //                         padding: EdgeInsets.symmetric(
  //                             horizontal: 13.h, vertical: 9.v),
  //                         decoration: AppDecoration.outlineBlack,
  //                         child: Column(
  //                             mainAxisSize: MainAxisSize.min,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Padding(
  //                                   padding: EdgeInsets.only(right: 7.h),
  //                                   child: Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         Padding(
  //                                             padding:
  //                                                 EdgeInsets.only(bottom: 3.v),
  //                                             child: Column(
  //                                                 crossAxisAlignment:
  //                                                     CrossAxisAlignment.start,
  //                                                 children: [
  //                                                   Text("Service #",
  //                                                       style: CustomTextStyles
  //                                                           .bodyLargeBlack900),
  //                                                   SizedBox(height: 3.v),
  //                                                   Text("Start Date",
  //                                                       style: CustomTextStyles
  //                                                           .bodyLargeBlack900),
  //                                                   SizedBox(height: 2.v),
  //                                                   Text("Service",
  //                                                       style: CustomTextStyles
  //                                                           .bodyLargeBlack900),
  //                                                   SizedBox(height: 3.v),
  //                                                   Text("Collaborate",
  //                                                       style: CustomTextStyles
  //                                                           .bodyLargeBlack900),
  //                                                   SizedBox(height: 7.v),
  //                                                   Text("Fee",
  //                                                       style: CustomTextStyles
  //                                                           .bodyLargeBlack900)
  //                                                 ])),
  //                                         SizedBox(
  //                                             height: 155.v,
  //                                             width: 218.h,
  //                                             child: Stack(
  //                                                 alignment: Alignment.topLeft,
  //                                                 children: [
  //                                                   Align(
  //                                                       alignment:
  //                                                           Alignment.topLeft,
  //                                                       child: Text("S-6103",
  //                                                           style: theme
  //                                                               .textTheme
  //                                                               .bodyLarge)),
  //                                                   Align(
  //                                                       alignment:
  //                                                           Alignment.topLeft,
  //                                                       child: Padding(
  //                                                           padding:
  //                                                               EdgeInsets.only(
  //                                                                   top: 29.v),
  //                                                           child: Text(
  //                                                               "09/22/2023",
  //                                                               style: theme
  //                                                                   .textTheme
  //                                                                   .bodyLarge))),
  //                                                   Align(
  //                                                       alignment: Alignment
  //                                                           .centerLeft,
  //                                                       child: Text(
  //                                                           "Home Mortgage",
  //                                                           style: theme
  //                                                               .textTheme
  //                                                               .bodyLarge)),
  //                                                   Align(
  //                                                       alignment: Alignment
  //                                                           .bottomLeft,
  //                                                       child: Padding(
  //                                                           padding:
  //                                                               EdgeInsets.only(
  //                                                                   bottom:
  //                                                                       35.v),
  //                                                           child: Text(
  //                                                               "Collaboration Page",
  //                                                               style: theme
  //                                                                   .textTheme
  //                                                                   .bodyLarge))),
  //                                                 ]))
  //                                       ])),
  //                               Padding(
  //                                   padding: EdgeInsets.only(
  //                                       top: 7.v, right: 79.h, bottom: 2.v),
  //                                   child: Row(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         Padding(
  //                                             padding: EdgeInsets.only(
  //                                                 top: 2.v, bottom: 3.v),
  //                                             child: Text("Status",
  //                                                 style: CustomTextStyles
  //                                                     .bodyLargeBlack900)),
  //                                         Container(
  //                                             height: 33.v,
  //                                             width: 146.h,
  //                                             margin:
  //                                                 EdgeInsets.only(left: 58.h),
  //                                             child: Stack(
  //                                                 alignment: Alignment.center,
  //                                                 children: [
  //                                                   Align(
  //                                                       alignment: Alignment
  //                                                           .bottomLeft,
  //                                                       child: Padding(
  //                                                           padding:
  //                                                               EdgeInsets.only(
  //                                                                   left: 12.h,
  //                                                                   bottom:
  //                                                                       1.v),
  //                                                           child: Text(
  //                                                               "In progress",
  //                                                               style: theme
  //                                                                   .textTheme
  //                                                                   .bodyLarge))),
  //                                                   CustomImageView(
  //                                                       svgPath: ImageConstant
  //                                                           .imgVectorGray6004x7,
  //                                                       height: 4.v,
  //                                                       width: 7.h)
  //                                                 ]))
  //                                       ]))
  //                             ])),
  //                     SizedBox(height: 9.v),
  //                     Container(
  //                         padding: EdgeInsets.symmetric(
  //                             horizontal: 13.h, vertical: 9.v),
  //                         decoration: AppDecoration.outlineBlack,
  //                         child: Column(
  //                             mainAxisSize: MainAxisSize.min,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Padding(
  //                                   padding: EdgeInsets.only(right: 8.h),
  //                                   child: Row(children: [
  //                                     Text("Service #",
  //                                         style: CustomTextStyles
  //                                             .bodyLargeBlack900),
  //                                     Padding(
  //                                         padding: EdgeInsets.only(left: 30.h),
  //                                         child: Text("S-6103",
  //                                             style:
  //                                                 theme.textTheme.bodyLarge)),
  //                                     const Spacer(),
  //                                     CustomImageView(
  //                                         svgPath:
  //                                             ImageConstant.imgVectorstroke,
  //                                         height: 14.v,
  //                                         width: 3.h,
  //                                         margin: EdgeInsets.only(
  //                                             top: 5.v, bottom: 7.v))
  //                                   ])),
  //                               SizedBox(height: 2.v),
  //                               Row(children: [
  //                                 Text("Start Date",
  //                                     style:
  //                                         CustomTextStyles.bodyLargeBlack900),
  //                                 Padding(
  //                                     padding: EdgeInsets.only(left: 25.h),
  //                                     child: Text("09/22/2023",
  //                                         style: theme.textTheme.bodyLarge))
  //                               ]),
  //                               Padding(
  //                                   padding:
  //                                       EdgeInsets.only(top: 2.v, right: 78.h),
  //                                   child: Row(children: [
  //                                     Padding(
  //                                         padding: EdgeInsets.only(bottom: 2.v),
  //                                         child: Text("Service",
  //                                             style: CustomTextStyles
  //                                                 .bodyLargeBlack900)),
  //                                     Padding(
  //                                         padding: EdgeInsets.only(
  //                                             left: 49.h, top: 2.v),
  //                                         child: Text("Home Mortgage",
  //                                             style: theme.textTheme.bodyLarge))
  //                                   ])),
  //                               Padding(
  //                                   padding: EdgeInsets.only(right: 51.h),
  //                                   child: Row(children: [
  //                                     Padding(
  //                                         padding: EdgeInsets.only(bottom: 2.v),
  //                                         child: Text("Collaborate",
  //                                             style: CustomTextStyles
  //                                                 .bodyLargeBlack900)),
  //                                     Padding(
  //                                         padding: EdgeInsets.only(
  //                                             left: 8.h, top: 2.v),
  //                                         child: Text("Collaboration Page",
  //                                             style: theme.textTheme.bodyLarge))
  //                                   ])),
  //                               Padding(
  //                                   padding:
  //                                       EdgeInsets.only(top: 2.v, right: 79.h),
  //                                   child: Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         Padding(
  //                                             padding: EdgeInsets.only(
  //                                                 top: 2.v, bottom: 3.v),
  //                                             child: Text("Fee",
  //                                                 style: CustomTextStyles
  //                                                     .bodyLargeBlack900)),
  //                                         CustomTextFormField(
  //                                             width: 146.h,
  //                                             controller: languageController,
  //                                             hintText: "")
  //                                       ])),
  //                               Padding(
  //                                   padding: EdgeInsets.only(
  //                                       top: 7.v, right: 79.h, bottom: 2.v),
  //                                   child: Row(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         Padding(
  //                                             padding: EdgeInsets.only(
  //                                                 top: 2.v, bottom: 3.v),
  //                                             child: Text("Status",
  //                                                 style: CustomTextStyles
  //                                                     .bodyLargeBlack900)),
  //                                         CustomDropDown(
  //                                             width: 146.h,
  //                                             icon: Container(
  //                                                 padding: EdgeInsets.fromLTRB(
  //                                                     30.h, 14.v, 13.h, 15.v),
  //                                                 margin:
  //                                                     const EdgeInsets.only(),
  //                                                 decoration: BoxDecoration(
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             3.h),
  //                                                     border: Border.all(
  //                                                         color:
  //                                                             appTheme.black900,
  //                                                         width: 1.h)),
  //                                                 child: CustomImageView(
  //                                                     svgPath: ImageConstant
  //                                                         .imgVectorGray6004x7)),
  //                                             margin:
  //                                                 EdgeInsets.only(left: 58.h),
  //                                             hintText: "In progress",
  //                                             items: dropdownItemList,
  //                                             onChanged: (value) {})
  //                                       ]))
  //                             ])),
  //                     SizedBox(height: 9.v),
  //                     Container(
  //                         padding: EdgeInsets.symmetric(
  //                             horizontal: 13.h, vertical: 9.v),
  //                         decoration: AppDecoration.outlineBlack,
  //                         child: Column(
  //                             mainAxisSize: MainAxisSize.min,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Padding(
  //                                   padding: EdgeInsets.only(right: 8.h),
  //                                   child: Row(children: [
  //                                     Text("Service #",
  //                                         style: CustomTextStyles
  //                                             .bodyLargeBlack900),
  //                                     Padding(
  //                                         padding: EdgeInsets.only(left: 30.h),
  //                                         child: Text("S-6103",
  //                                             style:
  //                                                 theme.textTheme.bodyLarge)),
  //                                     const Spacer(),
  //                                     CustomImageView(
  //                                         svgPath:
  //                                             ImageConstant.imgVectorstroke,
  //                                         height: 14.v,
  //                                         width: 3.h,
  //                                         margin: EdgeInsets.only(
  //                                             top: 5.v, bottom: 7.v))
  //                                   ])),
  //                               SizedBox(height: 2.v),
  //                               Row(children: [
  //                                 Text("Start Date",
  //                                     style:
  //                                         CustomTextStyles.bodyLargeBlack900),
  //                                 Padding(
  //                                     padding: EdgeInsets.only(left: 25.h),
  //                                     child: Text("09/22/2023",
  //                                         style: theme.textTheme.bodyLarge))
  //                               ]),
  //                               Padding(
  //                                   padding:
  //                                       EdgeInsets.only(top: 2.v, right: 78.h),
  //                                   child: Row(children: [
  //                                     Padding(
  //                                         padding: EdgeInsets.only(bottom: 2.v),
  //                                         child: Text("Service",
  //                                             style: CustomTextStyles
  //                                                 .bodyLargeBlack900)),
  //                                     Padding(
  //                                         padding: EdgeInsets.only(
  //                                             left: 49.h, top: 2.v),
  //                                         child: Text("Home Mortgage",
  //                                             style: theme.textTheme.bodyLarge))
  //                                   ])),
  //                               Padding(
  //                                   padding: EdgeInsets.only(right: 51.h),
  //                                   child: Row(children: [
  //                                     Padding(
  //                                         padding: EdgeInsets.only(bottom: 2.v),
  //                                         child: Text("Collaborate",
  //                                             style: CustomTextStyles
  //                                                 .bodyLargeBlack900)),
  //                                     Padding(
  //                                         padding: EdgeInsets.only(
  //                                             left: 8.h, top: 2.v),
  //                                         child: Text("Collaboration Page",
  //                                             style: theme.textTheme.bodyLarge))
  //                                   ])),
  //                               Padding(
  //                                   padding:
  //                                       EdgeInsets.only(top: 2.v, right: 79.h),
  //                                   child: Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         Padding(
  //                                             padding: EdgeInsets.only(
  //                                                 top: 2.v, bottom: 3.v),
  //                                             child: Text("Fee",
  //                                                 style: CustomTextStyles
  //                                                     .bodyLargeBlack900)),
  //                                         SizedBox(
  //                                             height: 33.v,
  //                                             width: 146.h,
  //                                             child: Stack(
  //                                                 alignment: Alignment.center,
  //                                                 children: [
  //                                                   Align(
  //                                                       alignment:
  //                                                           Alignment.topLeft,
  //                                                       child: Padding(
  //                                                           padding:
  //                                                               EdgeInsets.only(
  //                                                                   left: 6.h,
  //                                                                   top: 2.v),
  //                                                           child: Text("",
  //                                                               style: theme
  //                                                                   .textTheme
  //                                                                   .bodyLarge))),
  //                                                   CustomTextFormField(
  //                                                       width: 146.h,
  //                                                       controller:
  //                                                           edittextoneController,
  //                                                       alignment:
  //                                                           Alignment.center)
  //                                                 ]))
  //                                       ])),
  //                               Padding(
  //                                   padding: EdgeInsets.only(
  //                                       top: 7.v, right: 79.h, bottom: 2.v),
  //                                   child: Row(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         Padding(
  //                                             padding: EdgeInsets.only(
  //                                                 top: 2.v, bottom: 3.v),
  //                                             child: Text("Status",
  //                                                 style: CustomTextStyles
  //                                                     .bodyLargeBlack900)),
  //                                         CustomDropDown(
  //                                             width: 146.h,
  //                                             icon: Container(
  //                                                 padding: EdgeInsets.fromLTRB(
  //                                                     30.h, 14.v, 13.h, 15.v),
  //                                                 margin:
  //                                                     const EdgeInsets.only(),
  //                                                 decoration: BoxDecoration(
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             3.h),
  //                                                     border: Border.all(
  //                                                         color:
  //                                                             appTheme.black900,
  //                                                         width: 1.h)),
  //                                                 child: CustomImageView(
  //                                                     svgPath: ImageConstant
  //                                                         .imgVectorGray6004x7)),
  //                                             margin:
  //                                                 EdgeInsets.only(left: 58.h),
  //                                             hintText: "In progress",
  //                                             items: dropdownItemList1,
  //                                             onChanged: (value) {})
  //                                       ]))
  //                             ])),
  //                     SizedBox(height: 9.v),
  //                     Container(
  //                         padding: EdgeInsets.symmetric(
  //                             horizontal: 13.h, vertical: 9.v),
  //                         decoration: AppDecoration.outlineBlack,
  //                         child: Column(
  //                             mainAxisSize: MainAxisSize.min,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Padding(
  //                                   padding: EdgeInsets.only(right: 8.h),
  //                                   child: Row(children: [
  //                                     Text("Service #",
  //                                         style: CustomTextStyles
  //                                             .bodyLargeBlack900),
  //                                     Padding(
  //                                         padding: EdgeInsets.only(left: 30.h),
  //                                         child: Text("S-6103",
  //                                             style:
  //                                                 theme.textTheme.bodyLarge)),
  //                                     const Spacer(),
  //                                     CustomImageView(
  //                                         svgPath:
  //                                             ImageConstant.imgVectorstroke,
  //                                         height: 14.v,
  //                                         width: 3.h,
  //                                         margin: EdgeInsets.only(
  //                                             top: 5.v, bottom: 7.v))
  //                                   ])),
  //                               SizedBox(height: 2.v),
  //                               Row(children: [
  //                                 Text("Start Date",
  //                                     style:
  //                                         CustomTextStyles.bodyLargeBlack900),
  //                                 Padding(
  //                                     padding: EdgeInsets.only(left: 25.h),
  //                                     child: Text("09/22/2023",
  //                                         style: theme.textTheme.bodyLarge))
  //                               ]),
  //                               Padding(
  //                                   padding:
  //                                       EdgeInsets.only(top: 2.v, right: 78.h),
  //                                   child: Row(children: [
  //                                     Padding(
  //                                         padding: EdgeInsets.only(bottom: 2.v),
  //                                         child: Text("Service",
  //                                             style: CustomTextStyles
  //                                                 .bodyLargeBlack900)),
  //                                     Padding(
  //                                         padding: EdgeInsets.only(
  //                                             left: 49.h, top: 2.v),
  //                                         child: Text("Home Mortgage",
  //                                             style: theme.textTheme.bodyLarge))
  //                                   ])),
  //                               Padding(
  //                                   padding: EdgeInsets.only(right: 51.h),
  //                                   child: Row(children: [
  //                                     Padding(
  //                                         padding: EdgeInsets.only(bottom: 2.v),
  //                                         child: Text("Collaborate",
  //                                             style: CustomTextStyles
  //                                                 .bodyLargeBlack900)),
  //                                     Padding(
  //                                         padding: EdgeInsets.only(
  //                                             left: 8.h, top: 2.v),
  //                                         child: Text("Collaboration Page",
  //                                             style: theme.textTheme.bodyLarge))
  //                                   ])),
  //                               Padding(
  //                                   padding:
  //                                       EdgeInsets.only(top: 2.v, right: 79.h),
  //                                   child: Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         Padding(
  //                                             padding: EdgeInsets.only(
  //                                                 top: 2.v, bottom: 3.v),
  //                                             child: Text("Fee",
  //                                                 style: CustomTextStyles
  //                                                     .bodyLargeBlack900)),
  //                                         SizedBox(
  //                                             height: 33.v,
  //                                             width: 146.h,
  //                                             child: Stack(
  //                                                 alignment: Alignment.center,
  //                                                 children: [
  //                                                   Align(
  //                                                       alignment:
  //                                                           Alignment.topLeft,
  //                                                       child: Padding(
  //                                                           padding:
  //                                                               EdgeInsets.only(
  //                                                                   left: 6.h,
  //                                                                   top: 2.v),
  //                                                           child: Text("",
  //                                                               style: theme
  //                                                                   .textTheme
  //                                                                   .bodyLarge))),
  //                                                   CustomTextFormField(
  //                                                       width: 146.h,
  //                                                       controller:
  //                                                           edittexttwoController,
  //                                                       textInputAction:
  //                                                           TextInputAction
  //                                                               .done,
  //                                                       alignment:
  //                                                           Alignment.center)
  //                                                 ]))
  //                                       ])),
  //                               Padding(
  //                                   padding: EdgeInsets.only(
  //                                       top: 7.v, right: 79.h, bottom: 2.v),
  //                                   child: Row(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         Padding(
  //                                             padding: EdgeInsets.only(
  //                                                 top: 2.v, bottom: 3.v),
  //                                             child: Text("Status",
  //                                                 style: CustomTextStyles
  //                                                     .bodyLargeBlack900)),
  //                                         Container(
  //                                             height: 33.v,
  //                                             width: 146.h,
  //                                             margin:
  //                                                 EdgeInsets.only(left: 58.h),
  //                                             child: Stack(
  //                                                 alignment: Alignment.center,
  //                                                 children: [
  //                                                   Align(
  //                                                       alignment: Alignment
  //                                                           .bottomLeft,
  //                                                       child: Padding(
  //                                                           padding:
  //                                                               EdgeInsets.only(
  //                                                                   left: 12.h,
  //                                                                   bottom:
  //                                                                       1.v),
  //                                                           child: Text(
  //                                                               "In progress",
  //                                                               style: theme
  //                                                                   .textTheme
  //                                                                   .bodyLarge))),
  //                                                   CustomImageView(
  //                                                       svgPath: ImageConstant
  //                                                           .imgVectorGray6004x7,
  //                                                       height: 4.v,
  //                                                       width: 7.h)
  //                                                 ]))
  //                                       ]))
  //                             ]))
  //                   ]))));
  // }

  // /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
