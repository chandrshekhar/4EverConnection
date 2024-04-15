import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Partner/Controller/partner_contact_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';
import 'package:get/get.dart';

import '../Presentation/partner_contact_list.dart';

class PartnerContactWidget extends StatefulWidget {
  final bool isContactAddShowingn;
  ValueChanged? onChanged;
  PartnerContactWidget(
      {super.key, this.isContactAddShowingn = true, this.onChanged});

  @override
  State<PartnerContactWidget> createState() => _PartnerContactWidgetState();
}

class _PartnerContactWidgetState extends State<PartnerContactWidget> {
  final partnerContacController = Get.put(PartnerContactController());
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

  List<String> contactList = ["Add Contact", "View Contact"];

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      widget.isContactAddShowingn
          ? PopupMenuButton(
              position: PopupMenuPosition.under,
              color: Colors.white,
              onSelected: (value) {
                if (value.toString() == "1") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const PartnerContactListScreen()));
                }
              },
              padding: EdgeInsets.zero,
              surfaceTintColor: Colors.white,
              icon: contanerWithBorder(
                  child: CustomImageView(
                height: 34.h,
                width: 34.w,
                svgPath: ImageConstant.addContact,
              )),
              itemBuilder: (BuildContext bc) {
                return List.generate(
                    contactList.length,
                    (index) => dropDownWidget(
                        title: contactList[index], index: index));
              },
            )
          : SizedBox(),
      SizedBox(
        width: widget.isContactAddShowingn ? 10.w : 0,
      ),
      Expanded(
        child: contanerWithBorder(
            child: SizedBox(
                height: 34.h,
                child: TextField(
                  onChanged: widget.onChanged,
                  maxLines: 1,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 18.h),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25.sp,
                      )),
                ))),
      ),
      SizedBox(
        width: 10.w,
      ),
      PopupMenuButton(
        position: PopupMenuPosition.under,
        color: Colors.white,
        onSelected: (value) {
          // your logic
        },
        padding: EdgeInsets.zero,
        surfaceTintColor: Colors.white,
        icon: contanerWithBorder(
            color: AppColors.dashBoardColor,
            child: CustomImageView(
              height: 34.h,
              width: 34.w,
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
