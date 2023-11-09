import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Connection/Model/connection_model.dart';
import 'package:forever_connection/Feature/Connection/Repository/create_connection_repo.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
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
  RxList<ConnectionModel> acceptedConnectionList = <ConnectionModel>[].obs;
  RxList<ConnectionModel> pendingConnectionList = <ConnectionModel>[].obs;
  var searchServiceController = TextEditingController().obs;
  var searchPartnerController = TextEditingController().obs;

  //connection list loading
  RxBool isLoading = false.obs;

  getConnection() async {
    try {
      isLoading(true);
      var res = await _connectionRepo.getConnection();
      connectionList.value = res;
      acceptedConnectionList.value = [];
      pendingConnectionList.value = [];
      for (int i = 0; i < connectionList.length; i++) {
        if (connectionList[i].accepted == true) {
          acceptedConnectionList.add(connectionList[i]);
        } else {
          pendingConnectionList.add(connectionList[i]);
        }
      }
      acceptedConnectionList
          .sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
      pendingConnectionList
          .sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));

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

  addConnection(BuildContext context) async {
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

      print("req mod-->$reqModel");
      isConnectionLoading(true);
      var res = await _connectionRepo.addConnection(reqModel: reqModel);
      if (res.isNotEmpty) {
        isConnectionLoading(false);
        ToastWidget.successToast(success: "Connection added successfully");
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
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

  resedConnection(int id) async {
    try {
      var res = await _connectionRepo.resendConnectionRequest(id: id);
    } catch (e) {}
  }

  Future<void> launchEmail(String emailAddress) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    launchUrl(emailLaunchUri);
  }

  Future<void> launchPhoneDialer(String phoneNumber) async {
    try {
      final Uri phoneLaunchUri = Uri(scheme: 'tel', path: phoneNumber);

      // String url = Platform.isIOS ? 'tel://$phoneNumber' : 'tel:$phoneNumber';

      launchUrl(phoneLaunchUri);
      // launchUrl(Uri.parse(url));
    } catch (e) {
      log(e.toString());
    }
  }

  clearAllField() {
    serviceId(-1);
    partnerId(-1);
    searchPartnerController.value.clear();
    searchServiceController.value.clear();
    firstNameController.value.clear();
    middleNameController.value.clear();
    lastNameController.value.clear();
    phoneController.value.clear();
    personalEmailController.value.clear();
    businessNameController.value.clear();
    homeAddressController.value.clear();
    aptController.value.clear();
    zipController.value.clear();
  }
}
