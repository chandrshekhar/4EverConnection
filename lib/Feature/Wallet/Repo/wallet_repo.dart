import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:forever_connection/Feature/Wallet/Model/earning_history_model.dart';

import '../../../core/constants/api_path.dart';
import '../../../core/utils/shared_pref_services.dart';
import '../Model/wallet_model.dart';
import '../Model/withdra_history_model.dart';
import '../Model/withdrawal_method_model.dart';

class MyWalletRepo {
  final Dio dio = Dio();

  //wallet data service
  Future<WalletModel> getWalletData() async {
    log("get wallet api hit...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(ApiPath.getWalletData);
      log("get wallet response ${response.data.toString()}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        // print(userServicesList);
        return WalletModel.fromJson(response.data);
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      log("Error while fetch get wallet api data ${e.toString()}");
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

  //withdraw method list service
  Future<List<WithdrawalMethod>> getWithdrawalMethodList() async {
    log("Get withdrawal list api hit...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(ApiPath.withdrawMethodListApi);
      log("Get withdrawal list response ${response.data.toString()}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        final List<WithdrawalMethod> withdraMethodList = (response.data as List)
            .map((json) => WithdrawalMethod.fromJson(json))
            .toList();

        // print(userServicesList);
        return withdraMethodList;
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      log("Error while fetch Get withdrawal list api data ${e.toString()}");
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

  //earning history list service
  Future<List<EarningHistoryModel>> getEarningHstoryList() async {
    log("get earning history list api hit...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(ApiPath.earningHistoryListApi);
      log("get earning history list response ${response.data.toString()}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        final List<EarningHistoryModel> earningHistoryList =
            (response.data as List)
                .map((json) => EarningHistoryModel.fromJson(json))
                .toList();

        // print(userServicesList);
        return earningHistoryList;
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      log("Error while fetch get earning history list api data ${e.toString()}");
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

  //withdraw history list
  Future<List<WithdrawReqListModel>> getWithdrawHistoryList() async {
    log("get withdraw history list api hit...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(ApiPath.withdrawHistoryListApi);
      log("get withdraw history list response ${response.data.toString()}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        final List<WithdrawReqListModel> withdrawHistoryList =
            (response.data as List)
                .map((json) => WithdrawReqListModel.fromJson(json))
                .toList();

        // print(userServicesList);
        return withdrawHistoryList;
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      log("Error while fetch get withdraw history list api data ${e.toString()}");
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
