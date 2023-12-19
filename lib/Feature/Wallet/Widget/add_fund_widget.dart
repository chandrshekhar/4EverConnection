import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';

import '../../../widgets/custom_icon_button.dart';

class AddFundWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String? buttonName, amount;
  const AddFundWidget(
      {super.key, required this.onPress, this.buttonName, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: AppColors.appBarTextColor,
      ),
      child: Column(
        children: [
          CustomIconButton(
            height: 45.h,
            width: 150.w,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.zero, color: AppColors.buttonColor),
            onTap: onPress,
            child: Center(
              child: Text(
                buttonName ?? "Add Method",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Available Funds",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "\$${amount ?? 0}",
                style: TextStyle(
                  color: AppColors.buttonColor2,
                  fontFamily: "Poppins",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
