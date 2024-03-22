import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/My%20Service/Controller/user_service_controller.dart';
import 'package:forever_connection/Feature/Partner/Controller/partner_dashboard_controller.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner-appbar.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_contact_widget.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_drawer.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:get/get.dart';

import '../Widgets/data_table.dart';

class PartnerLobbyScreen extends StatefulWidget {
  PartnerLobbyScreen({super.key});

  @override
  State<PartnerLobbyScreen> createState() => _PartnerLobbyScreenState();
}

class _PartnerLobbyScreenState extends State<PartnerLobbyScreen> {
  final partnerDashboardController = Get.put(PartnerDashboardController());

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

  List<Map<String, dynamic>> serviceRequestTableTitle = [
    {'title': "blackfield", "width": "0"},
    {'title': "Action", "width": "120"},
    {'title': "Service #", "width": "120"},
    {'title': "Name", "width": "120"},
    {'title': "Service", "width": "120"},
    {'title': "Partner Assigned", "width": "150"},
    {'title': "Status", "width": "150"},
    {'title': "Date Time", "width": "150"},
    {'title': "Source", "width": "120"},
  ];

  List<Map<String, dynamic>> expiredTableTitle = [
    {'title': "blackfield", "width": "0"},
    {'title': "Action", "width": "120"},
    {'title': "Service #", "width": "120"},
    {'title': "Name", "width": "120"},
    {'title': "Service", "width": "120"},
    {'title': "Partner Assigned", "width": "150"},
    {'title': "Contact Effort", "width": "150"},
    {'title': "Date Time", "width": "150"},
    {'title': "Source", "width": "120"},
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    partnerDashboardController.partnerDashboardLobbyConnection();
    partnerDashboardController.getPartnerLobbyExpired();
    partnerDashboardController.partnerDashboardLobbyRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const PartnerDrawer(),
        appBar: PartnerAppBar(
          title: "Partner Lobby",
        ),
        body: Obx(()=> partnerDashboardController.isLobbyDataLoading.value?const Center(child: CircularProgressIndicator.adaptive(),)  :
          SingleChildScrollView(
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
                    child: UserDataTable(
                        titleList: connectionTableTitle,
                        data: partnerDashboardController
                            .partnerDashboardLobbyConnection.value.services),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius: BorderRadius.circular(1.r)),
                    child: Text(
                      "Services Request",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: UserDataTable(
                        titleList: serviceRequestTableTitle,
                        data: partnerDashboardController
                            .partnerDashboardLobbyConnection.value.services),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius: BorderRadius.circular(1.r)),
                    child: Text(
                      "Expired",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: UserDataTable(
                        titleList: expiredTableTitle,
                        data: partnerDashboardController
                            .partnerDashboardLobbyConnection.value.services),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
