import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/User/user_professional_model.dart';
import '../User Profile Controller/user_profile_controller.dart';

class ProfessionalDetailsController extends GetxController {
  final businessnameController = TextEditingController().obs;

  final businessphoneController = TextEditingController().obs;

  final businessfaxoneController = TextEditingController().obs;

  final businesswebsiteController = TextEditingController().obs;

  final businessEmailController = TextEditingController().obs;

  final positionvalueController = TextEditingController().obs;

  final idealoccupationController = TextEditingController().obs;

  final educationlevelController = TextEditingController().obs;

  final degreevalueoneController = TextEditingController().obs;

  final affiliationsvalController = TextEditingController().obs;

  final addressController = TextEditingController().obs;

  final aptsteController = TextEditingController().obs;

  final zipvalueoneController = TextEditingController().obs;

  RxBool professionalDataLoading = false.obs;
  Rx<ProfessionalDataModel> professionalDataModel = ProfessionalDataModel().obs;

  // UserProfileService userProfileService = UserProfileService();

  final userPersonal = Get.put(UserProfileController());

  void initialData() {
    var userData = userPersonal.userProfileModel.value.professionalData;
    businessnameController.value.text = userData?.businessName ?? "";
    businessphoneController.value.text = userData?.businessPhone ?? "";
    businessfaxoneController.value.text = userData?.businessFax ?? "";
    businesswebsiteController.value.text = userData?.businessWebsite ?? "";
    businessEmailController.value.text = userData?.businessEmail ?? "";
    positionvalueController.value.text = userData?.position ?? "";
    idealoccupationController.value.text = userData?.idealOccupation ?? "";
    educationlevelController.value.text = userData?.educationLevel ?? "";
    degreevalueoneController.value.text = userData?.degree ?? "";
    affiliationsvalController.value.text = userData?.affiliations ?? "";
    addressController.value.text = userData?.businessAddress ?? "";
    aptsteController.value.text = userData?.businessApt ?? "";
    zipvalueoneController.value.text = userData?.businessZip ?? "";
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
