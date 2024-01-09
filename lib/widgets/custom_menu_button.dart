import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';

class CustomMenuButtonWidget extends StatelessWidget {
  CustomMenuButtonWidget({super.key, required this.globalKey});

  GlobalKey<ScaffoldState> globalKey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          globalKey.currentState!.openEndDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: AppColors.darkBlue,
          size: 30.sp,
        ));
  }
}
