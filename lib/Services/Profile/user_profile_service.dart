import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:forever_connection/Models/user_profile_model.dart';
import 'package:http_parser/http_parser.dart';

import '../../core/constants/api_path.dart';
import '../../core/utils/shared_pref_services.dart';

class UserProfileService {
  Dio dio = Dio();
  Future<UserProfileModel> getUserProfile() async {
    Response response;
    var token = await SharedPref().getUserToken();

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

  Future<Map<String, dynamic>> getUserProfileDetails(String url) async {
    Response response;
    var token = await SharedPref().getUserToken();
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
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          log(e.response!.data);
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  Future<Map<String, dynamic>> getMagicLink(
      {required String navigateTo}) async {
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      Map<String, dynamic> reqModel = {"navigate_to": navigateTo};
      response = await dio.post(ApiPath.magicLink, data: reqModel);
      if (response.statusCode == 200) {
        log("User data -- ${response.data}");
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
          log(e.response!.data);
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  Future<Map> uploadContacts(
      Map<String, dynamic> requestModel, File? file) async {
    Response response;
    var token = await SharedPref().getUserToken();
    //log("token is $token");
    //log(requestModel.toString());
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer $token"
      };
      FormData formData = FormData.fromMap(requestModel);

      // FormData formData = FormData();
      // formData.fields.addAll([
      //   MapEntry("first_name", "gaurav"),
      //   MapEntry('last_name', "desc"),
      //   MapEntry('mobile_phone', "435345345"),
      // ]);

      if (file != null) {
        formData.files.add(
          MapEntry(
            "photo",
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split("/").last,
              // contact.photo!,

              contentType: MediaType("images", "jpeg"),

              //contentType: MediaType("images", "jpeg")),
            ),
          ),
        );
      } else {
        log("no photo");
      }
      //log("form data--> ${formData.fields}");

      response = await dio.post(ApiPath.uploadContacts, data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("response after contact upload -- ${response.data}");

        return response.data;
      } else {
        throw Exception("Faild to upload data");
      }
    } catch (e) {
      log("Faild to upload contact ${e.toString()}");
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          log(e.response.toString());
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  Future<Map> editContact(
      int contactId, Map<String, dynamic> requestModel, File? file) async {
    Response response;
    var token = await SharedPref().getUserToken();
    //log("token is $token");
    //log(requestModel.toString());
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer $token"
      };
      FormData formData = FormData.fromMap(requestModel);

      // FormData formData = FormData();
      // formData.fields.addAll([
      //   MapEntry("first_name", "gaurav"),
      //   MapEntry('last_name', "desc"),
      //   MapEntry('mobile_phone', "435345345"),
      // ]);

      if (file != null) {
        formData.files.add(
          MapEntry(
            "photo",
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split("/").last,
              // contact.photo!,

              contentType: MediaType("images", "jpeg"),

              //contentType: MediaType("images", "jpeg")),
            ),
          ),
        );
      } else {
        log("no photo");
      }
      //log("form data--> ${formData.fields}");

      response = await dio.put(
          "https://4everconnection.com/api/user-contacts/$contactId/",
          data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("response after contact edit -- ${response.data}");

        return response.data;
      } else {
        throw Exception("Faild to upload data");
      }
    } catch (e) {
      log("Faild to upload contact ${e.toString()}");
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          log(e.response.toString());
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }
}
