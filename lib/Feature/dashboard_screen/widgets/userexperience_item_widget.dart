import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';

// ignore: must_be_immutable
class UserexperienceItemWidget extends StatelessWidget {
  String? title;
  String? leftImagePath;
  String? buttonName;
  void Function()? ontap;
  void Function()? onIconClick;
  Color? infoButtonColor;
  double? infoButtonSize;
  UserexperienceItemWidget(
      {Key? key,
      this.title,
      this.buttonName,
      this.ontap,
      this.leftImagePath,
      this.infoButtonColor,
      this.infoButtonSize,
      required this.onIconClick})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.115,
        margin: EdgeInsets.only(
            bottom: 25.adaptSize, left: 25.adaptSize, right: 25.adaptSize),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5.adaptSize),
              topRight: Radius.circular(5.adaptSize)),
          color: const Color(0XFFD9D9D9).withOpacity(0.5.adaptSize),
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.adaptSize),
              alignment: Alignment.center,
              decoration: AppDecoration.fillLightBlue.copyWith(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      bottomLeft: Radius.circular(5.r))),
              child: CustomImageView(
                svgPath: leftImagePath,
                height: 35.adaptSize,
                width: 35.w,
              ),
            ),
            SizedBox(width: 15.adaptSize),
            Expanded(
              child: Text(
                title!,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: AppColors.floatingActionButtonColor,
                    fontSize: 22.adaptSize,
                    fontWeight: FontWeight.w400),
              ),
            ),
            IconButton(
                onPressed: onIconClick,
                icon: Icon(
                  Icons.info_outline,
                  size: infoButtonSize ?? 30.adaptSize,
                  color: infoButtonColor ??
                      AppColors.floatingActionButtonColor
                          .withOpacity(0.8.adaptSize),
                ))
            // InkWell(
            //   onTap: onIconClick,
            //   child: CircleAvatar(
            //     radius: 15.adaptSize,
            //     // backgroundColor: AppColors.floatingActionButtonColor,
            //     child: ClipOval(
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Icon(Icons.info_outline)
            //       ),
            //     ),
            //   ),
            // ),
            ,
            // SizedBox(
            //   width: 20.w,
            // )

            //  Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     SizedBox(
            //       width: 20.adaptSize,
            //     ),

            //     CustomImageView(
            //       svgPath: leftImagePath,
            //       height: 30,
            //       width: 20,
            //       color: Colors.transparent,
            //     ),
            //     SizedBox(
            //       width: 5.adaptSize,
            //     ),
            //   ],
            // ),
            // ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(
            //           top: 10.h,
            //           left: 15.adaptSize,
            //           right: 15.adaptSize,
            //           bottom: 15.adaptSize),
            //       child: CustomElevatedButton(
            //         onTap: ontap,
            //         height: 38.v,
            //         width: 198.h,
            //         text: buttonName!,
            //         buttonTextStyle: CustomTextStyles.titleSmallPrimary,
            //       ),
            //     ),

            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
