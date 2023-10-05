import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class UserpasswordItemWidget extends StatelessWidget {
  const UserpasswordItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 6.v),
          CustomImageView(
            svgPath: ImageConstant.imgVideocameraLightBlue90001,
            height: 43.adaptSize,
            width: 43.adaptSize,
          ),
          SizedBox(height: 13.v),
          Text(
            "Password",
            style: theme.textTheme.titleLarge,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              top: 8.v,
              right: 14.h,
            ),
            child: Text(
              "Please update your password to provide added security to your account. Protect your information and your money.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyMediumGray600_1.copyWith(
                height: 1.61,
              ),
            ),
          ),
          SizedBox(height: 13.v),
          CustomElevatedButton(
            text: "Update",
            rightIcon: Container(
              margin: EdgeInsets.only(left: 16.h),
              child: CustomImageView(
                svgPath: ImageConstant.imgArrowrightPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
