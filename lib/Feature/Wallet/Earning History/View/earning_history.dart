import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/widgets/custom_icon_button.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../Widget/got_it_widget.dart';

class EarningHistoryScreen extends StatelessWidget {
  const EarningHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          "Earning History",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: AppColors.appBarTextColor),
        ),
        centerTitle: true,
        elevation: 3,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.appBarTextColor,
            size: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h, bottom: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WithdraFundsCardWidget(
                onPress: () {},
              ),
              Container(
                color: AppColors.appBarTextColor,
                margin: EdgeInsets.only(bottom: 20.h),
                padding: EdgeInsets.only(
                    left: 17.w, right: 17.w, top: 24.h, bottom: 24.h),
                child: Column(
                  children: [
                    CustomIconButton(
                      height: 54.h,
                      width: 200.w,
                      onTap: () {},
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.zero,
                          color: AppColors.buttonColor),
                      child: Center(
                          child: Text(
                        "Upload From W-9",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    CustomIconButton(
                      height: 54.h,
                      width: 200.w,
                      onTap: () {},
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.zero,
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white)),
                      child: Center(
                          child: Text(
                        "Download From 1099",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        richTextStyl(amount: "0", titile: "Total\nM\$ Earned"),
                        Container(
                          height: 93.h,
                          color: Colors.white,
                          width: 1,
                        ),
                        richTextStyl(amount: "0", titile: "YTD\nM\$ Earned"),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(
                    10,
                    (index) => Container(
                          margin: EdgeInsets.only(bottom: 13.h),
                          padding: EdgeInsets.only(
                              left: 17.w, right: 17.w, top: 24.h, bottom: 24.h),
                          color: AppColors.cardColorBg,
                          child: Column(
                            children: [
                              titleTypeText(
                                  leadingText: "Date:", value: "12.10.2023"),
                              SizedBox(
                                height: 12.h,
                              ),
                              titleTypeText(
                                  leadingText: "M\$ Earned:", value: "\$500"),
                              SizedBox(
                                height: 12.h,
                              ),
                              titleTypeText(
                                  leadingText: "Client Name:",
                                  value: "Adam Smit"),
                              SizedBox(
                                height: 12.h,
                              ),
                              titleTypeText(
                                  leadingText: "Related Service:",
                                  value: "Lorem Ipsum Service"),
                            ],
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget richTextStyl({required String amount, required String titile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          titile,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
        Text(
          "\$$amount",
          style: TextStyle(
              color: AppColors.buttonColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
      ],
    );
  }

  Widget titleTypeText({required String leadingText, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingText,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
