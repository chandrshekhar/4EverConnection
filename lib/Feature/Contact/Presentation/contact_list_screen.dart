import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Contact/Controller/contact_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/utils/size_utils.dart';
import 'package:forever_connection/widgets/custom_drop_down.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

import '../../../core/constants/image_constant.dart';
import '../../../widgets/app_bar/appbar_image.dart';
import '../../../widgets/app_bar/appbar_image_1.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';

class ContactListScreen extends StatelessWidget {
  ContactListScreen({super.key});
  final contactController = Get.put(ContactController());

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
            padding: EdgeInsets.only(top: 20.adaptSize, bottom: 20.adaptSize, left: 20.adaptSize, right: 20.adaptSize),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.adaptSize),color: Colors.white
                ),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
