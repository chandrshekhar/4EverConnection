import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Contact/Controller/add_contact_controller.dart';
import 'package:forever_connection/Feature/Contact/Controller/contact_controller.dart';
import 'package:forever_connection/Feature/Contact/Presentation/Widget/contact_list_card_widget2.dart';
import 'package:forever_connection/Feature/Contact/Presentation/upload_contact.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

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
    addContactController.getContactList();
    super.initState();
  }

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
            margin: EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
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
              margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 25.v))
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.v, right: 20.v),
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
                                    return ContactListCard2(
                                        author:
                                            "${addContactController.contactModelList[index].firstName} ${addContactController.contactModelList[index].lastName}",
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
                        Navigator.pushNamed(
                            context, AppRoutes.addContactScreen);
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
                    width: 10.adaptSize,
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
                            width: 5.adaptSize,
                          ),
                          Text(
                            "Upload Contacts",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.adaptSize,
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
