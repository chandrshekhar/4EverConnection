import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<Map<String, dynamic>> dashboardListData = [
    {
      "imagePath": ImageConstant.connectIcon,
      "title": "Connect Someone",
      "buttonName": "Connect",
      "buttonTap": () {
        Navigator.pushNamed(Get.context!, AppRoutes.requestServiceOneScreen);
      }
    },
    {
      "imagePath": ImageConstant.newServiceIcon,
      "title": "New Service Request",
      "buttonName": "Request Service",
      "buttonTap": () {
        Navigator.pushNamed(Get.context!, AppRoutes.requestServiceOneScreen);
      }
    },
    {
      "title": "View My Services",
      "imagePath": ImageConstant.viewMyServiceIcon,
      "buttonName": "View & Collaborate",
      "buttonTap": () {}
    },
    {
      "title": "View / Upload Documents",
      "imagePath": ImageConstant.viewUploadDocument,
      "buttonName": "Access My Vault",
      "buttonTap": () {}
    },
    // {
    //   "title": "Support",
    //   "desc":
    //       "If you need help we are here for you and 4ever. Feel free to reach out if you have a question.",
    //   "buttonName": "Get Support",
    //   "buttonTap": () {}
    // }
  ];
}
