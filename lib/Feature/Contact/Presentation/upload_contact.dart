import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Contact/Controller/contact_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/size_utils.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/selected_contact_item.dart';
import 'package:get/get.dart';

class MyContactsScreen extends StatefulWidget {
  const MyContactsScreen({super.key});

  @override
  State<MyContactsScreen> createState() => _MyContactsScreenState();
}

class _MyContactsScreenState extends State<MyContactsScreen>
    with SingleTickerProviderStateMixin {
  List<dynamic> selectedContect = [];
  final contactController = Get.put(ContactController());

  @override
  void initState() {
    contactController.search("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("build inside upload");
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarImage(
            svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
            margin: EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
            onTap: () {
              contactController.selectedContactList.clear();
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Contact Lists"),
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
            padding: EdgeInsets.all(20.adaptSize),
            child: Obx(
              () => contactController.isLoading.value
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Search here",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                          ),
                          onChanged: (value) {
                            contactController.search(value);
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        Padding(
                          padding: EdgeInsets.only(right: 16.adaptSize),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "Select All",
                                style: TextStyle(fontSize: 14),
                              ),
                              Obx(
                                () => Checkbox(
                                    value: contactController.markAll.value,
                                    onChanged: (val) {
                                      contactController.markAll(val);
                                      if (val ?? false) {
                                        contactController.anySelected.value =
                                            true;
                                      } else {
                                        contactController.anySelected.value =
                                            false;
                                      }
                                      //contactController.singleSelected(val);
                                    }),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: contactController.seachedContactList.isEmpty
                              ? const Center(
                                  child: Text(
                                      "No matching contacts Please check spelling"),
                                )
                              : ListView.builder(
                                  itemCount: contactController
                                      .seachedContactList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Obx(
                                      () => SelectedContactItemWidget(
                                        checkBoxVal:
                                            (contactController.markAll.value ||
                                                contactController
                                                    .selectedContactList
                                                    .contains(contactController
                                                            .seachedContactList[
                                                        index])),
                                        initials: contactController
                                                .seachedContactList[index]
                                                .name
                                                .first
                                                .isNotEmpty
                                            ? contactController
                                                .seachedContactList[index]
                                                .name
                                                .first[0]
                                            : contactController
                                                .seachedContactList[index]
                                                .name
                                                .first,
                                        selectedContacts: false,
                                        name:
                                            "${contactController.seachedContactList[index].name.first} ${contactController.seachedContactList[index].name.middle} ${contactController.seachedContactList[index].name.last}",
                                        phoneNumber: '', color: Colors.red,
                                        contact: contactController
                                            .seachedContactList[index],

                                        //color: '',
                                      ),
                                    );
                                  },
                                ),
                        ),

                        Obx(
                          () => contactController.isUploadingContacts.value
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              : CustomElevatedButton(
                                  isDisabled:
                                      !contactController.anySelected.value,
                                  text: "Upload",
                                  onTap: () {
                                    contactController.uploadContacts();
                                  },
                                ),
                        ),

                        // SizedBox(height: 50.h,),
                      ],
                    ),
            ),
          )),
    );
  }
}
