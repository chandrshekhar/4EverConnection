import 'package:flutter/material.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Model/partner_model_list.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Model/request_service_model.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Model/slot_model.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Reppository/service_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestServiceController extends GetxController {
  var selectDateController = TextEditingController().obs;
  var selectedDate = DateTime.now().obs;
  final ServiceRepository _serviceRepository = ServiceRepository();
  RxList<ServiceListModel> listOfServices = <ServiceListModel>[].obs;
  RxList<PartnerModelList> partnerList = <PartnerModelList>[].obs;
  RxString selectedValue = "In person".obs;
  RxBool isPartnerLoading = false.obs;
  RxInt partnerId = (-1).obs;
  RxList<SlotModelList> usedSlotList = <SlotModelList>[].obs;
  RxInt activeIndex = (-1).obs;
  RxBool colorNeedToChange = false.obs;
  RxList<int> listOfTimeSlot = <int>[].obs;
  RxInt serviceNeedId = (-1).obs;
  RxString selectSlot = "".obs;


  setServiceId(int id){
    serviceNeedId.value=id;
  }

   selectSlots(String id){
    selectSlot.value=id;
  }

  setLocalListToEmpty() {
    listOfTimeSlot.value = listOfRawData;
  }

  setColorChange(bool isChecked) {
    colorNeedToChange(isChecked);
  }

  changeIndex(int index) {
    activeIndex.value = index;
  }

  setPartnerId(value) {
    partnerId.value = value;
  }

  toggleBetweenRdioButton(value) {
    selectedValue.value = value;
  }

  getUsedSlotList(int partnerId) async {
    try {
      var res = await _serviceRepository.getUsedSlotList(
          date: selectDateController.value.text.toString(),
          partnerId: partnerId);
      if (res.isNotEmpty) {
        usedSlotList.value = res;
      } else {
        usedSlotList.value = [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getServiceProfssional() async {
    try {
      var res = await _serviceRepository.getSelectedProfession();
      if (res.isNotEmpty) {
        listOfServices.value = res;
      } else {
        listOfServices.value = [];
      }
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
    }
  }

  getPartnerByServiceId(int serviceId) async {
    try {
      isPartnerLoading(true);
      var res =
          await _serviceRepository.getPartnerByServiceId(serviceId: serviceId);
      if (res.isNotEmpty) {
        partnerList.value = res;
        isPartnerLoading(false);
      } else {
        partnerList.value = [];
        isPartnerLoading(false);
      }
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
      isPartnerLoading(false);
    }
  }

  //pic date and time
  Future<void> selectDate(BuildContext context) async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1700),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate.value = pickedDate;
      selectDateController.value.text = convertAndFormatDate(pickedDate);
    }
  }

  //format date time as per requirement
  String convertAndFormatDate(DateTime inputDate) {
    // final originalFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS-HH:mm");
    // final parsedDate = originalFormat.parse(inputDate);
    final outputFormat = DateFormat("yyyy-MM-dd");
    return outputFormat.format(inputDate);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getServiceProfssional();
  }

  //get slot static after 30 min delay
  List<int> listOfRawData = <int>[
    0700,
    0730,
    0800,
    0830,
    0900,
    0930,
    1000,
    1030,
    1100,
    1130,
    1200,
    1230,
    1300,
    1330,
    1400,
    1430,
    1500,
    1530,
    1600,
    1630,
    1700,
    1730,
    1800,
    1830,
    1900,
    1930,
    2000,
    2030
  ].obs;
}
