import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';

import '../../../widgets/custom_popup_widget.dart';

// ignore: must_be_immutable
class UserexperienceItemWidget extends StatelessWidget {
  String? title;
  String? leftImagePath;
  String? buttonName;
  void Function()? ontap;
  void Function()? onIconClick;
  UserexperienceItemWidget(
      {Key? key,
      this.title,
      this.buttonName,
      this.ontap,
      this.leftImagePath,
      required this.onIconClick})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.2,
      margin: EdgeInsets.only(bottom: 30.h),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20.adaptSize,
                ),
                CustomImageView(
                  svgPath: leftImagePath,
                  height: 30,
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleLargePrimary_1,
                  ),
                ),
                CustomImageView(
                  svgPath: leftImagePath,
                  height: 30,
                  width: 20,
                  color: Colors.transparent,
                ),
                SizedBox(
                  width: 5.adaptSize,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 10.h,
                    left: 15.adaptSize,
                    right: 15.adaptSize,
                    bottom: 15.adaptSize),
                child: CustomElevatedButton(
                  onTap: ontap,
                  height: 38.v,
                  width: 198.h,
                  text: buttonName!,
                  buttonTextStyle: CustomTextStyles.titleSmallPrimary,
                ),
              ),
              SizedBox(
                width: 28.adaptSize,
              ),
              InkWell(
                onTap: onIconClick,
                child: CircleAvatar(
                  radius: 15.adaptSize,
                  backgroundColor: AppColors.floatingActionButtonColor,
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        ImageConstant.infoIcon,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.adaptSize,
              )
            ],
          )
        ],
      ),
    );
  }
}
