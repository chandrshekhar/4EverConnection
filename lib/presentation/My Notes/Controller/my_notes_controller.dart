import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:forever_connection/presentation/My%20Notes/Repository/add_notes_repo.dart';
import 'package:forever_connection/widgets/toast_widget.dart';
import 'package:get/get.dart';

class MyNotesController extends GetxController {
  final MyNotesRepo _myNotesRepo = MyNotesRepo();
  //Text editing controller
  var searchController = TextEditingController().obs;
  var subjectController = TextEditingController().obs;
  var notesController = TextEditingController().obs;

  //valiadte flag
  RxBool isSubjectValidate = false.obs;
  RxBool isNotesValidate = false.obs;

  //loader
  RxBool isAddNoteLoading = false.obs;

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
        Navigator.pop(context);
        isAddNoteLoading(false);
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
}
