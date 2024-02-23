import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/My%20Profile/Controller/user_profile_controller.dart';
import 'package:forever_connection/Feature/Dashboard/Presentation/dashboard_screen.dart';
import 'package:forever_connection/Feature/Request%20Service/Controller/reqiest_service_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingServiceSuccessFullyScreen extends StatelessWidget {
  BookingServiceSuccessFullyScreen({super.key, required this.successRes});

  Map<dynamic, dynamic> successRes;

  final profileController = Get.put(UserProfileController());
  final serviceController = Get.put(RequestServiceController());

  @override
  Widget build(BuildContext context) {
    log("response is $successRes");
    return Scaffold(
      backgroundColor: AppColors.floatingActionButtonColor,
      appBar: AppBar(
        backgroundColor: AppColors.floatingActionButtonColor,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back_ios,
        //     ),
        //     onPressed: () {
        //       serviceController.forceIsDuplicatedMethod(false);
        //       serviceController.requiestServiceClearData();
        //       Get.delete<RequestServiceController>();
        //       Navigator.pop(context);
        //     }),
        elevation: 0,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstant.appLogo,
            height: 170.h,
            width: 170.w,
          ),
          SizedBox(height: 18.h),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 35.w),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Your appointment with ',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.floatingActionButtonColor),
                    children: <TextSpan>[
                      const TextSpan(
                          text: '4ever Corporation ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'has been confirmed!',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.floatingActionButtonColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                CustomImageView(
                  svgPath: "assets/images/success.svg",
                  height: 50.h,
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                  margin: EdgeInsets.only(top: 23.h, bottom: 14),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Appointment details:",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 9.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      "${profileController.userProfileModel.value.personalData!.firstName ?? ""} ${profileController.userProfileModel.value.personalData!.lastName ?? ""}",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.floatingActionButtonColor)),
                ),
                SizedBox(height: 22.h),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 15.sp,
                              color: const Color(0xFF1E1E1E),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              DateFormat('EEEE, MM/dd/yyyy - HH:mm').format(
                                  DateTime.parse(
                                      successRes["action_scheduled_on"])),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF1E1E1E)),
                            )
                          ]),
                      Container(
                          height: 0.5.h,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(vertical: 12.h)),
                      SizedBox(height: 5.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.account_balance,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${serviceController.findServiceById(successRes["service"].toString())}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ]),
                      Container(
                          height: 0.3.h,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(vertical: 12.h)),
                      Row(children: [
                        const Icon(
                          Icons.person_2_rounded,
                          size: 14,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          successRes["contact_type"],
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 50.w),
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(2)),
                            child: const Text("Get Direction"))
                      ]),
                      Container(
                          height: 0.3.h,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(vertical: 12.h)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(6)),
                      child: const Icon(Icons.edit)),
                ),
              ],
            ),
          ),
          Text("Do you want to be proactive?",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                height: 2,
                fontWeight: FontWeight.w400,
              )),
          Text("You can upload documents here",
              style: TextStyle(
                height: 1.3.h,
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              )),
          Row(
            children: [
              InkWell(
                onTap: () {
                  profileController.getMagicLinkToUploadNow(
                      context, successRes["id"].toString());
                },
                child: Container(
                    margin: EdgeInsets.only(left: 57.w, top: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 42.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      "Upload Now",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen()),
                      (route) => false);
                },
                child: Container(
                    margin: EdgeInsets.only(left: 6.w, top: 14.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 42.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
