import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/My%20Notes/Model/my_notes_model.dart';
import 'package:forever_connection/Feature/My%20Notes/Repository/notes_repo.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:forever_connection/widgets/toast_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyNotesController extends GetxController {
  final MyNotesRepo _myNotesRepo = MyNotesRepo();
  //Text editing controller
  var searchController = TextEditingController().obs;
  var subjectController = TextEditingController().obs;
  var notesController = TextEditingController().obs;

  //Notes list
  RxList<MyNotesModel> noteList = <MyNotesModel>[].obs;

  //valiadte flag
  RxBool isSubjectValidate = false.obs;
  RxBool isNotesValidate = false.obs;

  //loader
  RxBool isAddNoteLoading = false.obs;
  RxBool isNotesLitsLoading = false.obs;
  //clear text field
  clearTextField() {
    subjectController.value.clear();
    notesController.value.clear();
  }

  setSubjectVlidate(String value) {
    if (value.length < 4) {
      isSubjectValidate(false);
    } else {
      isSubjectValidate(true);
    }
  }

  setNotesValidate(String value) {
    if (value.length < 10) {
      isNotesValidate(false);
    } else {
      isNotesValidate(true);
    }
  }

  addNotes(BuildContext context) async {
    try {
      Map<String, dynamic> reqModel = {
        "subject": subjectController.value.text,
        "text": notesController.value.text,
      };
      isAddNoteLoading(true);
      var res = await _myNotesRepo.addNotes(reqModel: reqModel);
      if (res.isNotEmpty) {
        TostWidget().successToast(title: "Success", message: "Notes added");
        clearTextField();
        getMyNotes();
        isAddNoteLoading(false);
        Navigator.pop(context);
      } else {
        TostWidget().errorToast(title: "Error", message: "All field mandatory");
        isAddNoteLoading(false);
      }
    } catch (e) {
      log("Add notes error ${e.toString()}");
      TostWidget().errorToast(title: "Error", message: "$e");
      isAddNoteLoading(false);
    }
  }

  getMyNotes() async {
    try {
      isNotesLitsLoading(true);
      var res = await _myNotesRepo.getNotes();
      noteList.value = res;
      isNotesLitsLoading(false);
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
      isNotesLitsLoading(false);
    }
  }

  String dateTime(String originalDatetIme) {
    // Parse the original date-time string
    DateTime dateTime = DateTime.parse(originalDatetIme);

    // Create a DateFormat for the desired format
    final customFormat = DateFormat("MMM d'\'yyyy, h:m a");
    String formattedDateTime = customFormat.format(dateTime);
    return formattedDateTime;
  }
}
