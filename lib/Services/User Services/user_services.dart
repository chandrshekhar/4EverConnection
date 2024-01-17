import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:forever_connection/Feature/My%20Service/Model/user_services_model.dart';
import '../../core/constants/api_path.dart';
import '../../core/utils/shared_pref_services.dart';

class UserServices {
  final Dio dio = Dio();
  Future<List<UserServicesModel>> getUserServices() async {
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      response = await dio.get(
        ApiPath.getUserService,
      );
      if (response.statusCode == 200) {
        final List<UserServicesModel> userServicesList = (response.data as List)
            .map((json) => UserServicesModel.fromJson(json))
            .toList();

        // print(userServicesList);
        return userServicesList;
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
