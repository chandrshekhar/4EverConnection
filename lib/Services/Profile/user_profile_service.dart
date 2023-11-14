import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:forever_connection/Model/User/user_personal_data_model.dart';
import 'package:forever_connection/Models/user_profile_model.dart';

import '../../core/constants/api_path.dart';
import '../../core/utils/shared_pref_services.dart';

class UserProfileService {
  Dio dio = Dio();
  Future<UserProfileModel> getUserProfile() async {
    Response response;
    var token = await SharedPref().getUserToken();
    print(token);
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      response = await dio.get(
        ApiPath.getUserProfile,
      );
      if (response.statusCode == 200) {
        log("User data -- ${response.data}");
        final userServicesList = UserProfileModel.fromJson(response.data);

        // print(userServicesList);
        return userServicesList;
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      print(e.toString());
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

  Future<Map<String, dynamic>> getUserProfileDetails(String url) async {
    Response response;
    var token = await SharedPref().getUserToken();
    print(url);
    print(token);
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      response = await dio.get(url);
      if (response.statusCode == 200) {
        log("User data -- ${response.data}");
        return response.data;
      } else {
        throw Exception("Faild to load data");
      }
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          print(e.response!.data);
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }
}
