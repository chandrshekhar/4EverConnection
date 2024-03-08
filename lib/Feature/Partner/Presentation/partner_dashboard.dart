import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Partner/Presentation/partner_completed_services.dart';
import 'package:forever_connection/Feature/Partner/Presentation/partner_desk_screen.dart';
import 'package:forever_connection/Feature/Partner/Presentation/partner_lobby_screen.dart';
import 'package:forever_connection/Feature/Partner/Presentation/partner_receivables-screen.dart';
import 'package:forever_connection/Feature/Partner/Presentation/partner_register-screen.dart';
import 'package:forever_connection/Feature/Partner/Presentation/standby-screen.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner-appbar.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_contact_widget.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_dashboard_card_widget.dart';
import 'package:forever_connection/core/constants/image_constant.dart';

class PartnerDashboardScreen extends StatelessWidget {
  PartnerDashboardScreen({super.key});

  List<Map<String, dynamic>> partnerDashboard = [
    {"title": 'Partner Lobby', 'navigaTo': PartnerLobbyScreen()},
    {"title": "Partner Desk", 'navigaTo': PartnerDeskScreen()},
    {"title": "Partner Registration", 'navigaTo': partnerRegisterScreen()},
    {"title": "Partner Receivables", 'navigaTo': PartnerReceivableScreen()},
    {"title": "Earnings", 'navigaTo': PartnerReceivableScreen()},
    {"title": "Standby", 'navigaTo': PartnerStandByScreen()},
    {"title": "Complete Service", 'navigaTo': PartnerCompletedServiceScreen()}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PartnerAppBar(
        title: "Partner Dashboard",
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          const PartnerContactWidget(),
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
                    leftImagePath: ImageConstant.newServiceIcon);
              },
            ),
          )
        ],
      ),
    );
  }
}
