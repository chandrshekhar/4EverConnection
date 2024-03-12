import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Partner/Widgets/data_table.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner-appbar.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_contact_widget.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_drawer.dart';
import 'package:forever_connection/core/constants/colors.dart';

class PartnerReceivableScreen extends StatelessWidget {
  PartnerReceivableScreen({super.key});
  List<Map<String, dynamic>> connectionTableTitle = [
    {'title': "blackfield", "width": "0"},
    {'title': "Action", "width": "120"},
    {'title': "Service #", "width": "120"},
    {'title': "User's Name", "width": "120"},
    {'title': "Service", "width": "120"},
    {'title': "Balance Due", "width": "150"},
    {'title': "Payment", "width": "150"},
    {'title': "Status", "width": "150"},
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
          title: "Partner Receivables",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 PartnerContactWidget(),
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
