import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Partner/Widgets/data_table.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner-appbar.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_contact_widget.dart';
import 'package:forever_connection/core/constants/colors.dart';

class partnerRegisterScreen extends StatelessWidget {
  partnerRegisterScreen({super.key});

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: PartnerAppBar(
          title: "Partner Register",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PartnerContactWidget(),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(1.r)),
                  child: Text(
                    "Connection",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: UserDataTable(titleList: connectionTableTitle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
