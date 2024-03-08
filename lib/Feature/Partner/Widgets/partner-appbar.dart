import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';

class PartnerAppBar extends StatelessWidget implements PreferredSizeWidget {
  PartnerAppBar({super.key, this.title});

  String? title;

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      title: Text(
        title ?? "",
        style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            color: AppColors.appBarTextColor),
      ),
      centerTitle: true,
      elevation: 0.5,
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context)),
      actions: [
        AppbarImage1(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.notificationsScreen);
            },
            svgPath: ImageConstant.imgCart,
            margin: EdgeInsets.fromLTRB(10.w, 14.h, 15.w, 15.h)),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 10.h),
        //   child: CustomMenuButtonWidget(globalKey: _key),
        // ),
      ],
    );
  }
}
