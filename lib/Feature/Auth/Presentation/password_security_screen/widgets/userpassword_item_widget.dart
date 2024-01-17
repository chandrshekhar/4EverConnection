import 'package:flutter/material.dart';
import 'package:forever_connection/core/utils/app_export.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class UserpasswordItemWidget extends StatelessWidget {
  void Function()? onTap;
  String? name;
  String? desc;
  String? icon;
  UserpasswordItemWidget(
      {Key? key, this.onTap, this.name, this.desc, this.icon})
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
            svgPath: icon!,
            height: 43.adaptSize,
            width: 43.adaptSize,
          ),
          SizedBox(height: 13.v),
          Text(
            name!,
            style: theme.textTheme.titleLarge,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              top: 8.v,
              right: 14.h,
            ),
            child: Text(
              desc!,
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
            onTap: onTap,
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
