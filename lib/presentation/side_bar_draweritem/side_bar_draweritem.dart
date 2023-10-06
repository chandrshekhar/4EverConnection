import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SideBarDraweritem extends StatelessWidget {
  const SideBarDraweritem({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 26.h,
            vertical: 19.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse191x91,
                      height: 91.adaptSize,
                      width: 91.adaptSize,
                      radius: BorderRadius.circular(
                        45.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.h,
                        top: 37.v,
                        bottom: 22.v,
                      ),
                      child: Text(
                        "Austin Cooper",
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.v),
              Divider(
                thickness: 1.v,
              ),
              SizedBox(height: 25.v),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRoutes.requestServiceOneScreen);
                },
                contentPadding: EdgeInsets.zero,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.h,
                ),
                title: Text(
                  "Request New Service",
                  style: CustomTextStyles.bodyLargeOnErrorContainer.copyWith(
                    height: 2.46,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.myServicesScreen);
                },
                contentPadding: EdgeInsets.zero,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.h,
                ),
                title: Text(
                  "My Services",
                  style: CustomTextStyles.bodyLargeOnErrorContainer.copyWith(
                    height: 2.46,
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.h,
                ),
                title: Text(
                  "Documents Vault",
                  style: CustomTextStyles.bodyLargeOnErrorContainer.copyWith(
                    height: 2.46,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRoutes.passwordSecurityScreen);
                },
                contentPadding: EdgeInsets.zero,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.h,
                ),
                title: Text(
                  "Password & Security",
                  style: CustomTextStyles.bodyLargeOnErrorContainer.copyWith(
                    height: 2.46,
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.h,
                ),
                title: Text(
                  "Support",
                  style: CustomTextStyles.bodyLargeOnErrorContainer.copyWith(
                    height: 2.46,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
                },
                contentPadding: EdgeInsets.zero,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.h,
                ),
                title: Text(
                  "Change Password",
                  style: CustomTextStyles.bodyLargeOnErrorContainer.copyWith(
                    height: 2.46,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.myProfileScreen);
                },
                contentPadding: EdgeInsets.zero,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.h,
                ),
                title: Text(
                  "My Profile",
                  style: CustomTextStyles.bodyLargeOnErrorContainer.copyWith(
                    height: 2.46,
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.h,
                ),
                title: Text(
                  "Make A Wish",
                  style: CustomTextStyles.bodyLargeOnErrorContainer.copyWith(
                    height: 2.46,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.loginScreen);
                },
                contentPadding: EdgeInsets.zero,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.h,
                ),
                title: Text(
                  "Logout",
                  style: CustomTextStyles.bodyLargeOnErrorContainer.copyWith(
                    height: 2.46,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
