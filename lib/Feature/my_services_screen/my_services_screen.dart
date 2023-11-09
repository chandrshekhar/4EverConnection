import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Services/user_service_controller.dart';
import 'package:forever_connection/Feature/Connection/Controller/connection_controller.dart';
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
  final connectionController = Get.put(ConnectionController());

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
              child: Text(
                  tapIndex == 0 ? "In Progress Service" : "Completed Services",
                  style: theme.textTheme.titleLarge)),
          tapIndex == 0
              ? Obx(
                  () => userServiceController.isLoading == true
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.3),
                          child: const Center(
                              child: CircularProgressIndicator.adaptive()),
                        )
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
                                  return serviceCard(
                                    userServicesModel: userServiceController
                                        .userServicesList[index],
                                    onSeleted: (p0) async {
                                      switch (p0) {
                                        case "Email":
                                          await connectionController
                                              .launchEmail("");
                                          break;
                                        case "Resend":
                                          await connectionController
                                              .resedConnection(-1);
                                          break;
                                        case "Call":
                                          await connectionController
                                              .launchPhoneDialer("");
                                          break;
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                )
              : Container()
        ]));
  }

  Widget serviceCard(
      {required UserServicesModel userServicesModel,
      Function(String)? onSeleted}) {
    return Container(
      margin: EdgeInsets.only(left: 8.v, right: 8.v, bottom: 15.v),
      decoration: BoxDecoration(
          color: theme.cardColor, borderRadius: BorderRadius.circular(9.v)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 12.v),
            decoration: AppDecoration.fillLightBlue.copyWith(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9.h),
                topRight: Radius.circular(9.h),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Service #",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18.v),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Text(userServicesModel.identifier ?? "",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 15))),
                const Spacer(),
                PopupMenuButton<String>(
                    padding: EdgeInsets.zero,
                    position: PopupMenuPosition.under,
                    onSelected: onSeleted,
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ), // Icon for the button
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        // Define the menu items

                        const PopupMenuItem<String>(
                          value: 'Call',
                          child: Text('Call'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Email',
                          child: Text('Email'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Message',
                          child: Text('Message'),
                        ),
                      ];
                    }),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              12.v,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
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
                            convertAndFormatDate(
                                userServicesModel.dateCreated ?? ""),
                            style: const TextStyle(
                                color: Color(0xFF6B6B6B), fontSize: 15))),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
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
                        child: Text(userServicesModel.serviceName ?? "",
                            style: const TextStyle(
                                color: Color(0xFF6B6B6B), fontSize: 15))),
                    const Spacer()
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       flex: 2,
                //       child: Text(
                //         "Collaborate",
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontWeight: FontWeight.normal,
                //             fontSize: 18.v),
                //       ),
                //     ),
                //     const Expanded(
                //         flex: 2,
                //         child: Text('Collaboration Page',
                //             style: TextStyle(
                //                 color: Color(0xFF6B6B6B), fontSize: 15))),
                //     const Spacer(),
                //   ],
                // ),
                SizedBox(height: 6.v),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
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
                            padding: EdgeInsets.only(
                                left: 10.adaptSize,
                                top: 5.adaptSize,
                                bottom: 5.adaptSize,
                                right: 10.adaptSize),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.1),
                                borderRadius:
                                    BorderRadius.circular(5.adaptSize),
                                color: Colors.grey.shade100),
                            child: Row(
                              children: [
                                const Text(
                                  "\$",
                                  style: TextStyle(
                                      color: Color(0xFF6B6B6B), fontSize: 15),
                                ),
                                SizedBox(
                                  width: 10.adaptSize,
                                ),
                                Container(
                                  color: Colors.grey,
                                  height: 15,
                                  width: 1,
                                ),
                                SizedBox(
                                  width: 10.adaptSize,
                                ),
                                Text(
                                  userServicesModel.balance.toString(),
                                  style: const TextStyle(
                                      color: Color(0xFF6B6B6B), fontSize: 15),
                                )
                              ],
                            ))),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: 10.v,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
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
                            padding: EdgeInsets.only(
                                left: 10.adaptSize,
                                top: 5.adaptSize,
                                bottom: 5.adaptSize,
                                right: 10.adaptSize),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.1),
                                borderRadius:
                                    BorderRadiusDirectional.circular(5),
                                color: Colors.grey.shade100),
                            child: Row(
                              children: [
                                Text(userServicesModel.status.toString()),
                                const Spacer(),
                                const Icon(Icons.expand_more)
                              ],
                            ))),
                    const Spacer()
                  ],
                ),
              ],
            ),
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

  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
