import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../widgets/custom_icon_button.dart';

class WithdraFundsCardWidget extends StatelessWidget {
  final String? inforDetails, buttonName;
  final VoidCallback onPress;

  const WithdraFundsCardWidget(
      {super.key, this.inforDetails, this.buttonName, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 13.w, right: 13.w, top: 10.h, bottom: 15.h),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.zero, color: AppColors.appBackgroundColor),
      child: Column(
        children: [
          Text(
            inforDetails ??
                'In this section, you can request a withdrawal of your "Marketing Dollars" (M\$) earned, up to your Available Funds (Minimum \$50). You can also Add, Edit, Delete, or Select a Default payment method.',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              color: AppColors.withAvailbleInfoColor,
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          CustomIconButton(
            onTap: onPress,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: AppColors.appBarTextColor),
            width: 82.w,
            height: 31.h,
            child: Center(
              child: Text(
                buttonName ?? "Got it!",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
