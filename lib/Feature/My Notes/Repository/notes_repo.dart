import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:forever_connection/Feature/My%20Notes/Model/my_notes_model.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/shared_pref_services.dart';

class MyNotesRepo {
  final Dio dio = Dio();
  Future<Map> addNotes({required Map<String, dynamic> reqModel}) async {
    log("Add notes service running...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      response = await dio.post(ApiPath.addNotesUrl, data: reqModel);
      log("Add notes response ${response.data}");

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
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          log("data ${e}");
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  Future<List<MyNotesModel>> getNotes() async {
    log("List notes service running...");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      response = await dio.get(ApiPath.myNotesList);
      log("List notes response ${response.data}");
      if (response.statusCode == 200) {
        final List<MyNotesModel> userNotesLits = (response.data as List)
            .map((json) => MyNotesModel.fromJson(json))
            .toList();
        return userNotesLits;
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
          log("data ${e}");
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }
}
