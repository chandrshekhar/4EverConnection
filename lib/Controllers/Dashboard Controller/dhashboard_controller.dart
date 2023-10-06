import 'package:flutter/material.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<Map<String, dynamic>> dashboardListData = [
    {
      "title": "Request New Service",
      "desc":
          "Explore Our Suite of Essential Services &Get ready for an Amazing 5 Star Experience!",
      "buttonName": "Request Service",
      "buttonTap": () {
        Navigator.pushNamed(Get.context!, AppRoutes.requestServiceOneScreen);
      }
    },
    {
      "title": "My Services",
      "desc": "Review Your Servicesin Progress and Completed",
      "buttonName": "Review and Collaborate",
      "buttonTap": () {}
    },
    {
      "title": "Documents Vault",
      "desc":
          "Time is Life & Life is Time! Did you ever wasted time searching for documents? Search no more!",
      "buttonName": "Manage",
      "buttonTap": () {}
    },
    {
      "title": "Request New Service",
      "desc":
          "Explore Our Suite of Essential Services &Get ready for an Amazing 5 Star Experience!",
      "buttonName": "Go to my Vault",
      "buttonTap": () {}
    },
    {
      "title": "Support",
      "desc":
          "If you need help we are here for you and 4ever. Feel free to reach out if you have a question.",
      "buttonName": "Get Support",
      "buttonTap": () {}
    }
  ];
}
