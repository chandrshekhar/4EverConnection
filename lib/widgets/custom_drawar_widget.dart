import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import '../Controllers/Auth Controller/login_controller.dart';
import '../Controllers/User Profile Controller/user_profile_controller.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key, required this.myProfileController});

  final UserProfileController myProfileController;

  @override
  Widget build(BuildContext context) {
    String userName =
        "${myProfileController.userProfileModel.value.personalData!.firstName ?? ""}  ${myProfileController.userProfileModel.value.personalData!.lastName ?? ""}";
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.lightBlue,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xFF1D6F89),
                padding: EdgeInsets.only(
                    top: 25.h, left: 25.w, right: 20.w, bottom: 12),
                // margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: myProfileController
                                .userProfileModel.value.personalData?.photo ??
                            "", // Replace with the actual image URL
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          // Adjust the radius as needed
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator.adaptive(
                                backgroundColor: AppColors
                                    .appBackgroundColor), // Placeholder widget
                        errorWidget: (context, url, error) => const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 60,
                        ), // Widget to display when an error occurs
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              LoginController().logOut(context);
                            },
                            child: const Icon(
                              Icons.logout_sharp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            userName,
                            style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            myProfileController
                                .userProfileModel.value.personalData!.id
                                .toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: AppColors.darkBlue,
                            padding: EdgeInsets.all(5.sp),
                            width: MediaQuery.sizeOf(context).width * 0.7.w,
                            margin: EdgeInsets.only(top: 10.h),
                            child: const Center(
                              child: Text(
                                "USER",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.requestServiceOneScreen);
                            },
                            child: Items(
                              icon: ImageConstant.newServiceIcon,
                              itemText: "Request Service",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.myServicesScreen);
                            },
                            child: Items(
                              icon: ImageConstant.myservice,
                              itemText: "My Service",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.myProfileScreen);
                            },
                            child: Items(
                              icon: ImageConstant.myprofile,
                              itemText: "My Profile",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Items(
                              icon: ImageConstant.myBusinessProfile,
                              itemText: "My Business Profile",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.documentVaultScreen);
                            },
                            child: Items(
                              icon: ImageConstant.myDocumntVaults,
                              itemText: "My Document Vault",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: AppColors.darkBlue,
                            padding: EdgeInsets.all(5.sp),
                            width: MediaQuery.sizeOf(context).width * 0.7.w,
                            child: const Center(
                              child: Text(
                                "MARKETING PARTNER",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Items(
                              icon: ImageConstant.connect,
                              itemText: "Connect",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Items(
                              icon: ImageConstant.myConnection,
                              itemText: "My Connection",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Items(
                              icon: ImageConstant.myWallet,
                              itemText: "My Wallet",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Items(
                              icon: ImageConstant.mycontact,
                              itemText: "My Contacts",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Items(
                              icon: ImageConstant.myNotes,
                              itemText: "My Notes",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: AppColors.darkBlue,
                            padding: EdgeInsets.all(5.sp),
                            width: MediaQuery.sizeOf(context).width * 0.7.w,
                            child: const Center(
                              child: Text(
                                "TOOLS & UTILITIES",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.passwordSecurityScreen);
                            },
                            child: Items(
                              icon: ImageConstant.passwordandSecurity,
                              itemText: "Password & security",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Items(
                              icon: ImageConstant.support,
                              itemText: "Support",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Items(
                              icon: ImageConstant.donateConnection,
                              itemText: "Donate connection",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Items(
                              icon: ImageConstant.markaWish,
                              itemText: "Make a wish",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              LoginController().logOut(context);
                            },
                            child: Items(
                              icon: ImageConstant.logout,
                              itemText: "Logout",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.icon,
    required this.itemText,
  });
  final String icon;
  final String itemText;

  final Color grayColor = const Color(0xffEBEEF0);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            color: grayColor,
            width: 32.w,
            padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 10.sp),
            child: SvgPicture.asset(
              icon,
              height: 16.h,
              color: Colors.black.withOpacity(0.6),
            )),
        SizedBox(
          width: 10.h,
        ),
        Text(
          itemText,
          style: TextStyle(letterSpacing: 2.sp, fontSize: 16.sp),
        )
      ],
    );
  }
}
