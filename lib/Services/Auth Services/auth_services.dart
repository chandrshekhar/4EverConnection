import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:forever_connection/core/constants/api_path.dart';

class AuthServices {
  final Dio dio = Dio();
  Future<Map> registerApi({required Map<String, dynamic> reqModel}) async {
    Response response;
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Conent-Type': 'application/json',
      };
      response = await dio.post(ApiPath.registerUrl, data: reqModel);
      return response.data;
    } catch (error) {
      return {'status': 1, "message": "Please check your internet connection"};
    }
  }

  Future<Map> loginApi({required Map<String, dynamic> reqModel}) async {
    // Response response;

    dio.options.headers = {
      'Accept': 'application/json',
      'Conent-Type': 'application/json',
    };
    var response = await dio.post(ApiPath.loginUrl, data: reqModel);
    if (kDebugMode) {
      print("response--> $response");
    }

    return response.data;
  }

  Future<Map> sendEmailForForgotpassword(
      {required Map<String, dynamic> reqModel}) async {
    Response response;
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Conent-Type': 'application/json',
      };
      debugPrint(reqModel.toString());
      response =
          await dio.post(ApiPath.forgotPasswordSendEmail, data: reqModel);
      print("pandey->${response.data}");
      if (response.statusCode == 200) {
        return {
          'status': response.statusCode,
          "message": response.data['message']
        };
      } else if (response.statusCode == 401) {
        return {
          'status': response.statusCode,
          "message": response.data['detail']
        };
      } else {
        return {
          'status': response.statusCode,
          "message": response.data['message']
        };
      }
    } catch (error) {
      return {'status': 1, "message": "Please check your internet connection"};
    }
  }

  Future<Map> verifyOtp({required Map<String, dynamic> reqModel}) async {
    Response response;
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Conent-Type': 'application/json',
      };
      response = await dio.post("", data: reqModel);
      return response.data;
    } catch (error) {
      return {'status': 1, "message": "Please check your internet connection"};
    }
  }
}
