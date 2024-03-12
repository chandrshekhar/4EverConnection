import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';

class PartnerContactWidget extends StatelessWidget {
  PartnerContactWidget({super.key});

  // final GlobalKey<ScaffoldState> scaffoldKey;

  List<String> dropDownList = [
    "Quickly Search",
    "Recent users",
    "Credit Card payment",
    "Complete Services",
    "M\$ Dollar",
    "Quick Entry",
    "Calendar"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      contanerWithBorder(
          child: CustomImageView(
        height: 24.h,
        width: 24.w,
        svgPath: ImageConstant.addContact,
      )),
      contanerWithBorder(
          child: SizedBox(
              height: 24.h,
              width: 200.w,
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10.h),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25.sp,
                    )),
              ))),
      PopupMenuButton(
        color: Colors.white,
        onSelected: (value) {
          // your logic
        },
        padding: EdgeInsets.zero,
        surfaceTintColor: Colors.white,
        icon: contanerWithBorder(
            color: AppColors.dashBoardColor,
            child: CustomImageView(
              height: 24.h,
              width: 24.w,
              svgPath: ImageConstant.filter,
            )),
        itemBuilder: (BuildContext bc) {
          return List.generate(
              dropDownList.length,
              (index) =>
                  dropDownWidget(title: dropDownList[index], index: index));
        },
      )
    ]);
  }

  dropDownWidget({required String title, required int index}) {
    return PopupMenuItem(
      padding: EdgeInsets.zero,
      onTap: () {
        print("index--> $index");
      },
      value: '$index',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 15.w, top: 15.h, bottom: 8.h, right: 20.w),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkBlue),
            ),
          ),
          index != 6
              ? Container(height: 0.5, color: AppColors.darkBlue)
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  contanerWithBorder({required Widget child, Color? color}) {
    return Container(
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(width: 0.5, color: AppColors.lightBlue)),
      padding: EdgeInsets.all(5.sp),
      child: child,
    );
  }
}
