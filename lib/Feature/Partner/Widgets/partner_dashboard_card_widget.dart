import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class PartnerDashboardCard extends StatelessWidget {
  String? title;
  String? leftImagePath;
  String? subTitle1;
  String? subTitle12;
  int? value1;
  int? value2;
  void Function()? ontap;
  void Function()? onIconClick;
  Color? infoButtonColor;
  double? infoButtonSize;
  EdgeInsetsGeometry? margin;
  double? height;
  PartnerDashboardCard(
      {Key? key,
      this.title,
      this.ontap,
      this.leftImagePath,
      this.infoButtonColor,
      this.infoButtonSize,
      required this.onIconClick,
      this.margin,
      this.height,
      this.value1,
      this.value2,
      this.subTitle1,
      this.subTitle12})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height * 0.14,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: EdgeInsets.only(right: 10.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5.sp),
              topRight: Radius.circular(5.sp)),
          color: const Color(0XFFD9D9D9).withOpacity(0.5.sp),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title ?? "Partner lobby",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColors.floatingActionButtonColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        // SizedBox(width: 5.w),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info_outline,
                            size: 20.sp,
                            color: infoButtonColor ??
                                AppColors.floatingActionButtonColor
                                    .withOpacity(0.5.sp),
                          ),
                        )
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${value1 ?? 0}",
                              style: TextStyle(
                                  color: AppColors.floatingActionButtonColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600)),
                       value2!=null?   Text("${value2 ?? 0}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600)): const SizedBox.shrink()
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(subTitle1 ?? '',
                              style: TextStyle(
                                  color: AppColors.greyTextColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400)),
                        subTitle12 !=null?  Text(subTitle12 ?? "",
                              style: TextStyle(
                                  color: AppColors.greyTextColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400)):const SizedBox.shrink()
                        ])
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
