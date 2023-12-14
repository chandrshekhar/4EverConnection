import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors.dart';
import '../core/constants/image_constant.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 300.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                // fit: BoxFit.cover,
              ),
            ),
            child: Image.asset(
              ImageConstant.appLogo,
              height: 100.h,
              width: 100.w,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                const Text('"The Effect of Quality"'),
                const Text("Creating Lifetime Connectins!"),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                    "Your Virtual office with a 100% Free Income Opportunity"),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100.w, 50.h),
                        backgroundColor: AppColors.orangeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                    SizedBox(width: 20.w),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100.w, 50.h),
                        backgroundColor: AppColors.dashBoardColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      child: const Text('Register'),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
