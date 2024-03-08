import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';

class PartnerContactWidget extends StatelessWidget {
  const PartnerContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      contanerWithBorder(
          child: const Icon(
        Icons.menu,
        color: AppColors.dashBoardColor,
      )),
      contanerWithBorder(
          child: SizedBox(
              height: 24.h,
              width: 200.w,
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10.h),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25.sp,
                    )),
              ))),
      contanerWithBorder(
          child: const Icon(
        Icons.contact_page,
        color: AppColors.dashBoardColor,
      )),
      contanerWithBorder(
          child: const Icon(
        Icons.filter_2_outlined,
        color: AppColors.dashBoardColor,
      ))
    ]);
  }

  contanerWithBorder({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: AppColors.lightBlue)),
      padding: EdgeInsets.all(5.sp),
      child: child,
    );
  }
}
