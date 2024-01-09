import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/My%20Service/Presentation/collaboration_page.dart';
import 'package:forever_connection/Models/user_services_model.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants/colors.dart';

// ignore: must_be_immutable
class UserServiceInProgressDataTable extends StatelessWidget {
  UserServiceInProgressDataTable({
    Key? key,
    required this.userServiceModel,
  }) : super(key: key);
  List<UserServicesModel> userServiceModel;

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 0,
      rightHandSideColumnWidth: 810.w,
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
      _getTitleItemWidget('Start Date', 120),
      _getTitleItemWidget("Service", 140),
      _getTitleItemWidget('Collaborate', 140),
      _getTitleItemWidget('Fee', 120),
      _getTitleItemWidget('Status', 130),
      _getTitleItemWidget('Action', 60),
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
      // padding: EdgeInsets.symmetric(vertical: (index % 2 != 0) ? 4.h : 0),
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
            child: Text(DateFormat("MM/dd/yyyy").format(DateTime.parse(
                userServiceModel[index].actionScheduledOn ?? ""))),
          ),
          Container(
            width: 140.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(userServiceModel[index].serviceName ?? ""),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ServiceCollaboratationPage()));
            },
            child: Container(
              width: 140.w,
              height: 30.h,
              alignment: Alignment.center,
              child: Text(
                "Collaboration Page",
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
                    Text(
                      userServiceModel[index].serviceFee.toString() ?? "0",
                      style: const TextStyle(
                          color: Color(0xFF6B6B6B), fontSize: 15),
                    )
                  ],
                )),
          ),
          Container(
              width: 130.w,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                          child: Text(
                        "In progress",
                        style: TextStyle(fontSize: 15.sp),
                      )),
                      const Icon(Icons.expand_more)
                    ],
                  ))),
          SizedBox(
            height: 30.h,
            width: 60.w,
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
                    PopupMenuItem<String>(
                      onTap: () async {
                        // var url = Uri.parse(documentsVaultController
                        //         .documentVaultList[index].file ??
                        //     "");
                        // if (await canLaunchUrl(url)) {
                        //   await launchUrl(
                        //     url,
                        //   );
                        // } else {
                        //   throw 'Could not launch $url';
                        // }
                      },
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.call,
                            color: AppColors.lightBlue,
                            size: 15.sp,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Call',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),

                    PopupMenuItem<String>(
                      onTap: () async {
                        final Uri params = Uri(
                          scheme: 'mailto',
                          path: 'support@4ever.net',
                          //add subject and body here
                        );

                        var url = Uri.parse(params.toString());
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
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
                      onTap: () async {
                        // final Uri params = Uri(
                        //   scheme: 'mailto',
                        //   path: 'support@4ever.net',
                        //   //add subject and body here
                        // );

                        // var url = Uri.parse(params.toString());
                        // if (await canLaunchUrl(url)) {
                        //   await launchUrl(url);
                        // } else {
                        //   throw 'Could not launch $url';
                        // }
                      },
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.message,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Message',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                  ];
                }),
          ),
        ],
      ),
    );
  }
}
