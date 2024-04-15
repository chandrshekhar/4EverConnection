import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/colors.dart';

// ignore: must_be_immutable
class ContactListTable extends StatelessWidget {
  ContactListTable({Key? key, required this.titleList, this.data})
      : super(key: key);
  List<Map<String, dynamic>> titleList;
  List<dynamic>? data;

  String? noData;

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
            width: 80.w,
            child: PopupMenuButton<String>(
                position: PopupMenuPosition.under,
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
                            'Request Access',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                  ];
                }),
          ),
          Container(
            width: 200.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(data?[index].contactName),
          ),
          Container(
            width: 200.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(data?[index].mobilePhone),
          ),
          Container(
            width: 200,
            height: 30.h,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(data?[index].email),
          ),
        ],
      ),
    );
  }
}
