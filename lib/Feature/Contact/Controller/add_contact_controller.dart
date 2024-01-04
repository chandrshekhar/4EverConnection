import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forever_connection/Feature/Contact/Controller/contact_controller.dart';
import 'package:forever_connection/Feature/Contact/Model/contact_model.dart';
import 'package:forever_connection/core/constants/api_path.dart';
import 'package:forever_connection/core/utils/shared_pref_services.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AddContactController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var firstNameController = TextEditingController().obs;
  var middleNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var dateOfBirthController = TextEditingController().obs;
  var companyController = TextEditingController().obs;
  var postionController = TextEditingController().obs;
  var occupationController = TextEditingController().obs;
  var idealOccupationController = TextEditingController().obs;
  var mobilePhoneController = TextEditingController().obs;
  var lifePartnerName = TextEditingController().obs;
  var lifePartnerPhone = TextEditingController().obs;
  var homePhone = TextEditingController().obs;
  var personalEmail = TextEditingController().obs;
  var businessNameController = TextEditingController().obs;
  var businessEmailController = TextEditingController().obs;
  var businessFaxController = TextEditingController().obs;
  var webSiteController = TextEditingController().obs;
  var homeAddressController = TextEditingController().obs;
  var aptController = TextEditingController().obs;
  var zipController = TextEditingController().obs;
  var businessAddressController = TextEditingController().obs;
  var businessAptController = TextEditingController().obs;
  var businessZipController = TextEditingController().obs;
  RxInt contactId = (-1).obs;
  RxString networkImage = "".obs;
  setEditValue({required ContactListModel contactListModel}) {
    contactId.value = contactListModel.id ?? -1;
    firstNameController.value.text = contactListModel.firstName ?? "";
    middleNameController.value.text = contactListModel.middleName ?? "";
    lastNameController.value.text = contactListModel.lastName ?? "";
    dateOfBirthController.value.text = contactListModel.dateOfBirth ?? "";
    postionController.value.text = contactListModel.position ?? "";
    occupationController.value.text = contactListModel.currentOccupation ?? "";
    idealOccupationController.value.text =
        contactListModel.idealOccupation ?? "";
    homeAddressController.value.text = contactListModel.homeAddress ?? "";
    mobilePhoneController.value.text = contactListModel.mobilePhone ?? "";
    lifePartnerName.value.text = contactListModel.liferPartnerName ?? "";
    lifePartnerPhone.value.text = contactListModel.lifePartnerPhone ?? "";
    homePhone.value.text = contactListModel.homePhone ?? "";
    personalEmail.value.text = contactListModel.personalEmail ?? '';
    businessNameController.value.text = contactListModel.businessName ?? "";
    businessEmailController.value.text = contactListModel.businessEmail ?? "";
    businessFaxController.value.text = contactListModel.businessFax ?? "";
    webSiteController.value.text = contactListModel.businessWebsite ?? "";
    aptController.value.text = contactListModel.homeApartment ?? "";
    zipController.value.text = contactListModel.homeZipCode ?? "";
    businessAddressController.value.text =
        contactListModel.businessAddress ?? "";
    businessAptController.value.text = contactListModel.businessApartment ?? "";
    businessZipController.value.text = contactListModel.businessZipCode ?? "";
    gender.value = contactListModel.gender ?? "";
    networkImage.value = contactListModel.photo ?? "";
  }

  RxString gender = "".obs;
  RxBool isUploadingContact = false.obs;

  RxBool isContactListLoading = false.obs;
  RxList<ContactListModel> contactModelList = <ContactListModel>[].obs;

  RxBool iSExpanded = false.obs;

  RxInt openPanelIndex = (-1).obs;

  void setExpantion(int index) {
    openPanelIndex.value = index;
  }

  Dio dio = Dio();

  RxString choosenFilename = RxString("");
  Rx<File?> files = Rx<File?>(null);

  Future<void> selectDate(BuildContext context) async {
    var pickedDate = await showDatePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: selectedDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        fieldHintText: '',
        useRootNavigator: false,
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
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      dateOfBirthController.value.text = convertAndFormatDate(pickedDate);
    }
  }

  String convertAndFormatDate(DateTime inputDate) {
    // final originalFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS-HH:mm");
    // final parsedDate = originalFormat.parse(inputDate);
    final outputFormat = DateFormat("yyyy-MM-DD");
    return outputFormat.format(inputDate);
  }

  Future<void> launchMap(String address) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$address';
    final String appleMapsUrl = 'https://maps.apple.com/?q=$address';
    if (Platform.isAndroid) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else {
      await launchUrl(Uri.parse(appleMapsUrl));
    }
  }

  Future<void> getContactList({String? search}) async {
    var token = await SharedPref().getUserToken();
    try {
      isContactListLoading(true);
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };

      var response = await dio.get("${ApiPath.getContact}?search=$search");
      if (response.statusCode == 200) {
        final List<ContactListModel> data = (response.data as List)
            .map((json) => ContactListModel.fromJson(json))
            .toList();

        contactModelList.value = data;
        contactModelList
            .sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));

        isContactListLoading(false);
      } else {
        isContactListLoading(false);
        ToastWidget.errorToast(error: "Faild to load data");
        throw Exception("Faild to load data");
      }
    } catch (e) {
      if (e is DioException) {
        log(e.response!.data.toString());
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          throw Exception("No Internet connection or network error");
        } else if (e.type == DioExceptionType.badResponse) {
          throw Exception("Faild to load data");
        }
      }
      ToastWidget.errorToast(error: e.toString());
      throw Exception("Faild to make api the request : $e");
    }
  }

  Future pickImageFromGallery() async {
    try {
      final images = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (images != null) {
        final fileName = images.path.split("/").last;
        choosenFilename.value = fileName;
        files.value = File(images.path);
        networkImage.value = images.path;
      } else {
        // User canceled the picker
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        log('Failed to pick image: $e');
      }
    }
  }

  RxList<String> positionList = <String>[
    "Owner",
    "President",
    "Vice President",
    'Supervisor',
    "Manager",
    "Assistant Manager",
    "Assistant",
    "Labor",
    "Other"
  ].obs;

  void addContact() async {
    isUploadingContact(true);
    final newContact = ContactListModel();
    if (firstNameController.value.text.isNotEmpty) {
      newContact.firstName = firstNameController.value.text;
    }
    if (middleNameController.value.text.isNotEmpty) {
      newContact.middleName = middleNameController.value.text;
    }
    if (lastNameController.value.text.isNotEmpty) {
      newContact.lastName = lastNameController.value.text;
    }
    if (gender.value != "Select Gender") {
      // no gender property for contact found in flutter contacts
      newContact.gender = gender.value;
    }
    if (dateOfBirthController.value.text.isNotEmpty) {
      // no dob property for contact found in flutter contacts
      newContact.dateOfBirth = dateOfBirthController.value.text;
    }

    if (postionController.value.text.isNotEmpty) {
      newContact.position = postionController.value.text;
    }
    if (occupationController.value.text.isNotEmpty) {
      newContact.currentOccupation = occupationController.value.text;
    }
    if (idealOccupationController.value.text.isNotEmpty) {
      newContact.idealOccupation = idealOccupationController.value.text;
    }

    if (mobilePhoneController.value.text.isNotEmpty) {
      newContact.mobilePhone = mobilePhoneController.value.text;
    }

    if (lifePartnerName.value.text.isNotEmpty) {
      newContact.liferPartnerName = lifePartnerName.value.text;
      // no life parntner name property for contact found in flutter contacts
    }
    if (lifePartnerPhone.value.text.isNotEmpty) {
      newContact.lifePartnerPhone = lifePartnerPhone.value.text;
    }
    if (homePhone.value.text.isNotEmpty) {
      newContact.homePhone = homePhone.value.text;
    }
    if (personalEmail.value.text.isNotEmpty) {
      newContact.personalEmail = personalEmail.value.text;
    }
    if (businessNameController.value.text.isNotEmpty) {
      newContact.businessName = businessNameController.value.text;
    }
    if (businessEmailController.value.text.isNotEmpty) {
      newContact.businessEmail = businessEmailController.value.text;
    }
    if (businessFaxController.value.text.isNotEmpty) {
      newContact.businessFax = businessFaxController.value.text;
    }
    if (webSiteController.value.text.isNotEmpty) {
      newContact.businessWebsite = webSiteController.value.text;
    }

    if (homeAddressController.value.text.isNotEmpty) {
      newContact.homeAddress = homeAddressController.value.text;
      if (aptController.value.text.isNotEmpty) {
        newContact.homeApartment = aptController.value.text;
      }
      if (zipController.value.text.isNotEmpty) {
        newContact.homeZipCode = zipController.value.text;
      }
      if (businessAddressController.value.text.isNotEmpty) {
        newContact.businessAddress = businessAddressController.value.text;
      }
      if (businessAptController.value.text.isNotEmpty) {
        newContact.businessApartment = businessAptController.value.text;
      }
      if (businessZipController.value.text.isNotEmpty) {
        newContact.businessZipCode = businessZipController.value.text;
      }
    }

    final contactController = Get.put(ContactController());
    //  await  saveContact();
    var response = await contactController.addContact(newContact, files.value);
    if (response) {
      ToastWidget.successToast(success: "Contact added successfully!");
      clearAllControllers();
      Get.back();
    }

    isUploadingContact(false);
  }

  void editContact() async {
    isUploadingContact(true);
    final newContact = ContactListModel();

    newContact.firstName = firstNameController.value.text;

    newContact.middleName = middleNameController.value.text;

    newContact.lastName = lastNameController.value.text;

    // no gender property for contact found in flutter contacts
    newContact.gender = gender.value;

    // no dob property for contact found in flutter contacts
    newContact.dateOfBirth = dateOfBirthController.value.text;

    newContact.position = postionController.value.text;

    newContact.currentOccupation = occupationController.value.text;

    newContact.idealOccupation = idealOccupationController.value.text;

    newContact.mobilePhone = mobilePhoneController.value.text;

    newContact.liferPartnerName = lifePartnerName.value.text;
    // no life parntner name property for contact found in flutter contacts

    newContact.lifePartnerPhone = lifePartnerPhone.value.text;

    newContact.homePhone = homePhone.value.text;

    newContact.personalEmail = personalEmail.value.text;

    newContact.businessName = businessNameController.value.text;

    newContact.businessEmail = businessEmailController.value.text;

    newContact.businessFax = businessFaxController.value.text;

    newContact.businessWebsite = webSiteController.value.text;

    newContact.homeAddress = homeAddressController.value.text;

    newContact.homeApartment = aptController.value.text;

    newContact.homeZipCode = zipController.value.text;

    newContact.businessAddress = businessAddressController.value.text;

    newContact.businessApartment = businessAptController.value.text;

    newContact.businessZipCode = businessZipController.value.text;

    final contactController = Get.put(ContactController());
    //  await  saveContact();
    var response = await contactController.editContact(
        contactId.value, newContact, files.value);
    if (response) {
      ToastWidget.successToast(success: "Contact added successfully!");
      Get.back();
    }

    isUploadingContact(false);
  }

  void clearAllControllers() {
    firstNameController.value.clear();
    middleNameController.value.clear();
    lastNameController.value.clear();
    dateOfBirthController.value.clear();
    companyController.value.clear();
    postionController.value.clear();
    occupationController.value.clear();
    idealOccupationController.value.clear();
    mobilePhoneController.value.clear();
    lifePartnerName.value.clear();
    lifePartnerPhone.value.clear();
    homePhone.value.clear();
    personalEmail.value.clear();
    businessNameController.value.clear();
    businessEmailController.value.clear();
    businessFaxController.value.clear();
    webSiteController.value.clear();
    homeAddressController.value.clear();
    aptController.value.clear();
    zipController.value.clear();
    businessAddressController.value.clear();
    businessAptController.value.clear();
    businessZipController.value.clear();
    choosenFilename.value = "";
    files = Rx<File?>(null);
  }
}
