import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/My%20Profile/Models/protection_profile.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/shared_pref_services.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProtectionController extends GetxController {
  var policeNumberController = TextEditingController().obs;
  var policyTypeController = TextEditingController().obs;
  var issueDateController = TextEditingController().obs;
  var companynameController = TextEditingController().obs;
  var companyPhoneController = TextEditingController().obs;
  var deathBenefitController = TextEditingController().obs;
  var premimusController = TextEditingController().obs;

  Dio dio = Dio();

  List<String> protectionList = [
    "Life Insurance",
    "Disability insurance",
    "Health Insurance",
    "Long Term Care Insurance",
    "Home Insurance",
    "Car insurance"
  ];

  RxBool isprotectionDataLoading = false.obs;
  RxList<ProtectionDataModel> protectionDataList = <ProtectionDataModel>[].obs;
  updateControllerData(ProtectionDataModel dataModel, BuildContext context) {
    policeNumberController.value.text = dataModel.policyNumber ?? "";
    policyTypeController.value.text = dataModel.policyType ?? "";
    issueDateController.value.text = dataModel.issueDate ?? "";
    companyPhoneController.value.text = dataModel.companyPhone ?? "";
    companynameController.value.text = dataModel.companyName ?? "";
    deathBenefitController.value.text = currency(
            context: context, amount: dataModel.currentDeathBenefit ?? "00") ??
        "";

    print("permimus data ${dataModel.currentPremiums}");
    if (dataModel.currentPremiums == null || dataModel.currentPremiums == "") {
    } else {
      premimusController.value.text = currency(
              context: context, amount: dataModel.currentPremiums ?? "00") ??
          "";
    }
  }

  String? currency({BuildContext? context, String? amount}) {
    // Locale locale = Localizations.localeOf(context!);
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
    String? formattedAmount = NumberFormat.currency(
            locale: Platform.localeName, symbol: format.currencySymbol)
        .format(double.parse(amount!));
    return formattedAmount;
  }

  Future<void> getUserRelationshipData() async {
    var token = await SharedPref().getUserToken();
    try {
      isprotectionDataLoading(true);
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      var response = await dio.get(ApiPath.protection);
      if (response.statusCode == 200) {
        final List<ProtectionDataModel> data = (response.data as List)
            .map((json) => ProtectionDataModel.fromJson(json))
            .toList();

        protectionDataList.value = data;

        isprotectionDataLoading(false);
      } else {
        isprotectionDataLoading(false);
        ToastWidget.errorToast(error: "Faild to load data");
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
      ToastWidget.errorToast(error: e.toString());
      throw Exception("Faild to make api the request : $e");
    }
  }
}
