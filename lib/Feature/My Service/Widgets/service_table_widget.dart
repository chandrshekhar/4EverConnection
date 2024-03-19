import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Controllers/Services/user_service_controller.dart';
import 'package:forever_connection/Feature/My%20Service/Presentation/service_details.dart';
import 'package:forever_connection/Feature/Webview/web_view.dart';
import 'package:forever_connection/Models/user_services_model.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/colors.dart';

// ignore: must_be_immutable
class UserServiceDataTable extends StatelessWidget {
  UserServiceDataTable({
    Key? key,
    required this.userServiceModel,
  }) : super(key: key);
  List<UserServicesModel> userServiceModel;

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 0,
      rightHandSideColumnWidth: 700.w,
      //rightHandSideColumnWidth: 785.w,
      isFixedHeader: true,
      headerWidgets: _getTitleWidget(),
      leftSideItemBuilder: _generateFirstColumnRow,
      rightSideItemBuilder: _generateRightHandSideColumnRow,
      itemCount: userServiceModel.length,
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
      _getTitleItemWidget("Service #", 100),
      _getTitleItemWidget('Completed Date', 120),
      _getTitleItemWidget("Service", 140),
      _getTitleItemWidget('Details', 120),
      _getTitleItemWidget('Fee', 120),
      //   _getTitleItemWidget('Status', 120),

      _getTitleItemWidget('Payment', 120),
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
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: <Widget>[
          Container(
            width: 100.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(userServiceModel[index].identifier ?? ""),
          ),
          Container(
            width: 120.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(userServiceModel[index].completedOn != null
                ? DateFormat("MM/dd/yyyy").format(
                    DateTime.parse(userServiceModel[index].completedOn ?? ""))
                : ""),
          ),
          Container(
            width: 140.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(userServiceModel[index].serviceName ?? ""),
          ),
          InkWell(
            onTap: () {
              UserServicesController().getServiceDetails(context,
                  userServiceModel[index].identifier.toString().substring(2));
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
          const Spacer(),
          // Container(
          //     width: 120.w,
          //     height: 30.h,
          //     alignment: Alignment.center,
          //     padding: const EdgeInsets.only(left: 5, right: 5),
          //     child: Container(
          //         padding: EdgeInsets.only(
          //             left: 10.w, top: 5.h, bottom: 5.h, right: 10.w),
          //         decoration: BoxDecoration(
          //             border: Border.all(width: 0.1),
          //             borderRadius: BorderRadiusDirectional.circular(1),
          //             color: Colors.grey.shade100),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Expanded(
          //                 child: Text(
          //                     userServiceModel[index].statusDescription ?? "")),
          //             const Icon(Icons.expand_more)
          //           ],
          //         ))),
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
          SizedBox(
            width: 5.w,
          )
        ],
      ),
    );
  }
}
