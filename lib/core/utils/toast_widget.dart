import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  static errorToast({required String error}) {
    return Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        msg: error,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  static successToast({required String success}) {
    return Fluttertoast.showToast(
        msg: success,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }
}
