import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/My%20Service/Controller/user_service_controller.dart';
import 'package:forever_connection/Feature/Connection/Controller/connection_controller.dart';
import 'package:forever_connection/Feature/My%20Service/Model/user_services_model.dart';
import 'package:forever_connection/Feature/My%20Service/Widgets/service_table_widget.dart';
import 'package:forever_connection/Feature/My%20Service/Widgets/user_service_inprogress_table.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:forever_connection/theme/theme_helper.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_drawar_widget.dart';
import 'package:forever_connection/widgets/custom_menu_button.dart';
import 'package:get/get.dart';

// ignore_for_file: must_be_immutable
class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({Key? key}) : super(key: key);

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  TextEditingController edittextController = TextEditingController();

  TextEditingController languageController = TextEditingController();

  TextEditingController edittextoneController = TextEditingController();

  TextEditingController edittexttwoController = TextEditingController();

  int tapIndex = 0;

  final userServiceController = Get.put(UserServicesController());
  final connectionController = Get.put(ConnectionController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    userServiceController.getUserServices();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: const Color(0xFFE4F5FF),
        key: _key,
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            leadingWidth: 44.h,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            title: AppbarTitle(text: "My Services"),
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
                child: CustomMenuButtonWidget(globalKey: _key),
              ),
            ]),
        endDrawer: const CustomDrawerWidget(),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(5.r)),
                child: const Text(
                  "Services in Progress",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // CustomOutlinedButton(
              //     buttonStyle: CustomButtonStyles.fillLightBlueTL20,
              //     buttonTextStyle: const TextStyle(color: Colors.white),
              //     width: 180.h,
              //     text: "Services in Progress"),
              Container(
                margin: EdgeInsets.only(top: 1.h, bottom: 20.h),
                height: MediaQuery.of(context).size.height * 0.3,
                child: Obx(
                  () => userServiceController.isServiceLoading == true
                      ? const Center(
                          child: CircularProgressIndicator.adaptive())
                      : userServiceController.userServicesPendingList.isEmpty
                          ? const Center(
                              child: Text("No data"),
                            )
                          : UserServiceInProgressDataTable(
                              userServiceModel:
                                  userServiceController.userServicesPendingList,
                            ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(5.r)),
                child: const Text(
                  "Completed Services",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 1.h),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                margin: EdgeInsets.only(top: 1.h, bottom: 20.h),
                child: Obx(
                  () => userServiceController.isServiceLoading == true
                      ? const Center(
                          child: CircularProgressIndicator.adaptive())
                      : userServiceController.userServicesCompletedList.isEmpty
                          ? const Center(
                              child: Text("No Data"),
                            )
                          : UserServiceDataTable(
                              userServiceModel: userServiceController
                                  .userServicesCompletedList),
                ),
              )
            ]));
  }

  Widget serviceCard(
      {required UserServicesModel userServicesModel,
      Function(String)? onSeleted}) {
    return Container(
      margin: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 15.h),
      decoration: BoxDecoration(
          color: theme.cardColor, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 12.w),
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
                        fontSize: 18.sp),
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
              12.sp,
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
                            fontSize: 18.sp),
                      ),
                    ),
                    // Expanded(
                    //     flex: 3,
                    //     child: Text(
                    //         convertAndFormatDate(
                    //             userServicesModel.dateCreated ?? ""),
                    //         style: const TextStyle(
                    //             color: Color(0xFF6B6B6B), fontSize: 15))),
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
                            fontSize: 18.sp),
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
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Fee",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18.sp),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 10.w, top: 5.h, bottom: 5.h, right: 10.w),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.1),
                                borderRadius: BorderRadius.circular(5.r),
                                color: Colors.grey.shade100),
                            child: Row(
                              children: [
                                const Text(
                                  "\$",
                                  style: TextStyle(
                                      color: Color(0xFF6B6B6B), fontSize: 15),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  color: Colors.grey,
                                  height: 15,
                                  width: 1,
                                ),
                                SizedBox(
                                  width: 10.w,
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
                  height: 10.h,
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
                            fontSize: 18.sp),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 10.w, top: 5.h, bottom: 5.h, right: 10.r),
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

  // String convertAndFormatDate(String inputDate) {
  //   final originalFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS-HH:mm");
  //   final parsedDate = originalFormat.parse(inputDate);

  //   final outputFormat = DateFormat("dd/MM/yyyy");
  //   return outputFormat.format(parsedDate);
  // }

  // onTapArrowleftone(BuildContext context) {
  //   Navigator.pop(context);
  // }
}
