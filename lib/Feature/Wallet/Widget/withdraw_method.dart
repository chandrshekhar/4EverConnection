import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/custom_icon_button.dart';
import 'package:get/get.dart';

class WithdrawMethodScreen extends StatefulWidget {
  const WithdrawMethodScreen({super.key});

  @override
  State<WithdrawMethodScreen> createState() => _WithdrawMethodScreenState();
}

class _WithdrawMethodScreenState extends State<WithdrawMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Text(
          "Earning History",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 3,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                headerText(string: "Method\nName"),
                headerText(string: "Email/Phone Number"),
                headerText(string: "Default"),
                headerText(string: "Action"),
              ],
            ),
            Divider(
              thickness: 1.sp,
              color: Colors.black,
            ),
            Expanded(
              child: Column(
                children: [
                  methodCard(),
                  methodCard(),
                  methodCard(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  height: 45.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.zero, color: Colors.white),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                CustomIconButton(
                  height: 45.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.darkBlue),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget methodCard() {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            const Expanded(child: Text("PayPal")),
            const Expanded(child: Text("911246-4155")),
            Expanded(
                child: Transform.scale(
              scale: 1.0,
              child: Switch(
                value: true,
                onChanged: (bool value1) {},
              ),
            )),
            PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                // position: PopupMenuPosition.under,
                onSelected: null,
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ), // Icon for the button
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    // Define the menu items
                    PopupMenuItem<String>(
                      onTap: () async {},
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_document,
                            color: AppColors.lightBlue,
                            size: 15.sp,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Edit',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () async {},
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            size: 15.sp,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5.w),
                          const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ];
                }),
          ],
        ),
        Divider(
          thickness: 0.3.sp,
          color: Colors.black.withOpacity(0.4),
        )
      ],
    );
  }

  Widget headerText({required String string}) {
    return Text(
      string,
      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
    );
  }
}
