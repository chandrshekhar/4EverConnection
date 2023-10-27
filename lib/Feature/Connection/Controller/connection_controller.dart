import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Connection/Model/connection_model.dart';
import 'package:forever_connection/Feature/Connection/Repository/create_connection_repo.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:forever_connection/widgets/toast_widget.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectionController extends GetxController {
  ConnectionRepo _connectionRepo = ConnectionRepo();
  var firstNameController = TextEditingController().obs;
  var middleNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var personalEmailController = TextEditingController().obs;
  var businessNameController = TextEditingController().obs;
  var homeAddressController = TextEditingController().obs;
  var aptController = TextEditingController().obs;
  var zipController = TextEditingController().obs;
  var additionalController = TextEditingController().obs;
  RxInt serviceId = (-1).obs;
  RxInt partnerId = (-1).obs;
  RxList<ConnectionModel> connectionList = <ConnectionModel>[].obs;

  //connection list loading
  RxBool isLoading = false.obs;

  getConnection() async {
    try {
      isLoading(true);
      var res = await _connectionRepo.getConnection();
      connectionList.value = res;
      isLoading(false);
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
      isLoading(false);
    }
  }

  setServiceId(int id) {
    serviceId.value = id;
  }

  setPartnerId(int id) {
    partnerId.value = id;
  }

  //loading button
  RxBool isConnectionLoading = false.obs;

  addConnection() async {
    try {
      Map<String, dynamic> reqModel = {
        "service": serviceId.value,
        "preferred_partner": partnerId.value,
        "company_name": businessNameController.value.text,
        "first_name": firstNameController.value.text,
        "middle_name": middleNameController.value.text,
        "last_name": lastNameController.value.text,
        "mobile_phone": phoneController.value.text,
        "email": personalEmailController.value.text.trim(),
        "home_address": homeAddressController.value.text,
        "home_apt": aptController.value.text,
        "home_zip": zipController.value.text,
        "additional": ""
      };

      isConnectionLoading(true);
      var res = await _connectionRepo.addConnection(reqModel: reqModel);
      if (res.isNotEmpty) {
        isConnectionLoading(false);
        ToastWidget.successToast(success: "Connection added successfully");
      } else {
        isConnectionLoading(false);
        ToastWidget.errorToast(error: "Faild to add connection");
        Get.back();
      }
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
      isConnectionLoading(false);
    }
  }

  Future<void> launchEmail(String emailAddress) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    launchUrl(emailLaunchUri);
  }

  Future<void> launchPhoneDialer(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(scheme: 'tel', path: phoneNumber);

    launchUrl(phoneLaunchUri);
  }
}
