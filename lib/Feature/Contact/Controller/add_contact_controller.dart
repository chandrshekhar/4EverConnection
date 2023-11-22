import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Contact/Model/contact_model.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/shared_pref_services.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';

class AddContactController extends GetxController {
  var firstNameController = TextEditingController().obs;
  var middleNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var dateOfBirth = TextEditingController().obs;
  var companyController = TextEditingController().obs;
  var postionController = TextEditingController().obs;
  var occupationController = TextEditingController().obs;
  var idealOccupationController = TextEditingController().obs;
  var mobilePhoneController = TextEditingController().obs;
  var lifePartnerName = TextEditingController().obs;
  var lifePartnerPhone = TextEditingController().obs;
  var homePhone = TextEditingController().obs;
  var personalEmail = TextEditingController().obs;
  var businessNameController = TextEditingController().obs;
  var businessEmail = TextEditingController().obs;
  var businessFax = TextEditingController().obs;
  var webSiteController = TextEditingController().obs;
  var homeAddressController = TextEditingController().obs;
  var aptController = TextEditingController().obs;
  var zipController = TextEditingController().obs;
  var businessAddressController = TextEditingController().obs;
  var businessAptController = TextEditingController().obs;
  var businessZipController = TextEditingController().obs;

  RxBool isprotectionDataLoading = false.obs;
  RxList<ContactListModel> contactModelList = <ContactListModel>[].obs;

  Dio dio = Dio();
  Future<void> getContactList() async {
    var token = await SharedPref().getUserToken();
    try {
      isprotectionDataLoading(true);
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      var response = await dio.get(ApiPath.getContact);
      if (response.statusCode == 200) {
        final List<ContactListModel> data = (response.data as List)
            .map((json) => ContactListModel.fromJson(json))
            .toList();

        contactModelList
            .sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));

        contactModelList.value = data;

        isprotectionDataLoading(false);
      } else {
        isprotectionDataLoading(false);
        ToastWidget.errorToast(error: "Faild to load data");
        throw Exception("Faild to load data");
      }
    } catch (e) {
      if (e is DioException) {
        log(e.response!.data.toString());
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
