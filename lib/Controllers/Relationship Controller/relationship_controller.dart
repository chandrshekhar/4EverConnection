import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/Models/relationship_model.dart';
import 'package:forever_connection/Services/Profile/user_profile_service.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/shared_pref_services.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';

class RelationShipController extends GetxController {
  final relationshipsvaController = TextEditingController().obs;
  final firstNameController = TextEditingController().obs;
  final middlenameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final homephoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final homeaddressController = TextEditingController().obs;
  final aptsteContoller = TextEditingController().obs;
  final zipController = TextEditingController().obs;
  final dateOfBirthController = TextEditingController().obs;
  final socielsecurityNumber = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final birthcountryController = TextEditingController().obs;
  final birthcitizencountryController = TextEditingController().obs;
  final businessnameController = TextEditingController().obs;
  final businessphoneController = TextEditingController().obs;
  final businessfaxController = TextEditingController().obs;
  final businessemailController = TextEditingController().obs;
  final businesswebsitecontroller = TextEditingController().obs;
  final businessPositionController = TextEditingController().obs;
  final myidealController = TextEditingController().obs;
  final educationlevelcontroller = TextEditingController().obs;
  final degreeController = TextEditingController().obs;
  final affiliationsController = TextEditingController().obs;
  final businessAddressaddressController = TextEditingController().obs;
  final businessaptsteoneController = TextEditingController().obs;
  final businessziponeController = TextEditingController().obs;

  updateControllerValue({RelationshipModel? relationshipModel}) {
    firstNameController.value.text =
        relationshipModel?.personalData?.firstName ?? "";
    middlenameController.value.text =
        relationshipModel?.personalData?.middleName ?? "";
    lastNameController.value.text =
        relationshipModel?.personalData?.lastName ?? "";
    phoneController.value.text =
        relationshipModel?.personalData?.mobilePhone ?? "";
    homephoneController.value.text =
        relationshipModel?.personalData?.homePhone ?? "";
    emailController.value.text =
        relationshipModel?.personalData?.personalEmail ?? "";
    homeaddressController.value.text =
        relationshipModel?.personalData?.homeAddress ?? "";
    aptsteContoller.value.text = relationshipModel?.personalData?.homeApt ?? "";
    zipController.value.text = relationshipModel?.personalData?.homeZip ?? "";
    dateOfBirthController.value.text =
        relationshipModel?.personalData?.dateOfBirth ?? "";
    socielsecurityNumber.value.text =
        relationshipModel?.personalData?.socialSecurityNumber ?? "";
    birthcountryController.value.text =
        relationshipModel?.personalData?.countryOfBirth ?? "";
    birthcitizencountryController.value.text =
        relationshipModel?.personalData?.countryOfCitizenship ?? "";
    businessnameController.value.text =
        relationshipModel?.professionalData?.businessName ?? "";
    businessphoneController.value.text =
        relationshipModel?.professionalData?.businessPhone ?? "";
    businessfaxController.value.text =
        relationshipModel?.professionalData?.businessFax ?? "";
    businessemailController.value.text =
        relationshipModel?.professionalData?.businessEmail ?? "";
    businesswebsitecontroller.value.text =
        relationshipModel?.professionalData?.businessWebsite ?? "";
    businessPositionController.value.text =
        relationshipModel?.professionalData?.position ?? "";
    myidealController.value.text =
        relationshipModel?.professionalData?.idealOccupation ?? "";
    educationlevelcontroller.value.text =
        relationshipModel?.professionalData?.educationLevel ?? "";
    degreeController.value.text =
        relationshipModel?.professionalData?.degree ?? "";
    affiliationsController.value.text =
        relationshipModel?.professionalData?.affiliations ?? "";
    businessAddressaddressController.value.text =
        relationshipModel?.professionalData?.businessAddress ?? "";
    businessaptsteoneController.value.text =
        relationshipModel?.professionalData?.businessApt ?? "";
    businessziponeController.value.text =
        relationshipModel?.professionalData?.businessZip ?? "";
  }

  RxString radioGroup = "Male".obs;

  UserProfileService userProfileService = UserProfileService();

  Dio dio = Dio();

  RxString radioGroupLanguage = "Yes".obs;
  RxBool isLoadingRelationshipData = false.obs;
  RxList<RelationshipModel> relationshipData = <RelationshipModel>[].obs;

  void selectGender(String selectedvalue) {
    radioGroup.value = selectedvalue;
  }

  Future<void> getUserRelationshipData() async {
    var token = await SharedPref().getUserToken();
    try {
      isLoadingRelationshipData(true);
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      var response = await dio.get(ApiPath.relationship);
      log("response ${response.data}");
      if (response.statusCode == 200) {
        final List<RelationshipModel> data = (response.data as List)
            .map((json) => RelationshipModel.fromJson(json))
            .toList();
        relationshipData.value = data;
        isLoadingRelationshipData(false);
      } else {
        isLoadingRelationshipData(false);
        ToastWidget.errorToast(error: "Faild to load data");
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
      ToastWidget.errorToast(error: e.toString());
      throw Exception("Faild to make api the request : $e");
    }
  }
}
