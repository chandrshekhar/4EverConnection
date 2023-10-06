import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.loginScreen, (route) => false);
    });
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: CustomImageView(
            height: 190.h,
            width: 190.h,
            imagePath: ImageConstant.appLogo,
          ),
        ),
      ),
    );
  }
}
