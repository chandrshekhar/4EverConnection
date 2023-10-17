import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/Auth%20Controller/login_controller.dart';
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
                        overflow: TextOverflow.ellipsis,
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
              makeSideField(
                title: "Request New Service",
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRoutes.requestServiceOneScreen);
                },
              ),
              makeSideField(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.myServicesScreen);
                },
                title: "My Services",
              ),
              makeSideField(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.documentVaultScreen);
                },
                title: "Documents Vault",
              ),
              makeSideField(
                title: "Support",
              ),
              makeSideField(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.myProfileScreen);
                },
                title: "My Profile",
              ),
              makeSideField(
                onTap: () {},
                title: "User",
              ),
              makeSideField(
                onTap: () {},
                title: "Marketing Partner",
              ),
              makeSideField(
                onTap: () {},
                title: "My Notes",
              ),
              makeSideField(
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRoutes.passwordSecurityScreen);
                },
                title: "Password & Security",
              ),
              makeSideField(
                onTap: () {},
                title: "Help",
              ),
              makeSideField(
                onTap: () {},
                title: "Donate Connections",
              ),
              makeSideField(
                onTap: () {},
                title: "Make A Wish",
              ),
              makeSideField(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
                },
                title: "Change Password",
              ),
              makeSideField(
                onTap: () {
                  LoginController().logOut(context);
                 
                },
                title: "LogOut",
              ),
              makeSideField(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.loginScreen);
                },
                title: "User ID No. 004777",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeSideField({void Function()? onTap, String? title}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 10.h,
      ),
      title: Text(
        title!,
        style: CustomTextStyles.bodyLargeOnErrorContainer.copyWith(
          height: 2.46,
        ),
      ),
    );
  }
}
