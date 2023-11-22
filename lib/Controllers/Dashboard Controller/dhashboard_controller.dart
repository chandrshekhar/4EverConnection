import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/Model/Dashboard/tooltips_model.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:get/get.dart';

import '../../core/utils/shared_pref_services.dart';

class DashboardController extends GetxController {
  Dio dio = Dio();
  RxList<TooltipsModel> toolTipsDataList = <TooltipsModel>[].obs;

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
  ];

  Future<void> getTooltipsData() async {
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      var response = await dio.get(
        ApiPath.getTooltips,
      );
      if (response.statusCode == 200) {
        toolTipsDataList.value = (response.data as List)
            .map((json) => TooltipsModel.fromJson(json))
            .toList();

       
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  @override
  void onInit() {
    getTooltipsData();
    super.onInit();
  }
}
