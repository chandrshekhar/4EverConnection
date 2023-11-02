import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController{
  var searchController = TextEditingController().obs;   
  RxString selectedString = "".obs;

  setDropdownText(String value){
    selectedString.value=value;
  }
}