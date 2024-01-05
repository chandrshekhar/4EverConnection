import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/constants/api_path.dart';
import '../../../core/utils/shared_pref_services.dart';
import '../Model/wallet_model.dart';

class MyWalletRepo {
  final Dio dio = Dio();
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
}
