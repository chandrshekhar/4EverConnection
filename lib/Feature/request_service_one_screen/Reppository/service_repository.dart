import 'package:dio/dio.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/shared_pref_services.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Model/partner_model_list.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Model/request_service_model.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Model/slot_model.dart';

class ServiceRepository {
  final Dio dio = Dio();
  Future<List<ServiceListModel>> getSelectedProfession() async {
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      response = await dio.get(
        ApiPath.professionalServiceList,
      );

      if (response.statusCode == 200) {
        final List<ServiceListModel> userServicesList = (response.data as List)
            .map((json) => ServiceListModel.fromJson(json))
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

  Future<List<PartnerModelList>> getPartnerByServiceId({int? serviceId}) async {
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      response = await dio.get(
        "${ApiPath.pertnerDropDownList}/$serviceId",
      );

      if (response.statusCode == 200) {
        final List<PartnerModelList> userServicesList = (response.data as List)
            .map((json) => PartnerModelList.fromJson(json))
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

  Future<List<SlotModelList>> getUsedSlotList(
      {required String date, required int partnerId}) async {
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(
        "${ApiPath.baseUrl}/api/partners/$partnerId/slots/${date}/",
      );
      print(response.data);

      if (response.statusCode == 200) {
        final List<SlotModelList> userServicesList = (response.data as List)
            .map((json) => SlotModelList.fromJson(json))
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

  Future<Map> addService({required Map<String, dynamic> reqModel}) async {
    Response response;
    var token = await SharedPref().getUserToken();
    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      response =
          await dio.post(ApiPath.professionalServiceList, data: reqModel);

      if (response.statusCode == 200) {
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
          throw Exception("Faild to load data");
        }
      }
      throw Exception("Faild to make api the request : $e");
    }
  }
}
