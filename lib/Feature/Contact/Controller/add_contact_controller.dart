import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
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
  var dateOfBirth = TextEditingController().obs;
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
  var businessEmail = TextEditingController().obs;
  var businessFax = TextEditingController().obs;
  var webSiteController = TextEditingController().obs;
  var homeAddressController = TextEditingController().obs;
  var aptController = TextEditingController().obs;
  var zipController = TextEditingController().obs;
  var businessAddressController = TextEditingController().obs;
  var businessAptController = TextEditingController().obs;
  var businessZipController = TextEditingController().obs;

  RxString gender = "Select Gender".obs;
  RxBool isUploadingContact = false.obs;

  RxBool isContactListLoading = false.obs;
  RxList<ContactListModel> contactModelList = <ContactListModel>[].obs;

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
      dateOfBirth.value.text = convertAndFormatDate(pickedDate);
    }
  }

  String convertAndFormatDate(DateTime inputDate) {
    // final originalFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS-HH:mm");
    // final parsedDate = originalFormat.parse(inputDate);
    final outputFormat = DateFormat("MM/dd/yyyy");
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
      } else {
        // User canceled the picker
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        log('Failed to pick image: $e');
      }
    }
  }

  // Future<void> saveContact() async {
  //   // Check and request permission if needed
  //   if (!(await Permission.contacts.request().isGranted)) {
  //     return;
  //   }
  //   final newContact = Contact()
  //     ..name.first = firstNameController.value.text
  //     ..name.last = lastNameController.value.text
  //     ..name.middle = middleNameController.value.text
  //     ..phones = [Phone(mobilePhoneController.value.text)];
  //   await newContact.insert();
  //   print("add contact--> $newContact");
  // }

  void addContact() async {
    final newContact = Contact();
    isUploadingContact(true);

    if (firstNameController.value.text.isNotEmpty) {
      newContact.name.first = firstNameController.value.text;
    }
    if (middleNameController.value.text.isNotEmpty) {
      newContact.name.middle = middleNameController.value.text;
    }
    if (lastNameController.value.text.isNotEmpty) {
      newContact.name.last = lastNameController.value.text;
    }
    if (gender.value != "Select Gender") {
      // no gender property for contact found in flutter contacts
    }
    if (dateOfBirth.value.text.isNotEmpty) {
      // no dob property for contact found in flutter contacts
    }

    if (companyController.value.text.isNotEmpty) {
      Organization organization = Organization();
      organization.company = companyController.value.text;

      if (postionController.value.text.isNotEmpty) {
        organization.jobDescription = postionController.value.text;
      }
      if (occupationController.value.text.isNotEmpty) {
        organization.department = occupationController.value.text;
      }
      newContact.organizations = [organization];
    }

    if (idealOccupationController.value.text.isNotEmpty) {
      // no ideal occupation property for contact found in flutter contacts
    }

    if (mobilePhoneController.value.text.isNotEmpty) {
      newContact.phones = [Phone(mobilePhoneController.value.text)];
    }

    if (lifePartnerName.value.text.isNotEmpty) {
      // no life parntner name property for contact found in flutter contacts
    }
    if (lifePartnerPhone.value.text.isNotEmpty) {
      newContact.phones.add(Phone(lifePartnerPhone.value.text));
    }
    if (homePhone.value.text.isNotEmpty) {
      newContact.phones.add(Phone(homePhone.value.text));
    }
    if (personalEmail.value.text.isNotEmpty) {
      newContact.emails = [Email(personalEmail.value.text)];
    }

    if (businessEmail.value.text.isNotEmpty) {
      newContact.emails.add(Email(businessEmail.value.text));
    }
    if (businessFax.value.text.isNotEmpty) {
      // no business fax property for contact found in flutter contacts
    }
    if (webSiteController.value.text.isNotEmpty) {
      newContact.websites = [Website(webSiteController.value.text)];
    }

    Address? address;
    if (homeAddressController.value.text.isNotEmpty) {
      address = Address(
        homeAddressController.value.text,
      );
      if (aptController.value.text.isNotEmpty) {
        address.subLocality = aptController.value.text;
      }
      if (zipController.value.text.isNotEmpty) {
        address.postalCode = zipController.value.text;
      }

      address.label = AddressLabel.home;

      newContact.addresses = [address];
    }

    if (businessNameController.value.text.isNotEmpty) {
      if (newContact.organizations.isNotEmpty) {
        newContact.organizations.add(
          Organization(
            company: businessNameController.value.text,
          ),
        );
      } else {
        newContact.organizations = [
          Organization(
            company: businessNameController.value.text,
          ),
        ];
      }
    }

    if (businessAddressController.value.text.isNotEmpty) {
      address = Address(
        businessAddressController.value.text,
      );
      if (businessAptController.value.text.isNotEmpty) {
        address.subLocality = businessAptController.value.text;
      }
      if (businessZipController.value.text.isNotEmpty) {
        address.postalCode = businessZipController.value.text;
      }

      address.label = AddressLabel.work;

      newContact.addresses.add(address);
    }

    if (choosenFilename.value.isNotEmpty) {
      newContact.photo = files.value?.readAsBytesSync();
    }
    final contactController = Get.put(ContactController());
    //  await  saveContact();
    var response =
        await contactController.uploadContactsHelper(newContact, files.value);

    if (response) {
      ToastWidget.successToast(success: "Contact added successfully!");
      clearAllControllers();
      Get.back();
    }

    isUploadingContact(false);
  }

  void clearAllControllers() {
    firstNameController.value.clear();
    middleNameController.value.clear();
    lastNameController.value.clear();
    dateOfBirth.value.clear();
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
    businessEmail.value.clear();
    businessFax.value.clear();
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
