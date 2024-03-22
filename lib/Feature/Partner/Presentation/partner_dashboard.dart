import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Partner/Controller/partner_dashboard_controller.dart';
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
import 'package:get/get.dart';

class PartnerDashboardScreen extends StatefulWidget {
  const PartnerDashboardScreen({super.key});

  @override
  State<PartnerDashboardScreen> createState() => _PartnerDashboardScreenState();
}

class _PartnerDashboardScreenState extends State<PartnerDashboardScreen> {
  final partnerDashboardController = Get.put(PartnerDashboardController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    partnerDashboardController.getPartnerDashboard();
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const PartnerDrawer(),
      appBar: PartnerAppBar(
        title: "Partner Dashboard",
      ),
      body: Obx(
        () => partnerDashboardController.isPartnerLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    PartnerContactWidget(
                        // onTap: () {
                        //   debugPrint("calling scafold--> $scaffoldKey");
                        //   scaffoldKey.currentState!.openEndDrawer();
                        // },
                        ),
                    SizedBox(height: 20.h),
                    PartnerDashboardCard(
                        title: "Partner Lobby",
                        onIconClick: () {},
                        subTitle1: "Active",
                        subTitle12: "Expired",
                        value1: partnerDashboardController
                                .partnerDashboarModel.value.totalLobby ??
                            0,
                        value2: partnerDashboardController
                            .partnerDashboarModel.value.totalExpired,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PartnerLobbyScreen()));
                        },
                        leftImagePath: ImageConstant.newServiceIcon),
                    PartnerDashboardCard(
                        title: "Partner Desk",
                        onIconClick: () {},
                        subTitle1: "Services in Progress",
                        subTitle12: "",
                        value1: partnerDashboardController
                            .partnerDashboarModel.value.totalDesk,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PartnerDeskScreen()));
                        },
                        leftImagePath: ImageConstant.partnerDesk),
                    PartnerDashboardCard(
                        title: "Partner Registration",
                        onIconClick: () {},
                        subTitle1: "0 Payment (0 verified)",
                        subTitle12: "",
                        value1: partnerDashboardController
                            .partnerDashboarModel.value.totalRegister,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      partnerRegisterScreen()));
                        },
                        leftImagePath: ImageConstant.partnerRegister),
                    PartnerDashboardCard(
                        title: "Partner Receivables",
                        onIconClick: () {},
                        subTitle1: "0 Pendding to Collect",
                        subTitle12: "",
                        value1: partnerDashboardController
                            .partnerDashboarModel.value.totalReceivable,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PartnerReceivableScreen()));
                        },
                        leftImagePath: ImageConstant.partnerReceivable),
                    PartnerDashboardCard(
                        title: "Earnings",
                        onIconClick: () {},
                        subTitle1: "All Time (0 service,0 Payments)",
                        subTitle12: "",
                        value1: 0,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PartnerEarningsScreen()));
                        },
                        leftImagePath: ImageConstant.earnings),
                    PartnerDashboardCard(
                        title: "Standby",
                        onIconClick: () {},
                        subTitle1: "Services on Hold",
                        subTitle12: "",
                        value1: partnerDashboardController
                            .partnerDashboarModel.value.totalStandBy,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PartnerStandByScreen()));
                        },
                        leftImagePath: ImageConstant.handIcons),
                    PartnerDashboardCard(
                        title: "Complete Service",
                        onIconClick: () {},
                        subTitle1: "Services",
                        subTitle12: "",
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PartnerCompletedServiceScreen()));
                        },
                        leftImagePath: ImageConstant.completeSrv)
                  ],
                ),
              ),
      ),
    );
  }
}
