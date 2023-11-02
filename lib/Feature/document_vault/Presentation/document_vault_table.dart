import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

import '../../../Controllers/Documents Vault controller/documents_vault_controller.dart';
import '../../../core/constants/colors.dart';

// ignore: must_be_immutable
class DocumentVaultDataTable extends StatelessWidget {
  DocumentVaultDataTable({Key? key, required this.documentsVaultController})
      : super(key: key);
  DocumentsVaultController documentsVaultController;
  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 0,
      rightHandSideColumnWidth: 700.w,
      isFixedHeader: true,
      headerWidgets: _getTitleWidget(),
      leftSideItemBuilder: _generateFirstColumnRow,
      rightSideItemBuilder: _generateRightHandSideColumnRow,
      itemCount: documentsVaultController.documentValultDataList.length,
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

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Termination', 0),
      _getTitleItemWidget('Action', 80),
      _getTitleItemWidget('Upload Date', 150),
      _getTitleItemWidget('Document Name', 200),
      _getTitleItemWidget('Description', 200),
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
    return Container();
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Container(
      color: (index % 2 == 0) ? Colors.white : AppColors.bgColor,
      padding: EdgeInsets.symmetric(vertical: (index % 2 != 0) ? 4.h : 0),
      child: Row(
        children: <Widget>[
          Container(
            height: 30.h,
            width: 80.w,
            child: PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                // position: PopupMenuPosition.under,
                onSelected: null,
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.blueGrey,
                ), // Icon for the button
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    // Define the menu items
                    const PopupMenuItem<String>(
                      value: 'Resend',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Call',
                      child: Text('Delete'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Email',
                      child: Text('Update'),
                    ),
                  ];
                }),
          ),
          // Container(
          //   width: 80.w,
          //   height: 30.h,
          //   padding: EdgeInsets.only(left: 25.w),
          //   alignment: Alignment.centerLeft,
          //   child: const Icon(Icons.more_vert, color: Colors.blueGrey),
          // ),
          Container(
            width: 150.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(DateFormat("yyyy-MM-dd").format(DateTime.parse(
                documentsVaultController
                    .documentValultDataList[index].publicationDate
                    .toString()))),
          ),
          Container(
            width: 200.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(documentsVaultController
                .documentValultDataList[index].typeName
                .toString()),
          ),
          Container(
            width: 200.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(documentsVaultController
                .documentValultDataList[index].description
                .toString()),
          ),
        ],
      ),
    );
  }
}
