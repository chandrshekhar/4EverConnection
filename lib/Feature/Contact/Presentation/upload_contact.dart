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
                        Expanded(
                          child: ListView.builder(
                            itemCount: contactController.contacts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SelectedContactItemWidget(
                                initials: contactController
                                    .contacts[index].name.first[0],
                                selectedContacts: false,
                                name:
                                    "${contactController.contacts[index].name.first} ${contactController.contacts[index].name.last}",
                                phoneNumber: '', color: Colors.red,
                                contact: contactController.contacts[index],

                                //color: '',
                              );
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
