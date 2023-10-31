import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../core/constants/colors.dart';

class DocumentVaultDataTable extends StatelessWidget {
  const DocumentVaultDataTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 0,
      rightHandSideColumnWidth: 700.w,
      isFixedHeader: true,
      headerWidgets: _getTitleWidget(),
      leftSideItemBuilder: _generateFirstColumnRow,
      rightSideItemBuilder: _generateRightHandSideColumnRow,
      itemCount: 20,
      rowSeparatorWidget: const Divider(
        color: Colors.black38,
        height: 1.0,
        thickness: 0.0,
      ),
      leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      itemExtent: 40.h,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Termination', 0),
      _getTitleItemWidget('Action', 80),
      _getTitleItemWidget('Document Name', 200),
      _getTitleItemWidget('Description', 200),
      _getTitleItemWidget('Date', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
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
    return Container(
      width: 100,
      height: 30.h,
      // padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: const Text("A"),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 125.w,
          height: 30.h,
          padding: EdgeInsets.only(left: 25.w),
          alignment: Alignment.centerLeft,
          child: const Icon(Icons.more_vert, color: Colors.green),
        ),
        Container(
          width: 180.w,
          height: 30.h,
          alignment: Alignment.center,
          child: Text('Uploaded document ajkfhajksh'),
        ),
        Container(
          width: 150.w,
          height: 30.h,
          alignment: Alignment.center,
          child: Text("phone"),
        ),
        Container(
          width: 140.w,
          height: 30.h,
          alignment: Alignment.centerRight,
          child: Text("Date"),
        ),
      ],
    );
  }
}
