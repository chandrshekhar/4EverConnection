import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:forever_connection/Feature/document_vault/Documents%20Vault%20controller/documents_vault_controller.dart';
import 'package:forever_connection/Feature/document_vault/Model/document_type_model.dart';
import 'package:forever_connection/Feature/document_vault/Model/document_vault_list_model.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';

import '../../../core/utils/shared_pref_services.dart';

class DocumentRepo {
  final Dio dio = Dio();
  Future<List<DocumentTypeModel>> getSelectedProfession() async {
    log("Document type list api calling....");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(
        ApiPath.documentTypeApi,
      );

      if (response.statusCode == 200) {
        final List<DocumentTypeModel> userServicesList = (response.data as List)
            .map((json) => DocumentTypeModel.fromJson(json))
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

  Future<Map> uploadDocument(
      {required int id,
      required String desc,
      required File file,
      String? fileName}) async {
    log("Upload document vault api calling....");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer $token"
      };

      FormData formData = FormData();
      formData.fields.addAll([
        MapEntry("name", id.toString()),
        MapEntry('description', desc),
      ]);
      formData.files.add(MapEntry(
        "file",
        await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          //contentType: MediaType("images", "jpeg")),
        ),
      ));

      response = await dio.post(ApiPath.addDocumentUrl, data: formData);
      if (kDebugMode) {
        log("Uplaod document response ${response.data.toString()}");
      }
      if (response.statusCode == 201) {
        ToastWidget.successToast(success: "Successfully added");
        return response.data;
      } else {
        ToastWidget.errorToast(error: "Someting went wrong");
        return response.data;
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          ToastWidget.errorToast(error: e.toString());
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  // get documentvault list
  Future<List<DocumentVaultListModel>> getDocumentVaultList() async {
    log("Document type list api calling....");
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(
        ApiPath.documentVaultList,
      );

      if (response.statusCode == 200) {
        final List<DocumentVaultListModel> documentVaultList =
            (response.data as List)
                .map((json) => DocumentVaultListModel.fromJson(json))
                .toList();

        // print(userServicesList);
        return documentVaultList;
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

// update document desc
  Future<Map> updateDocumentDesc({int? id, String? name, String? desc}) async {
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        //'Accept': 'application/json',
        'Content-Type':
            'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW',
        'Authorization': "Bearer $token"
      };

      FormData formData = FormData();
      formData.fields.addAll([
        MapEntry("name", name.toString()),
        MapEntry('description', desc!),
      ]);
      final String url = "${ApiPath.updateDocuemntDesc}$id/";
      log("url-> $url");
      response = await dio.patch(url, data: formData);
      if (response.statusCode == 200) {
        log("url-> ${response.data.toString()}");
        return response.data;
      } else {
        throw Exception("Faild to update description");
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
          log(e.response.toString());
          throw Exception("Faild to update data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }

  // update document desc
  Future<Map> deleteDocument({int? id}) async {
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      final String url = "${ApiPath.deleteDocument}$id/";
      log("url-> $url");
      response = await dio.delete(
        url,
      );
      if (response.statusCode == 200) {
        log("url-> ${response.data.toString()}");
        return response.data;
      } else {
        throw Exception("Faild to delete document");
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
          log(e.response.toString());
          throw Exception("Faild to update data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }
}
