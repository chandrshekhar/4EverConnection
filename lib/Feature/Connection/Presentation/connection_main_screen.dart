import 'package:forever_connection/Controllers/Dashboard%20Controller/dhashboard_controller.dart';
import 'package:forever_connection/Controllers/User%20Profile%20Controller/user_profile_controller.dart';
import 'package:forever_connection/Feature/Connection/Controller/connection_controller.dart';
import 'package:forever_connection/Feature/Connection/Presentation/connection_list.dart';
import 'package:forever_connection/Feature/Connection/Presentation/create_connection.dart';
import 'package:forever_connection/Feature/Connection/Widget/card_widget.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Controller/reqiest_service_controller.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';

// ignore: must_be_immutable
class ConnectionMainScreen extends StatelessWidget {
  ConnectionMainScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final dashboardController = Get.put(DashboardController());
  final myProfileController = Get.put(UserProfileController());
  final serviceController = Get.put(RequestServiceController());
  final connectionCotroller = Get.put(ConnectionController());

  @override
  Widget build(BuildContext context) {
    connectionCotroller.getConnection();
    serviceController.getServiceProfssional();
    return Scaffold(
      appBar: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarImage(
              svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
              margin: EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
              onTap: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: "My Connection"),
          styleType: Style.bgShadow),
      key: _key,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEAF7FE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 23),
                child: Obx(
                  () => myProfileController.isLoadingProfileData == true
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 17.v),
                            Text(
                              "Welcome ${myProfileController.userProfileModel.value.personalData?.firstName ?? ""}!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.adaptSize,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10.adaptSize,
                                  right: 10.adaptSize,
                                  top: 10.adaptSize,
                                  bottom: 10.adaptSize),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(15.adaptSize)),
                              child: Column(
                                children: [
                                  // ConnectionCardWidget(
                                  //   onTap: () {},
                                  //   buttonName: "Check My wallet",
                                  //   title: "Wallet",
                                  //   available: "Available: \$0",
                                  //   des: "Withdraw Funds",
                                  // ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                  ConnectionCardWidget(
                                    onTap: () {
                                      Get.to(const CreateConnectionScreen());
                                    },
                                    buttonName: "Connect",
                                    title: "Connections",
                                    available: "accepted: 0",
                                    des: "Create Connections",
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                  Obx(() => ConnectionCardWidget(
                                        onTap: () {
                                          Get.to(ConnectionListScreen());
                                        },
                                        buttonName: "My Connections",
                                        title: "Manage",
                                        available:
                                            "Pending: ${connectionCotroller.connectionList.length}",
                                        des: "Manage Connections",
                                      )),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
          onTap: () {},
          text: "Access My Link",
          margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 22.v),
          rightIcon: Container(
              margin: EdgeInsets.only(left: 16.h),
              child: CustomImageView(
                  svgPath: ImageConstant.imgArrowrightPrimary))),
    );
  }
}
