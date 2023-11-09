import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:forever_connection/Feature/Connection/Model/connection_model.dart';
import 'package:forever_connection/core/utils/shared_pref_services.dart';

import '../../../core/constants/api_path.dart';

class ConnectionRepo {
  final Dio dio = Dio();
  Future<Map> addConnection({required Map<String, dynamic> reqModel}) async {
    log("Add connection service running...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      log(reqModel.toString());
      response = await dio.post(ApiPath.addConnection, data: reqModel);
      log("Add connection response ${response.data}");
      log("response ${response.statusCode}");

      if (response.statusCode == 201) {
        // print(userServicesList);
        return response.data;
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          print("error-> ${e.response}");
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          print("error2-> ${e.response!.data['error']}");
          throw Exception(e.response!.data['error']);
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  Future<List<ConnectionModel>> getConnection({String? searchText}) async {
    log("List connection service running...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      String urlWithSearch =
          "https://4everconnection.com/api/notes/?q=$searchText";
      String url = ApiPath.listConnection;
      response = await dio.get(searchText != null ? urlWithSearch : url);
      log("List notes response ${response.data}");
      if (response.statusCode == 200) {
        final List<ConnectionModel> userNotesLits = (response.data as List)
            .map((json) => ConnectionModel.fromJson(json))
            .toList();
        return userNotesLits;
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      log(e.toString());
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

  Future<Map> resendConnectionRequest({required int id}) async {
    log("Resend connection service running...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.post("${ApiPath.resendRequest}/$id/");

      if (response.statusCode == 200) {
        return response.data;
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
}
