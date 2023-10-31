import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';

class CustomPopupContent extends StatelessWidget {
  const CustomPopupContent(
      {super.key, required this.title, required this.content});

  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10.h, width: 10.w),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(1.sp),
                    margin: EdgeInsets.all(15.sp),
                    color: AppColors.darkBlue,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r)),
              margin: EdgeInsets.only(top: 10.h),
              padding: EdgeInsets.all(15.sp),
              child: Image.asset(
                content,
                fit: BoxFit.cover,
              ))
        ],
      ),
    );
  }
}
