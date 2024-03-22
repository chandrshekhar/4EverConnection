import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/My%20Service/Presentation/service_details.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/web_view.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../../../core/constants/colors.dart';

// ignore: must_be_immutable
class UserDataTable extends StatelessWidget {
  UserDataTable({Key? key, required this.titleList, this.data})
      : super(key: key);
  List<Map<String, dynamic>> titleList;
  List<dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 0,
      rightHandSideColumnWidth: getRightHandSideColumnWidth(titleList),
      isFixedHeader: true,
      headerWidgets: List.generate(
          titleList.length,
          (index) => _getTitleItemWidget(
              label: titleList[index]['title'],
              width: double.parse(titleList[index]['width'].toString()))),
      leftSideItemBuilder: _generateFirstColumnRow,
      rightSideItemBuilder: _generateRightHandSideColumnRow,
      itemCount: data != null ? data!.length : 0,
      // rowSeparatorWidget: const Divider(
      //   color: Colors.black38,
      //   height: 1.0,
      //   thickness: 0.0,
      // ),
      leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      itemExtent: 40.h,
    );
  }

  double getRightHandSideColumnWidth(List<Map<String, dynamic>> dataList) {
    double totalWidth = 0;
    for (int i = 0; i < dataList.length; i++) {
      double width = double.parse(dataList[i]['width'].toString());
      totalWidth += width;
    }
    return totalWidth;
  }

  Widget _getTitleItemWidget({required String label, required double width}) {
    return Container(
      width: width.w,
      height: 40.h,
      alignment: Alignment.center,
      color: AppColors.floatingActionButtonColor,
      child: Text(label,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container();
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Container(
      color: (index % 2 == 0) ? Colors.white : AppColors.bgColor,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 30.h,
            width: 100.w,
            child: PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                // position: PopupMenuPosition.under,
                surfaceTintColor: Colors.white,
                onSelected: null,
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.blueGrey,
                ), // Icon for the button
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    // Define the menu items
                    PopupMenuItem<String>(
                      onTap: () async {},
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            color: AppColors.lightBlue,
                            size: 15.sp,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'View',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () async {},
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.download,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Download',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () async {},
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Email',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {},
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.print,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Print',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {},
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Edit',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {},
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Delete',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                  ];
                }),
          ),
          Container(
            width: 120.w,
            height: 30.h,
            alignment: Alignment.center,
            // child: Text(userServiceModel[index].completedOn != null
            //     ? DateFormat("MM/dd/yyyy").format(
            //         DateTime.parse(userServiceModel[index].completedOn ?? ""))
            //     : ""),
            child: Text(data?[index].identifier),
          ),
          Container(
            width: 140.w,
            height: 30.h,
            alignment: Alignment.center,
            child: const Text("text2"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyServiceDetailsScreen()));
            },
            child: Container(
              width: 120.w,
              height: 30.h,
              alignment: Alignment.center,
              child: Text(
                "View Details",
                style: TextStyle(color: AppColors.darkBlue),
              ),
            ),
          ),
          Container(
            width: 120.w,
            height: 30.h,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
                padding: EdgeInsets.only(
                    left: 10.w, top: 3.h, bottom: 3.h, right: 10.w),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.1),
                    borderRadius: BorderRadius.circular(2.r),
                    color: Colors.grey.shade100),
                child: Row(
                  children: [
                    const Text(
                      "\$",
                      style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 15),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      color: Colors.grey,
                      height: 15,
                      width: 1,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text(
                      "",
                      style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 15),
                    )
                  ],
                )),
          ),
          Container(
              width: 120.w,
              height: 30.h,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                  padding: EdgeInsets.only(
                      left: 10.w, top: 5.h, bottom: 5.h, right: 10.w),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.1),
                      borderRadius: BorderRadiusDirectional.circular(1),
                      color: Colors.grey.shade100),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text("text2"),
                      ),
                      Icon(Icons.expand_more)
                    ],
                  ))),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const WebViewScreen(
                            webViewUrl: ApiPath.payServiceFee,
                          )));
            },
            child: Container(
                width: 60.w,
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5.sp, color: AppColors.darkBlue),
                    borderRadius: BorderRadius.circular(2.r)),
                child: Row(
                  children: [
                    Icon(Icons.payment, size: 13.sp, color: Colors.green),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Pay",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
