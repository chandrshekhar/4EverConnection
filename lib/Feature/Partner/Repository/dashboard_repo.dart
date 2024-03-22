import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:forever_connection/Feature/Partner/Model/partner_dashboard_model.dart';
import 'package:forever_connection/Feature/Partner/Model/partner_lobby_expired.dart';
import 'package:forever_connection/Feature/Partner/Model/partner_lobby_request.dart';
import 'package:forever_connection/Feature/Partner/Model/partner_request_service.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/shared_pref_services.dart';

class PartnerRepo {
  //earning history list service
  final Dio dio = Dio();
  Future<PartnerDashboardModel> getPartnerDashboard() async {
    log("getPartnerDashboard list api hit...");
    Response response;
    var token = await SharedPref().getUserToken();
    log("tokkjsdfjf $token");
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(ApiPath.partnerDashboard);
      log("getPartnerDashboard history list response ${response.data.toString()}");
      if (response.statusCode == 200) {
        return PartnerDashboardModel.fromJson(response.data);
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      log("Error while fetch get getPartnerDashboard list api data ${e.toString()}");
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          log("data $e");
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  Future<PartnerDashboardLobbyRequestServiceModel>
      getPartnerLobbyServiceRequests() async {
    log("get getPartnerLobbyServiceRequests list api hit...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(ApiPath.partnerDashboardLobbyRequest);
      log("get getPartnerLobbyServiceRequests list response ${response.data.toString()}");
      if (response.statusCode == 200) {
        return PartnerDashboardLobbyRequestServiceModel.fromJson(response.data);
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      log("Error while fetch get getPartnerLobbyServiceRequests list api data ${e.toString()}");
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          log("data $e");
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  Future<PartnerDashboardLobbyConnectionModel>
      getPartnerLobbyConnections() async {
    log("get getPartnerLobbyConnections list api hit...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(ApiPath.partnerDashboardLobbyConnection);
      log("get getPartnerLobbyConnections list response ${response.data.toString()}");
      if (response.statusCode == 200) {
        return PartnerDashboardLobbyConnectionModel.fromJson(response.data);
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      log("Error while fetch get getPartnerLobbyConnections list api data ${e.toString()}");
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          log("data $e");
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  Future<PartnerDashboardLobbyExpiredModel> getPartnerLobbyExpired() async {
    log("get getPartnerLobbyExpired list api hit...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(ApiPath.partnerDashboardLobbyExpired);
      log("get getPartnerLobbyExpired list response ${response.data.toString()}");
      if (response.statusCode == 200) {
        return PartnerDashboardLobbyExpiredModel.fromJson(response.data);
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      log("Error while fetch get getPartnerLobbyExpired list api data ${e.toString()}");
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          log("data $e");
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }
}
