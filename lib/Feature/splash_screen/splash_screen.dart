import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';

import '../../core/utils/shared_pref_services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      final token = await SharedPref().getUserToken();
      log("sp--> $token");
      if (token != null && token.toString().isNotEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.dashboardScreen, (route) => false);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.authOptionScreen, (route) => false);
      }
    });
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: CustomImageView(
          height: 190.h,
          width: 190.h,
          imagePath: ImageConstant.appLogo,
        ),
      ),
    );
  }
}
