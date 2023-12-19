import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../widgets/custom_drop_down.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class MyBottomSheetContent extends StatelessWidget {
  const MyBottomSheetContent({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.appBarTextColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r))),
              child: Center(
                child: Text(
                  "Add Method",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 15.h, bottom: 20.h, right: 20.h, left: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richTextForLable(title: "Available Pay Methods"),
                  CustomDropDown(
                    contentPadding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 10, right: 10),
                    hintText: "Select payment mode",
                    items: const ["Zelle", "PayPal", "Venmo", "E-Check"],
                    onChanged: (val) {},
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  richTextForLable(title: "Account Association"),
                  CustomDropDown(
                    contentPadding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 10, right: 10),
                    hintText: "Select Account",
                    items: const ["Mobile Number", "Email address"],
                    onChanged: (val) {},
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  richTextForLable(title: "Mobile Number"),
                  CustomTextFormField(
                    hintText: "Mobile Number",
                    validator: (v) {
                      if (v.toString().isEmpty) {
                        return "Enter valid mobile number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                          height: 54.h,
                          width: 150.w,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.zero,
                              color: Colors.transparent),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w500),
                            ),
                          )),
                      CustomIconButton(
                          height: 45.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.zero,
                              color: AppColors.appBarTextColor),
                          child: Center(
                            child: Text(
                              "Add Method",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget richTextForLable({
    required String title,
  }) {
    return RichText(
        text: TextSpan(
      text: title,
      style: TextStyle(
        color: AppColors.appBarTextColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      children: const <TextSpan>[
        TextSpan(
          text: '*',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }
}
