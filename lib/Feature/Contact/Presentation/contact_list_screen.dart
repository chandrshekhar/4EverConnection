import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Contact/Controller/contact_controller.dart';
import 'package:forever_connection/Feature/Contact/Presentation/Widget/contact_list_card_widget.dart';
import 'package:forever_connection/Feature/My%20Notes/Controller/my_notes_controller.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Controller/reqiest_service_controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/utils/size_utils.dart';
import 'package:forever_connection/widgets/custom_drop_down.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

import '../../../core/constants/image_constant.dart';
import '../../../widgets/app_bar/appbar_image.dart';
import '../../../widgets/app_bar/appbar_image_1.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_icon_button.dart';

class ContactListScreen extends StatelessWidget {
  ContactListScreen({super.key});
  final contactController = Get.put(ContactController());
  final noteController = Get.put(MyNotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarImage(
            svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
            margin: EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
            onTap: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Contact Lits"),
        actions: [
          AppbarImage1(
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
              Container(
                padding: EdgeInsets.only(
                    top: 20.adaptSize,
                    bottom: 20.adaptSize,
                    left: 20.adaptSize,
                    right: 20.adaptSize),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.adaptSize),
                    color: Colors.white),
                child: Column(
                  children: [
                    Obx(
                      () => CustomTextFormField(
                          controller: contactController.searchController.value,
                          margin: EdgeInsets.only(left: 22.h),
                          labelText: "Search contact",
                          textInputType: TextInputType.name,
                          onChange: (value) {},
                          obscureText: false),
                    ),
                    SizedBox(
                      height: 10.adaptSize,
                    ),
                   
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
                                color: AppColors.floatingActionButtonColor,
                                borderRadius: BorderRadius.circular(3)),
                            height: 48.h,
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: const Row(
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
                            onTap: () {},
                            decoration: BoxDecoration(
                                color: AppColors.floatingActionButtonColor,
                                borderRadius: BorderRadius.circular(3)),
                            height: 48.h,
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Row(
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
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                padding: EdgeInsets.only(top: 20.h),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ContactListCard(
                    author: "Test",
                    dateTime: noteController
                        .dateTime("2023-10-19T06:04:27.405012-04:00"),
                    description: "Connect",
                    notesTitle: "",
                    onSeleted: (p0) {},
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
