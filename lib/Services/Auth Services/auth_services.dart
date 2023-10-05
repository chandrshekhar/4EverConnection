import 'package:dio/dio.dart';
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
    Response response;
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Conent-Type': 'application/json',
      };
      response = await dio.post(ApiPath.loginUrl, data: reqModel);
      return response.data;
    } catch (error) {
      return {'status': 1, "message": "Please check your internet connection"};
    }
  }
   Future<Map> sendEmailForForgotpassword({required Map<String, dynamic> reqModel}) async {
    Response response;
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Conent-Type': 'application/json',
      };
      response = await dio.post(ApiPath.forgotPasswordSendEmail, data: reqModel);
      return response.data;
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
      response = await dio.post(ApiPath.verifyEmailOtp, data: reqModel);
      return response.data;
    } catch (error) {
      return {'status': 1, "message": "Please check your internet connection"};
    }
  }
}
