import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/User%20Profile%20Controller/user_profile_controller.dart';
import 'package:get/get.dart';

class HealthProfileController extends GetxController {
  var heightInFtController = TextEditingController().obs;
  var heightInChController = TextEditingController().obs;
  var weightLbsController = TextEditingController().obs;
  var smakerController = TextEditingController().obs;
  var doctorname = TextEditingController().obs;
  var doctorPhoneController = TextEditingController().obs;
  var dateOflastVisit = TextEditingController().obs;
  var doctorStreetController = TextEditingController().obs;
  var doctorAptController = TextEditingController().obs;
  var doctorZipController = TextEditingController().obs;
  var reasonController = TextEditingController().obs;
  var outComeController = TextEditingController().obs;
  var healthInsurranceController = TextEditingController().obs;
  var medicationController = TextEditingController().obs;
  var ageOfSibilingController = TextEditingController().obs;
  var fatherAgeController = TextEditingController().obs;
  var fatherAgeAndCause = TextEditingController().obs;
  var motherAge = TextEditingController().obs;
  var motherAgeAndCause = TextEditingController().obs;
  var otherHealthNotes = TextEditingController().obs;

  final userPersonal = Get.put(UserProfileController());

  getHealthData() {
    var healthData = userPersonal.userProfileModel.value.healthData;
    heightInFtController.value.text = healthData?.heightFt ?? "";
    heightInChController.value.text = healthData?.heightInches ?? "";
    weightLbsController.value.text = healthData?.weight ?? "";
    smakerController.value.text = healthData?.smoker ?? "";
    doctorname.value.text = healthData?.doctorName ?? "";
    doctorPhoneController.value.text = healthData?.doctorPhoneNumber ?? "";
    dateOflastVisit.value.text = healthData?.dateOfLastVisit ?? "";
    doctorStreetController.value.text = healthData?.doctorStreet ?? "";
    doctorAptController.value.text = healthData?.doctorApt ?? "";
    doctorZipController.value.text = healthData?.doctorZip ?? "";
    reasonController.value.text = healthData?.reason ?? "";
    outComeController.value.text = healthData?.heightFt ?? "";
    healthInsurranceController.value.text = healthData?.healthIssues ?? "";
    medicationController.value.text = healthData?.medications ?? "";
    ageOfSibilingController.value.text = healthData?.ageOfSiblings ?? "";
    fatherAgeController.value.text = healthData?.fatherAge ?? "";
    fatherAgeAndCause.value.text = healthData?.fatherDeathCause ?? "";
    motherAge.value.text = healthData?.motherAge ?? "";
    motherAgeAndCause.value.text = healthData?.motherDeathCause ?? "";
    otherHealthNotes.value.text = healthData?.otherHealthNotes ?? "";
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getHealthData();
    super.onInit();
  }
}
