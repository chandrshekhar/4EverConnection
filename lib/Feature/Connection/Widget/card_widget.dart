import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';

class ConnectionCardWidget extends StatelessWidget {
  final String title;
  final String buttonName;
  final String? available;
  final String? des;
  final VoidCallback? onTap;
  const ConnectionCardWidget(
      {super.key,
      required this.title,
      required this.buttonName,
      this.available,
      this.des, this.onTap, });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.2,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder9,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            decoration: AppDecoration.fillLightBlue.copyWith(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9.h),
                    topRight: Radius.circular(9.h))),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleLargePrimary_1,
            ),
          ),
          SizedBox(
            height: 15.adaptSize,
          ),
          Text(
            available ?? "",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.adaptSize,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10.adaptSize,
          ),
          SizedBox(
            height: 30.adaptSize,
          ),
          Text(
            des ?? "",
            style: TextStyle(
                color: AppColors.buttonColor,
                fontSize: 14.adaptSize,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10.adaptSize,
          ),
          CustomElevatedButton(
            onTap: onTap,
            height: 38.v,
            width: 198.h,
            text: buttonName,
            buttonTextStyle: CustomTextStyles.titleSmallPrimary,
          ),
          SizedBox(
            height: 15.adaptSize,
          ),
        ],
      ),
    );
  }
}
