import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';

class WithdrawalHistoryScreen extends StatelessWidget {
  const WithdrawalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          "Withdrawal History",
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
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 30.w),
        child: Column(
          children: [
            Container(
              color: AppColors.appBarTextColor,
              padding: EdgeInsets.only(
                  left: 17.w, right: 17.w, top: 24.h, bottom: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  richTextStyl(amount: "0", titile: "Total\nWithdraw"),
                  Container(
                    height: 93.h,
                    color: Colors.white,
                    width: 1,
                  ),
                  richTextStyl(amount: "0", titile: "YTD\nWithdraw"),
                ],
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 13.h),
                        padding: EdgeInsets.only(
                            left: 17.w, right: 17.w, top: 24.h, bottom: 24.h),
                        color: AppColors.cardColorBg,
                        child: Column(
                          children: [
                            titleTypeText(
                                leadingText: "Reference:", value: "ABCD"),
                            SizedBox(
                              height: 12.h,
                            ),
                            titleTypeText(
                                leadingText: "Date:", value: "12.10.2023"),
                            SizedBox(
                              height: 12.h,
                            ),
                            titleTypeText(
                                leadingText: "Amount:", value: "\$500"),
                            SizedBox(
                              height: 12.h,
                            ),
                            titleTypeText(
                                leadingText: "Method:", value: "ABCD"),
                          ],
                        ),
                      );
                    }))
          ],
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
