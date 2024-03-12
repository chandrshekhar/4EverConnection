import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Partner/Presentation/earings_screen.dart';
import 'package:forever_connection/Feature/Partner/Presentation/partner_completed_services.dart';
import 'package:forever_connection/Feature/Partner/Presentation/partner_desk_screen.dart';
import 'package:forever_connection/Feature/Partner/Presentation/partner_lobby_screen.dart';
import 'package:forever_connection/Feature/Partner/Presentation/partner_receivables-screen.dart';
import 'package:forever_connection/Feature/Partner/Presentation/partner_register-screen.dart';
import 'package:forever_connection/Feature/Partner/Presentation/standby-screen.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner-appbar.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_contact_widget.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_dashboard_card_widget.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_drawer.dart';
import 'package:forever_connection/core/constants/image_constant.dart';

class PartnerDashboardScreen extends StatelessWidget {
  PartnerDashboardScreen({super.key});

  List<Map<String, dynamic>> partnerDashboard = [
    {
      "title": 'Partner Lobby',
      'navigaTo': PartnerLobbyScreen(),
      "icons": ImageConstant.newServiceIcon
    },
    {
      "title": "Partner Desk",
      'navigaTo': PartnerDeskScreen(),
      "icons": ImageConstant.partnerDesk
    },
    {
      "title": "Partner Registration",
      'navigaTo': partnerRegisterScreen(),
      "icons": ImageConstant.partnerRegister
    },
    {
      "title": "Partner Receivables",
      'navigaTo': PartnerReceivableScreen(),
      "icons": ImageConstant.partnerReceivable
    },
    {
      "title": "Earnings",
      'navigaTo': PartnerEarningsScreen(),
      "icons": ImageConstant.earnings
    },
    {
      "title": "Standby",
      'navigaTo': PartnerStandByScreen(),
      "icons": ImageConstant.handIcons
    },
    {
      "title": "Complete Service",
      'navigaTo': PartnerCompletedServiceScreen(),
      "icons": ImageConstant.completeSrv
    }
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const PartnerDrawer(),
      appBar: PartnerAppBar(
        title: "Partner Dashboard",
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          PartnerContactWidget(
              // onTap: () {
              //   debugPrint("calling scafold--> $scaffoldKey");
              //   scaffoldKey.currentState!.openEndDrawer();
              // },
              ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              itemCount: partnerDashboard.length,
              itemBuilder: (context, index) {
                return PartnerDashboardCard(
                    title: partnerDashboard[index]['title'],
                    onIconClick: () {},
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  partnerDashboard[index]['navigaTo']));
                    },
                    leftImagePath: partnerDashboard[index]['icons']);
              },
            ),
          )
        ],
      ),
    );
  }
}
