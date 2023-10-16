import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TostWidget {
  errorToast({String? title, String? message}) {
    return Get.snackbar(title ?? "Invalid!", message ?? "",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(left: 40, right: 40, bottom: 30));
  }

  successToast({String? title, String? message}) {
    return Get.snackbar(title ?? "Success", message ?? "",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(left: 40, right: 40, bottom: 20));
  }
}
