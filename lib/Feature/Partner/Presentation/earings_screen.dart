import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Partner/Widgets/data_table.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner-appbar.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_contact_widget.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_drawer.dart';
import 'package:forever_connection/core/constants/colors.dart';

class PartnerEarningsScreen extends StatelessWidget {
  PartnerEarningsScreen({super.key});
  List<Map<String, dynamic>> connectionTableTitle = [
    {'title': "blackfield", "width": "0"},
    {'title': "Action", "width": "120"},
    {'title': "Service #", "width": "120"},
    {'title': "Name", "width": "120"},
    {'title': "Service", "width": "120"},
    {'title': "Partner Assigned", "width": "150"},
    {'title': "Contact Effort", "width": "150"},
    {'title': "Remaining Time", "width": "150"},
    {'title': "Source", "width": "120"},
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const PartnerDrawer(),
        appBar: PartnerAppBar(
          title: "Earnings",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PartnerContactWidget(),
                SizedBox(height: 10.h),
                Text(
                  "Partner Earnings information",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlue),
                ),
                SizedBox(height: 10.h),
                Row(children: [
                  contanerWithBorder(
                      title: "Partner", subtitle: "Allen chatterjee"),
                  SizedBox(width: 10.w),
                  contanerWithBorder(
                      width: 150,
                      title: "Hourly Rate",
                      subtitle: "No hourly rate")
                ]),
                contanerWithBorder(
                    title: "Earn Only From verified Payment", subtitle: "Yes"),
                SizedBox(height: 10.h),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: UserDataTable(titleList: connectionTableTitle),
                ),
                Container(
                  padding: EdgeInsets.all(10.sp),
                  color: AppColors.darkBlue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Service",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget contanerWithBorder(
      {required String title, required String subtitle, double? width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.darkBlue),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          width: width ?? 200.w,
          padding:
              EdgeInsets.only(left: 10.w, right: 30.w, top: 8.h, bottom: 8.h),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5.sp, color: AppColors.darkBlue)),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
