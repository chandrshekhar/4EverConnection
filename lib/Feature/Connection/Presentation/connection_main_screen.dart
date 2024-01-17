import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Controllers/Dashboard%20Controller/dhashboard_controller.dart';
import 'package:forever_connection/Feature/My%20Profile/Controller/user_profile_controller.dart';
import 'package:forever_connection/Feature/Connection/Controller/connection_controller.dart';
import 'package:forever_connection/Feature/Connection/Presentation/connection_list.dart';
import 'package:forever_connection/Feature/Connection/Presentation/create_connection.dart';
import 'package:forever_connection/Feature/Connection/Widget/card_widget.dart';
import 'package:forever_connection/Feature/Request%20Service/Controller/reqiest_service_controller.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_drawar_widget.dart';
import 'package:forever_connection/widgets/custom_menu_button.dart';
import 'package:get/get.dart';

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
      endDrawer: CustomDrawerWidget(),
      appBar: CustomAppBar(
        leadingWidth: 44.h,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        centerTitle: true,
        title: AppbarTitle(text: "My Connection"),
        styleType: Style.bgShadow,
        actions: [
          AppbarImage1(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.notificationsScreen);
            },
            svgPath: ImageConstant.imgCart,

            // margin: EdgeInsets.fromLTRB(10.h, 14.v, 15.h, 15.v)
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: CustomMenuButtonWidget(globalKey: _key),
          ),
        ],
      ),
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
                            SizedBox(height: 17.h),
                            Text(
                              "Welcome ${myProfileController.userProfileModel.value.personalData?.firstName ?? ""}!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  top: 10.h,
                                  bottom: 10.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.r)),
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
                                    des: "Create Connections",
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                  Obx(() => ConnectionCardWidget(
                                        onTap: () {
                                          Get.to(const ConnectionListScreen());
                                        },
                                        buttonName: "My Connections",
                                        title: "Manage",
                                        available:
                                            "Pending: ${connectionCotroller.pendingConnectionList.length} \nAccepted: ${connectionCotroller.acceptedConnectionList.length} ",
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
      // bottomNavigationBar: CustomElevatedButton(
      //     onTap: () {},
      //     text: "Access My Link",
      //     margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 22.v),
      //     rightIcon: Container(
      //         margin: EdgeInsets.only(left: 16.h),
      //         child: CustomImageView(
      //             svgPath: ImageConstant.imgArrowrightPrimary))),
    );
  }
}
