import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestServiceController extends GetxController {
  var selectDateController = TextEditingController().obs;
  DateTime selectedDate = DateTime.now();
  //pic date and time
  Future<void> selectDate(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          surfaceTintColor: Colors.red,
          backgroundColor: const Color(0xFF1B608C),
          child: CalendarDatePicker(
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
            onDateChanged: (date) {
              selectDateController.value.text = convertAndFormatDate(date);
              Navigator.pop(
                  context); // Close the dialog when a date is selected
            },
          ),
        );
      },
    );
  }

  //format date time as per requirement
  String convertAndFormatDate(DateTime inputDate) {
    // final originalFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS-HH:mm");
    // final parsedDate = originalFormat.parse(inputDate);
    final outputFormat = DateFormat("yyyy-MM-dd");
    return outputFormat.format(inputDate);
  }
}
