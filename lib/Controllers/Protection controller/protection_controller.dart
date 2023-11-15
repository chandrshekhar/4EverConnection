import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/Models/protection_local_model.dart';
import 'package:forever_connection/Models/protection_profile.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/shared_pref_services.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';

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
  ProtectionProfileModel relationshipData = ProtectionProfileModel();
  RxList<LocalModel> protectionLocalModel = <LocalModel>[].obs;

  updateProtectController(
      {String? policyNumber,
      String? policyType,
      String? companyPhone,
      String? issueDate,
      String? companyName,
      String? currentDeathBenefit,
      String? currentPremiums}) {
    print(policyNumber);
    policeNumberController.value.text = policyNumber ?? "";
    policyTypeController.value.text = policyType ?? "";
    issueDateController.value.text = issueDate ?? "";
    companyPhoneController.value.text = companyPhone ?? "";
    companynameController.value.text = companyName ?? "";
    deathBenefitController.value.text = currentDeathBenefit ?? "";
    premimusController.value.text = currentPremiums ?? "";
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
        final data = ProtectionProfileModel.fromJson(response.data);
        protectionLocalModel.clear();
        if (data.carInsurance != null) {
          for (int i = 0; i < data.carInsurance!.length; i++) {
            protectionLocalModel.add(LocalModel(
                id: data.carInsurance![i].id,
                policyNumber: data.carInsurance![i].policyNumber,
                policyType: "",
                issueDate: data.carInsurance![i].issueDate,
                companyName: data.carInsurance![i].companyName,
                companyPhone: data.carInsurance![i].companyPhone,
                currentDeathBenefit: "",
                currentPremiums: data.carInsurance![i].monthlyPremium,
                protectionType: "Car Insurance"));
            // LocalModel.fromJson(jsonDecode(data.carInsurance[i]));
          }
        }
        if (data.homeInsurance != null) {
          for (int i = 0; i < data.homeInsurance!.length; i++) {
            protectionLocalModel.add(LocalModel(
                id: data.homeInsurance![i].id,
                policyNumber: data.homeInsurance![i].policyNumber,
                policyType: "",
                issueDate: data.homeInsurance![i].issueDate,
                companyName: data.homeInsurance![i].companyName,
                companyPhone: data.homeInsurance![i].companyPhone,
                currentDeathBenefit: "",
                currentPremiums: data.homeInsurance![i].annualPremium,
                protectionType: "Home Insurance"));
            // LocalModel.fromJson(jsonDecode(data.carInsurance[i]));
          }
        }
        if (data.longTermCareInsurance != null) {
          for (int i = 0; i < data.longTermCareInsurance!.length; i++) {
            protectionLocalModel.add(LocalModel(
                id: data.longTermCareInsurance![i].id,
                policyNumber: data.longTermCareInsurance![i].policyNumber,
                policyType: "",
                issueDate: data.longTermCareInsurance![i].issueDate,
                companyName: data.longTermCareInsurance![i].companyName,
                companyPhone: data.longTermCareInsurance![i].companyPhone,
                currentDeathBenefit: "",
                currentPremiums: data.longTermCareInsurance![i].currentPremiums,
                protectionType: "Long Time Car Insurance"));
            // LocalModel.fromJson(jsonDecode(data.carInsurance[i]));
          }
        }
        if (data.disabilityInsurance != null) {
          for (int i = 0; i < data.disabilityInsurance!.length; i++) {
            protectionLocalModel.add(LocalModel(
                id: data.disabilityInsurance![i].id,
                policyNumber: data.disabilityInsurance![i].policyNumber,
                policyType: "",
                issueDate: data.disabilityInsurance![i].issueDate,
                companyName: data.disabilityInsurance![i].companyName,
                companyPhone: data.disabilityInsurance![i].companyPhone,
                currentDeathBenefit: "",
                currentPremiums: data.disabilityInsurance![i].currentPremiums,
                protectionType: "Disability Insurance"));
            // LocalModel.fromJson(jsonDecode(data.carInsurance[i]));
          }
        }
        if (data.lifeInsurance != null) {
          for (int i = 0; i < data.lifeInsurance!.length; i++) {
            protectionLocalModel.add(LocalModel(
                id: data.lifeInsurance![i].id,
                policyNumber: data.lifeInsurance![i].policyNumber,
                policyType: "",
                issueDate: data.lifeInsurance![i].issueDate,
                companyName: data.lifeInsurance![i].companyName,
                companyPhone: data.lifeInsurance![i].companyPhone,
                currentDeathBenefit: "",
                currentPremiums: data.lifeInsurance![i].currentPremiums,
                protectionType: "Life Insurance"));
            // LocalModel.fromJson(jsonDecode(data.carInsurance[i]));
          }
        }
        if (data.healthInsurance != null) {
          for (int i = 0; i < data.healthInsurance!.length; i++) {
            protectionLocalModel.add(LocalModel(
                id: data.healthInsurance![i].id,
                policyNumber: data.healthInsurance![i].policyNumber,
                policyType: "",
                issueDate: data.healthInsurance![i].issueDate,
                companyName: data.healthInsurance![i].companyName,
                companyPhone: data.healthInsurance![i].companyPhone,
                currentDeathBenefit: "",
                currentPremiums: data.healthInsurance![i].monthlyPremium,
                protectionType: "Life Insurance"));
            // LocalModel.fromJson(jsonDecode(data.carInsurance[i]));
          }
        }

        log(protectionLocalModel.toString());
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
