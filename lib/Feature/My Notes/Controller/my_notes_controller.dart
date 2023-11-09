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

//edit controller
  var editSubjectController = TextEditingController().obs;
  var editNotesController = TextEditingController().obs;

  //Notes list
  RxList<MyNotesModel> noteList = <MyNotesModel>[].obs;

  //My notes model for details screen show

  var myNotesModel = MyNotesModel().obs;

  //valiadte flag
  RxBool isSubjectValidate = false.obs;
  RxBool isNotesValidate = false.obs;

  //loader
  RxBool isAddNoteLoading = false.obs;
  RxBool isNotesLitsLoading = false.obs;
  RxBool isEditNotesLoading = false.obs;
  RxBool isNotesDetailsLoading = false.obs;
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

  //add new note
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
        await getMyNotes();
        isAddNoteLoading(false);

        await Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
          clearTextField();
        });
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

  //Edit the exsisting notes
  editNotes(BuildContext context, int id) async {
    try {
      Map<String, dynamic> reqModel = {
        "subject": editSubjectController.value.text,
        "text": editNotesController.value.text,
      };
      isEditNotesLoading(true);
      var res = await _myNotesRepo.editNotes(reqModel: reqModel, id: id);
      if (res.isNotEmpty) {
        TostWidget().successToast(title: "Success", message: "Notes updated");
        await getMyNotes();
        isEditNotesLoading(false);
        Navigator.pop(context);
      } else {
        TostWidget().errorToast(title: "Error", message: "All field mandatory");
        isEditNotesLoading(false);
      }
    } catch (e) {
      log("Add notes error ${e.toString()}");
      TostWidget().errorToast(title: "Error", message: "$e");
      isEditNotesLoading(false);
    }
  }

  //delete the exsisting note
  deleteNotes(int id) async {
    try {
      await _myNotesRepo.deleteNotes(id: id);
      ToastWidget.successToast(success: "Note  deleted");
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
    }
  }

  //Get all notes list
  getMyNotes({String? searchText}) async {
    try {
      isNotesLitsLoading(true);
      var res = await _myNotesRepo.getNotes(searchText: searchText);
      noteList.value = res;
      noteList.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
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

  getNotesDetails({required int id}) async {
    try {
      isNotesDetailsLoading(true);
      var res = await _myNotesRepo.getNotesDetails(id: id);
      myNotesModel.value = res;
      isNotesDetailsLoading(false);
    } catch (e) {
      isNotesDetailsLoading(false);
      ToastWidget.errorToast(error: e.toString());
    } finally {
      isNotesDetailsLoading(false);
    }
  }
}
