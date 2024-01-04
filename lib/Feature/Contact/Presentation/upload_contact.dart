import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Contact/Controller/contact_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
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
    contactController.getContactFromPhone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("build inside upload");
    return Scaffold(
      //backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        leadingWidth: 44.h,
        backgroundColor: AppColors.appBackgroundColor,
        elevation: 0.5,
        leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: IconButton(
                onPressed: () {
                  contactController.selectedContactList.clear();
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.darkBlue,
                ))),
        centerTitle: true,
        title: Text(
          "Contact Lists",
          style: TextStyle(color: AppColors.darkBlue),
        ),
        actions: [
          AppbarImage1(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.notificationsScreen);
              },
              svgPath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(24.h, 14.h, 24.h, 25.h))
        ],
      ),
      body: SafeArea(
          bottom: false,
          child: Obx(
            () => contactController.isLoading.value
                ? const Center(child: CircularProgressIndicator.adaptive())
                : Column(
                    children: [
                      SizedBox(height: 15.h),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 25.sp, right: 25.sp, top: 20.sp),
                          // suffixIconConstraints: BoxConstraints(),
                          suffixIcon: const Icon(Icons.search),
                          hintText: "Search Contact",
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        onChanged: (value) {
                          contactController.search(value);
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16.sp, left: 16.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Total:",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " ${contactController.seachedContactList.length}",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.greyTextColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Select All",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.greyTextColor),
                                ),
                                Obx(
                                  () => Checkbox(
                                      side: BorderSide(
                                        color: Colors.grey,
                                        width: 1.5.sp,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
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
                          ],
                        ),
                      ),
                      Expanded(
                        child: contactController.seachedContactList.isEmpty
                            ? Center(
                                child: Text(
                                  "No matching contacts Please check spelling",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.greyTextColor),
                                ),
                              )
                            : ListView.builder(
                                itemCount:
                                    contactController.seachedContactList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => SelectedContactItemWidget(
                                      checkBoxVal: (contactController
                                              .markAll.value ||
                                          contactController.selectedContactList
                                              .contains(contactController
                                                  .seachedContactList[index])),
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        () => contactController.isUploadingContacts.value
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : CustomElevatedButton(
                                width: 250.w,
                                buttonStyle: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColors.darkBlue)),
                                isDisabled:
                                    !contactController.anySelected.value,
                                text: "Upload",
                                buttonTextStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                                onTap: () async {
                                  await contactController.uploadContacts();
                                  Get.back();
                                },
                              ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
          )),
    );
  }
}
