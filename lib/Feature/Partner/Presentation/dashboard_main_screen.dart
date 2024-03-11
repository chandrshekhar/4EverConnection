import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Partner/Controller/main_dashboard_controller.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_contact_widget.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_drawer.dart';
import 'package:forever_connection/Feature/Request%20Service/Controller/reqiest_service_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_popup_widget.dart';
import '../../Dashboard/widgets/userexperience_item_widget.dart';
import '../../My Profile/Controller/user_profile_controller.dart';

// ignore: must_be_immutable
class PartnerDashboarMaindScreen extends StatelessWidget {
  PartnerDashboarMaindScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _partnerkey = GlobalKey();
  final partnerMainDashboardController =
      Get.put(PartnerMainDashboardController());
  final serviceController = Get.put(RequestServiceController());
  final myProfileController = Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    serviceController.getServiceProfssional();
    myProfileController.getUserProfileData();
    return Scaffold(
      key: _partnerkey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      endDrawer: const PartnerDrawer(),
      body: Obx(
        () => myProfileController.isLoadingProfileData == true
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // height: 160.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/banner.jpg"),
                            fit: BoxFit.fill)),
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageConstant.appLogo,
                            height: 80.h,
                            width: 80.w,
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomImageView(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          AppRoutes.notificationsScreen);
                                    },
                                    svgPath: ImageConstant.notificationIcon,
                                    width: 25.w,
                                    height: 25.h,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _partnerkey.currentState!.openEndDrawer();
                                    },
                                    child: Icon(
                                      Icons.menu,
                                      color: AppColors.appBackgroundColor,
                                      size: 40.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              AppRoutes.myProfileScreen);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.w, vertical: 3.h),
                                          // width: 100,
                                          // height: 30,
                                          decoration: BoxDecoration(
                                              color: AppColors.buttonColor2,
                                              borderRadius:
                                                  BorderRadius.circular(2.r)),
                                          child: Center(
                                            child: Text(
                                              "My Profile",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Obx(() => Text(
                                            "${myProfileController.userProfileModel.value.personalData?.firstName ?? ""} ${myProfileController.userProfileModel.value.personalData?.lastName ?? ""}",
                                            style: TextStyle(
                                                color: AppColors
                                                    .appBackgroundColor,
                                                fontSize: 17.h,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ],
                                  ),
                                  SizedBox(width: 8.w),
                                  CachedNetworkImage(
                                    imageUrl: myProfileController
                                            .userProfileModel
                                            .value
                                            .personalData
                                            ?.photo ??
                                        "", // Replace with the actual image URL
                                    imageBuilder: (context, imageProvider) =>
                                        CircleAvatar(
                                      radius: 20.r,
                                      backgroundColor: Colors.white,
                                      // Adjust the radius as needed
                                      backgroundImage: imageProvider,
                                    ),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator
                                            .adaptive(
                                            backgroundColor: AppColors
                                                .appBackgroundColor), // Placeholder widget
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 50.sp,
                                    ), // Widget to display when an error occurs
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                          color: AppColors.floatingActionButtonColor,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const PartnerContactWidget(),
                  SizedBox(height: 20.h),
                  Expanded(
                    // flex: 1,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: partnerMainDashboardController
                          .partnerMainDashboardListData.length,
                      itemBuilder: (context, index) {
                        return UserexperienceItemWidget(
                          height: MediaQuery.of(context).size.height * 0.09,
                          title: partnerMainDashboardController
                              .partnerMainDashboardListData[index]['title'],
                          leftImagePath: partnerMainDashboardController
                              .partnerMainDashboardListData[index]['imagePath'],
                          onIconClick: () {
                            if (index == 0) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16
                                          .r), // Set the border radius for the dialog
                                    ),
                                    child: const CustomPopupContent(
                                        title: "Connect",
                                        content:
                                            "assets/images/connect-tooltips.png"),
                                  );
                                },
                              );
                            } else if (index == 1) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Set the border radius for the dialog
                                    ),
                                    child: const CustomPopupContent(
                                      title: "Request Service",
                                      content:
                                          "assets/images/request-tooltips.png",
                                    ),
                                  );
                                },
                              );
                            } else if (index == 2) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Set the border radius for the dialog
                                    ),
                                    child: const CustomPopupContent(
                                        title: "View & Collaborate",
                                        content:
                                            "assets/images/collaborate-tooltips.png"),
                                  );
                                },
                              );
                            } else if (index == 3) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Set the border radius for the dialog
                                    ),
                                    child: const CustomPopupContent(
                                        title: "Access My Vault",
                                        content:
                                            "assets/images/access-my-vault.png"),
                                  );
                                },
                              );
                            }
                          },
                          ontap: () {
                            if (index == 0) {
                              Navigator.pushNamed(
                                  context, AppRoutes.partnerDashboard);
                            } else if (index == 1) {
                              Navigator.pushNamed(
                                  context, AppRoutes.partnerLobby);
                            } else if (index == 2) {
                              Navigator.pushNamed(
                                  context, AppRoutes.partnerDesk);
                            } else if (index == 3) {
                              Navigator.pushNamed(
                                  context, AppRoutes.partnerRegister);
                            } else if (index == 3) {
                              Navigator.pushNamed(
                                  context, AppRoutes.partnerReceivable);
                            } else if (index == 4) {
                              Navigator.pushNamed(
                                  context, AppRoutes.partnerReceivable);
                            }
                          },
                          buttonName: partnerMainDashboardController
                                  .partnerMainDashboardListData[index]
                              ['buttonName'],
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
