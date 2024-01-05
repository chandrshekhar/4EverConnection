import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/login_screen/login_screen.dart';
import 'package:forever_connection/Feature/sign_up_screen/sign_up_screen.dart';

import '../core/constants/colors.dart';
import '../core/constants/image_constant.dart';

class AuthOptionScreen extends StatelessWidget {
  const AuthOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover
                    // fit: BoxFit.cover,
                    ),
              ),
              child: Center(
                child: Image.asset(
                  ImageConstant.appLogo,
                  height: 180.h,
                  width: 180.w,
                ),
              ),
            ),
            Text(
              '"The Effect of Quality"',
              style: TextStyle(
                  height: 4.h,
                  fontSize: 24.sp,
                  color: AppColors.buttonColor2,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Creating Lifetime Connections!",
              style: TextStyle(
                  height: 0.5.h,
                  fontSize: 20.sp,
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Your Virtual office with a\n 100% Free Income Opportunity",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.h, right: 40.w, left: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r), // <-- Radius
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUpScreen()),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    // maximumSize: Size(150.w, 100.h),
                    // minimumSize: Size(150.w, 60.h),
                    backgroundColor: AppColors.dashBoardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r), // <-- Radius
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
