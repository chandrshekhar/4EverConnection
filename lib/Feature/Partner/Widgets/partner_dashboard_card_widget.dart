import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class PartnerDashboardCard extends StatelessWidget {
  String? title;
  String? leftImagePath;
  String? buttonName;
  void Function()? ontap;
  void Function()? onIconClick;
  Color? infoButtonColor;
  double? infoButtonSize;
  EdgeInsetsGeometry? margin;
  double? height;
  PartnerDashboardCard(
      {Key? key,
      this.title,
      this.buttonName,
      this.ontap,
      this.leftImagePath,
      this.infoButtonColor,
      this.infoButtonSize,
      required this.onIconClick,
      this.margin,
      this.height})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height * 0.11,
        margin:
            margin ?? EdgeInsets.only(bottom: 25.sp, left: 25.sp, right: 25.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5.sp),
              topRight: Radius.circular(5.sp)),
          color: const Color(0XFFD9D9D9).withOpacity(0.5.sp),
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              alignment: Alignment.center,
              decoration: AppDecoration.fillLightBlue.copyWith(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      bottomLeft: Radius.circular(5.r))),
              child: CustomImageView(
                svgPath: leftImagePath,
                height: 45.h,
                width: 45.w,
              ),
            ),
            SizedBox(width: 15.sp),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 6.h),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "Partner lobby",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppColors.floatingActionButtonColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.info_outline,
                      size: 15.sp,
                      color: infoButtonColor ??
                          AppColors.floatingActionButtonColor
                              .withOpacity(0.5.sp),
                    )
                  ]),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "\$0\n",
                          style: TextStyle(
                              color: AppColors.floatingActionButtonColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                          children: [
                        TextSpan(
                            text: "Active",
                            style: TextStyle(
                                color: AppColors.greyTextColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400))
                      ])),
                  RichText(
                      text: TextSpan(
                          text: "1\n",
                          style: TextStyle(
                              color: AppColors.floatingActionButtonColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                          children: [
                        TextSpan(
                            text: "Expired",
                            style: TextStyle(
                                color: AppColors.greyTextColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400))
                      ])),
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
