import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';

class MyServiceDetailsScreen extends StatefulWidget {
  const MyServiceDetailsScreen({super.key});

  @override
  State<MyServiceDetailsScreen> createState() => _MyServiceDetailsScreenState();
}

class _MyServiceDetailsScreenState extends State<MyServiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarImage(
              svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
              margin: EdgeInsets.only(left: 24.h, top: 6.h, bottom: 12.w),
              onTap: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: "My Services Details"),
          actions: [
            AppbarImage1(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.notificationsScreen);
                },
                svgPath: ImageConstant.imgCart,
                margin: EdgeInsets.fromLTRB(24.h, 1.h, 24.h, 6.h))
          ]),
      body: const Center(
        child: Text("Comming Soon..."),
      ),
    );
  }
}
