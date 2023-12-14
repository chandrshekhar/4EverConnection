import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:forever_connection/theme/custom_text_style.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';

class ContactListCard2 extends StatelessWidget {
  String author;
  String photo;
  String phoneNumber;
  String email;
  String? go;
  String? connect;

  ContactListCard2(
      {super.key,
      required this.email,
      required this.author,
      required this.photo,
      required this.phoneNumber,
      this.go,
      this.connect});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.only(bottom: 4.h),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder9,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 10.h, bottom: 10.h, left: 15.w, right: 15.w),
            alignment: Alignment.center,
            decoration: AppDecoration.fillLightBlue.copyWith(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9.r),
                topRight: Radius.circular(9.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 24.r,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chandrshekhar pandey",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "connected by other",
                        style: TextStyle(height: 1.2.h, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                  size: 30.sp,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLable(
                  "Call",
                  Icons.mobile_screen_share_outlined,
                ),
                _buildLable(
                  "Text",
                  Icons.message_outlined,
                ),
                _buildLable(
                  "Email",
                  Icons.email_outlined,
                ),
                _buildLable(
                  "Go",
                  Icons.location_on_outlined,
                ),
                _buildLable(
                  "Connect",
                  Icons.connected_tv,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLable(String lableName, IconData lableIcon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      width: 60.w,
      decoration: BoxDecoration(
          color: AppColors.grayColor,
          borderRadius: BorderRadiusDirectional.circular(6.r)),
      child: Column(
        children: [
          Icon(lableIcon, size: 18.sp, color: AppColors.darkBlue),
          SizedBox(
            height: 5.h,
          ),
          Text(
            lableName,
            style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
