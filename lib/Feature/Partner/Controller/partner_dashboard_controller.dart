import 'dart:developer';
import 'package:forever_connection/Feature/Partner/Model/partner_dashboard_model.dart';
import 'package:forever_connection/Feature/Partner/Model/partner_lobby_expired.dart';
import 'package:forever_connection/Feature/Partner/Model/partner_lobby_request.dart';
import 'package:forever_connection/Feature/Partner/Model/partner_request_service.dart';
import 'package:forever_connection/Feature/Partner/Repository/dashboard_repo.dart';
import 'package:get/get.dart';

class PartnerDashboardController extends GetxController {
  RxBool partnerDashboardLoading = false.obs;
  final PartnerRepo _myRepo = PartnerRepo();
  var partnerDashboarModel = PartnerDashboardModel().obs;
  var partnerDashboardLobbyRequest =
      PartnerDashboardLobbyRequestServiceModel().obs;
  var partnerDashboardLobbyExpired = PartnerDashboardLobbyExpiredModel().obs;
  var partnerDashboardLobbyConnection =
      PartnerDashboardLobbyConnectionModel().obs;
  RxBool isPartnerLoading = false.obs;
  RxBool isLobbyDataLoading = false.obs;
  getPartnerDashboard() async {
    try {
      isPartnerLoading(true);
      var res = await _myRepo.getPartnerDashboard();
      if (res.success == true) {
        log(res.toString());
        partnerDashboarModel.value = res;
        isPartnerLoading(false);
      } else {
        isPartnerLoading(false);
      }
    } catch (e) {
      isPartnerLoading(false);
    }
  }

  getPartnerLobbyServiceRequests() async {
    try {
      isLobbyDataLoading(true);
      var res = await _myRepo.getPartnerLobbyServiceRequests();
      if (res.services != null) {
        log("get reqService" + res.toString());
        partnerDashboardLobbyRequest.value.services = res.services;
        isLobbyDataLoading(false);
      } else {
        isLobbyDataLoading(false);
      }
    } catch (e) {
      isLobbyDataLoading(false);
    }
  }

  getPartnerLobbyExpired() async {
    try {
      isLobbyDataLoading(true);
      var res = await _myRepo.getPartnerLobbyExpired();
      log("get exp" + res.toString());
      if (res.services != null) {
        log(res.toString());
        partnerDashboardLobbyExpired.value.services = res.services;
        isLobbyDataLoading(false);
      } else {
        isLobbyDataLoading(false);
      }
    } catch (e) {
      isLobbyDataLoading(false);
    }
  }

  getPartnerLobbyConnections() async {
    try {
      isLobbyDataLoading(true);
      var res = await _myRepo.getPartnerLobbyConnections();
      if (res.services != null) {
        log("get connection" + res.toString());
        log(res.toString());
        partnerDashboardLobbyConnection.value.services = res.services;
        isLobbyDataLoading(false);
      } else {
        isLobbyDataLoading(false);
      }
    } catch (e) {
      isLobbyDataLoading(false);
    }
  }
}
