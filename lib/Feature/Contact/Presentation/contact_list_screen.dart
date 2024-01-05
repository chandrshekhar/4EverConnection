import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Contact/Controller/add_contact_controller.dart';
import 'package:forever_connection/Feature/Contact/Controller/contact_controller.dart';
import 'package:forever_connection/Feature/Contact/Model/contact_model.dart';
import 'package:forever_connection/Feature/Contact/Presentation/Widget/contact_list_card_widget2.dart';
import 'package:forever_connection/Feature/Contact/Presentation/add_contact.dart';
import 'package:forever_connection/Feature/Contact/Presentation/upload_contact.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/app_bar/appbar_image.dart';
import '../../../widgets/app_bar/appbar_image_1.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/custom_icon_button.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final contactController = Get.put(ContactController());

  // final noteController = Get.put(MyNotesController());

  final addContactController = Get.put(AddContactController());

  @override
  void initState() {
    addContactController.getContactList(search: "");
    super.initState();
  }

  // int _openPanelIndex = -1; // Track the index of the currently open panel

  // void _handlePanelExpansion(int index) {
  //   setState(() {
  //     if (_openPanelIndex == index) {
  //       _openPanelIndex = -1; // Close the currently open panel
  //     } else {
  //       _openPanelIndex = index; // Open the clicked panel
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        leadingWidth: 44.h,
        backgroundColor: AppColors.appBackgroundColor,
        elevation: 0.5,
        leading: AppbarImage(
            svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
            margin: EdgeInsets.only(left: 15.h, top: 22, bottom: 10),
            onTap: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Contact List"),
        actions: [
          AppbarImage1(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.notificationsScreen);
              },
              svgPath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(24.h, 14, 24.h, 25))
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20, right: 20),
          child: Column(
            children: [
              Obx(
                () => CustomTextFormField(
                    suffix: const Icon(Icons.person_search),
                    contentPadding: EdgeInsets.zero,
                    controller: contactController.searchController.value,
                    margin: EdgeInsets.only(left: 5.h, right: 5),
                    labelText: "Search contact",
                    textStyle: TextStyle(fontSize: 20.h),
                    textInputType: TextInputType.name,
                    onChange: (value) {
                      EasyDebounce.debounce(
                          'contact-debounce', // <-- An ID for this particular debouncer
                          const Duration(
                              milliseconds: 500), // <-- The debounce duration
                          () => addContactController.getContactList(
                              search: value) // <-- The target method
                          );
                    },
                    obscureText: false),
              ),
              Expanded(
                  child: Obx(() =>
                      addContactController.isContactListLoading.value == true
                          ? const Center(
                              child: CircularProgressIndicator.adaptive())
                          : addContactController.contactModelList.isNotEmpty
                              ? ListView.builder(
                                  padding: EdgeInsets.only(top: 20.h),
                                  itemCount: addContactController
                                      .contactModelList.length,
                                  itemBuilder: (context, index) {
                                    String lastName = "";

// Check if the last name is "NA" and display an empty string if true
                                    if (addContactController
                                            .contactModelList[index].lastName ==
                                        "NA") {
                                      lastName = "";
                                    } else {
                                      lastName = addContactController
                                          .contactModelList[index].lastName!;
                                    }

                                    return ContactListCard2(
                                        editIconClick: () {
                                          addContactController.setEditValue(
                                              contactListModel:
                                                  addContactController
                                                      .contactModelList[index]);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const AddContactScreen(
                                                        isCommingFromEdit: true,
                                                      )));
                                        },
                                        author:
                                            "${addContactController.contactModelList[index].firstName} $lastName",
                                        photo: addContactController
                                                .contactModelList[index]
                                                .photo ??
                                            "",
                                        phoneNumber: addContactController
                                                .contactModelList[index]
                                                .mobilePhone ??
                                            "",
                                        email: addContactController
                                                .contactModelList[index]
                                                .personalEmail ??
                                            "",
                                        go: "",
                                        goPress: () {
                                          addContactController.launchMap(
                                              addContactController
                                                      .contactModelList[index]
                                                      .homeAddress ??
                                                  "");
                                        },
                                        connect: "");

                                    // return ContactListCard2(
                                    //   author:
                                    //       "${addContactController.contactModelList[index].firstName}",
                                    //   dateTime: noteController.dateTime(
                                    //       addContactController
                                    //               .contactModelList[index]
                                    //               .dateCreated ??
                                    //           ""),
                                    //   description: addContactController
                                    //           .contactModelList[index]
                                    //           .currentOccupation ??
                                    //       "NA",
                                    //   notesTitle: addContactController
                                    //           .contactModelList[index]
                                    //           .mobilePhone ??
                                    //       "NA",
                                    //   onSeleted: (p0) {},
                                    // );
                                  },
                                )
                              : const Center(
                                  child: Text("No contact"),
                                ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomIconButton(
                      onTap: () {
                        addContactController.setEditValue(
                            contactListModel: ContactListModel());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AddContactScreen(
                                      isCommingFromEdit: false,
                                    )));
                      },
                      decoration: BoxDecoration(
                          color: const Color(0xffD3991B),
                          borderRadius: BorderRadius.circular(3)),
                      height: 48.h,
                      padding: const EdgeInsets.only(
                          left: 20, right: 10, top: 10, bottom: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            "Add Contact",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: CustomIconButton(
                      onTap: () {
                        // contactController.getContactFromPhone();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyContactsScreen()));
                      },
                      decoration: BoxDecoration(
                          color: const Color(0xffD3991B),
                          borderRadius: BorderRadius.circular(3)),
                      height: 48.h,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.upload,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Upload Contacts",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h)
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(
    {required BuildContext context,
    required ContactListModel connectionModel}) {
  showModalBottomSheet(
    useSafeArea: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp), topRight: Radius.circular(15.sp))),
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _bottomSheetWidget(
                  lableName: "Created Date",
                  value: DateFormat("yyyy-MM-dd").format(
                      DateTime.parse(connectionModel.dateCreated ?? ""))),
              _bottomSheetWidget(
                  lableName: "First Name",
                  value: connectionModel.firstName ?? ""),
              _bottomSheetWidget(
                  lableName: "Middle Name",
                  value: connectionModel.middleName ?? ""),
              _bottomSheetWidget(
                  lableName: "Last Name",
                  value: connectionModel.lastName ?? ""),
              _bottomSheetWidget(
                  lableName: "Mobile Phone",
                  value: connectionModel.mobilePhone ?? ""),
              _bottomSheetWidget(
                  lableName: "Email",
                  value: connectionModel.personalEmail ?? ""),
              _bottomSheetWidget(
                  lableName: "Date of Birth",
                  value: connectionModel.dateOfBirth ?? ""),
              _bottomSheetWidget(
                  lableName: "Connection created",
                  value: connectionModel.connectionCreated ?? ""),
              _bottomSheetWidget(
                  lableName: "Gender", value: connectionModel.gender ?? ""),
              _bottomSheetWidget(
                  lableName: "Home Address",
                  value: connectionModel.homeAddress ?? ""),
              _bottomSheetWidget(
                  lableName: "Apt", value: connectionModel.homeApartment ?? ""),
              _bottomSheetWidget(
                  lableName: "ZIP", value: connectionModel.homeZipCode ?? ""),
              _bottomSheetWidget(
                  lableName: "Position", value: connectionModel.position ?? ""),
              _bottomSheetWidget(
                  lableName: "Current Occupation",
                  value: connectionModel.currentOccupation ?? ""),
              _bottomSheetWidget(
                  lableName: "Ideal Occupation",
                  value: connectionModel.idealOccupation ?? ""),
              _bottomSheetWidget(
                  lableName: "Life Partner Name",
                  value: connectionModel.liferPartnerName ?? ""),
              _bottomSheetWidget(
                  lableName: "Life Partner Phone",
                  value: connectionModel.lifePartnerPhone ?? ""),
              _bottomSheetWidget(
                  lableName: "Business Name",
                  value: connectionModel.businessName ?? ""),
              _bottomSheetWidget(
                  lableName: "Business Email",
                  value: connectionModel.businessEmail ?? ""),
              _bottomSheetWidget(
                  lableName: "Business Fax",
                  value: connectionModel.businessFax ?? ""),
              _bottomSheetWidget(
                  lableName: "Website",
                  value: connectionModel.businessWebsite ?? ""),
              _bottomSheetWidget(
                  lableName: "Business Address",
                  value: connectionModel.businessAddress ?? ""),
              _bottomSheetWidget(
                  lableName: "Business Apt",
                  value: connectionModel.businessApartment ?? ""),
              _bottomSheetWidget(
                  lableName: "Business Zip",
                  value: connectionModel.businessZipCode ?? ""),
              _bottomSheetWidget(
                  lableName: "Additional Information",
                  value: connectionModel.additional ?? ""),
            ],
          ),
        ),
      );
    },
  );
}

_bottomSheetWidget({
  required String lableName,
  required String value,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        lableName,
        style: TextStyle(
            color: AppColors.floatingActionButtonColor,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp),
      ),
      SizedBox(
        height: 5.h,
      ),
      Container(
        height: lableName.contains("Additional Information") ? 100 : 48,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: AppColors.greyTextColor.withOpacity(0.03),
            border: Border.all(color: AppColors.greyTextColor, width: 1)),
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.sp, top: 18.sp),
              child: Text(
                value,
              ),
            )),
      ),
      SizedBox(
        height: 10.h,
      ),
    ],
  );
}
