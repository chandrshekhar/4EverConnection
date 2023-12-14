import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/widgets/custom_icon_button.dart';

import '../core/constants/colors.dart';
import '../core/constants/image_constant.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/banner.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              ImageConstant.appLogo,
              height: 150.h,
              width: 150.w,
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
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100.w, 50.h),
                            backgroundColor: AppColors.orangeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                       ElevatedButton(
                        onPressed: () {},
                        child:  Text('Register'),
                        style: ElevatedButton.styleFrom(
                           minimumSize: Size(100.w, 50.h),
                          backgroundColor: AppColors.dashBoardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ) /* add child content here */,
      ),
    );
    ;
  }
}
