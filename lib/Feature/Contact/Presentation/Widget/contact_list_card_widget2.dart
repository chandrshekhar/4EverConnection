import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactListCard2 extends StatelessWidget {
  String author;
  String photo;
  String phoneNumber;
  String email;
  String? go;
  String? connect;
  VoidCallback? goPress;

  ContactListCard2(
      {super.key,
      required this.email,
      required this.author,
      required this.photo,
      required this.phoneNumber,
      this.go,
      this.goPress,
      this.connect});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.only(bottom: 4.h),
      decoration: AppDecoration.outlineBlack900.copyWith(
        color: AppColors.appBackgroundColor,
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
                SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: photo,
                        errorWidget: (
                          context,
                          url,
                          error,
                        ) =>
                            Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text(author[0].toUpperCase()),
                        ),
                        progressIndicatorBuilder: (
                          context,
                          url,
                          downloadProgress,
                        ) =>
                            Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                      )),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
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
                _buildLable("Call", Icons.mobile_screen_share_outlined, () {
                  try {
                    final Uri phoneLaunchUri =
                        Uri(scheme: 'tel', path: phoneNumber);

                    launchUrl(phoneLaunchUri);
                    // launchUrl(Uri.parse(url));
                  } catch (e) {
                    log(e.toString());
                  }
                }),
                _buildLable("Text", Icons.message_outlined, () {
                  try {
                    final Uri phoneLaunchUri =
                        Uri(scheme: 'sms', path: phoneNumber);
                    launchUrl(phoneLaunchUri);
                  } catch (e) {
                    log(e.toString());
                  }
                }),
                _buildLable("Email", Icons.email_outlined, () {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: email.trim(),
                  );
                  launchUrl(emailLaunchUri);
                }),
                _buildLable("Go", Icons.location_on_outlined, goPress),
                _buildLable("Connect", Icons.connected_tv, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLable(
      String lableName, IconData lableIcon, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: 60.w,
        decoration: BoxDecoration(
            color: Colors.white,
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
      ),
    );
  }
}
