import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Model/partner_model_list.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Model/request_service_model.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Model/slot_model.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Reppository/service_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestServiceController extends GetxController {
  var selectDateController = TextEditingController().obs;
  var commentController = TextEditingController().obs;
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
  var serviceSearchController = TextEditingController().obs;
  var partnerSearchController = TextEditingController().obs;

  //Screen loader for service
  RxBool isAddServiceLoading = false.obs;

  setServiceId(int id) {
    serviceNeedId.value = id;
  }

  selectSlots(String id) {
    selectSlot.value = id;
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

  getUsedSlotList() async {
    try {
      var res = await _serviceRepository.getUsedSlotList(
          date: selectDateController.value.text.toString(),
          partnerId: partnerId.value);
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
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: selectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(3000),
        fieldHintText: '',
        builder: ((context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                datePickerTheme: const DatePickerThemeData(
                  dayStyle: TextStyle(fontSize: 20),
                  headerHeadlineStyle: TextStyle(fontSize: 20),
                  headerHelpStyle: TextStyle(fontSize: 20),
                  weekdayStyle: TextStyle(fontSize: 20),
                ),
              ),
              child: child!);
        }));
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate.value = pickedDate;
      selectDateController.value.text = convertAndFormatDate(pickedDate);
      await getUsedSlotList();
      setLocalListToEmpty();
    }
  }

  //format date time as per requirement
  String convertAndFormatDate(DateTime inputDate) {
    // final originalFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS-HH:mm");
    // final parsedDate = originalFormat.parse(inputDate);
    final outputFormat = DateFormat("yyyy-MM-dd");
    return outputFormat.format(inputDate);
  }

  addServiceRequest(BuildContext context) async {
    try {
      Map<String, dynamic> reqModel = {
        "partner_assigned": partnerId.value,
        "service": serviceNeedId.value,
        "contact_type": selectedValue.value.toString(),
        "action_scheduled_on":
            "${selectDateController.value.text} ${selectSlot.value.toString().substring(0, 2)}:${selectSlot.value.toString().substring(2)}"
      };

      isAddServiceLoading(true);
      var res = await _serviceRepository.addService(reqModel: reqModel);
      if (res.isNotEmpty) {
        ToastWidget.successToast(success: "Service successfully added");
        isAddServiceLoading(false);
        Navigator.pushReplacementNamed(context, AppRoutes.dashboardScreen);
      } else {
        ToastWidget.errorToast(error: "Faild to added service!");
        isAddServiceLoading(false);
      }
    } catch (e) {
      isAddServiceLoading(false);
      ToastWidget.errorToast(error: e.toString());
    }
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
