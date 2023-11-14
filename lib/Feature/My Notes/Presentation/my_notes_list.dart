import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/User%20Profile%20Controller/user_profile_controller.dart';
import 'package:forever_connection/Feature/My%20Notes/Controller/my_notes_controller.dart';
import 'package:forever_connection/Feature/My%20Notes/Presentation/edit_notes.dart';
import 'package:forever_connection/Feature/My%20Notes/Presentation/my_notes_details_screen.dart';
import 'package:forever_connection/Feature/My%20Notes/Widget/note_card_widget.dart';
import 'package:forever_connection/Feature/notification/notification-screen.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class MyNotesListScreen extends StatelessWidget {
  MyNotesListScreen({super.key});
  final myNotesController = Get.put(MyNotesController());
  final profileController = Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    myNotesController.getMyNotes();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.floatingActionButtonColor,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addNotesScreen);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
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
        title: AppbarTitle(text: "My Notes"),
        actions: [
          AppbarImage1(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsScreen()));
              },
              svgPath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 25.v))
        ],
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
                decoration: AppDecoration.fillLightblue50,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 32.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgSearch,
                                height: 17.adaptSize,
                                width: 17.adaptSize,
                                margin: EdgeInsets.only(top: 3.v, bottom: 13.v),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                    // controller: passwordController,
                                    margin: EdgeInsets.only(left: 22.h),
                                    hintText: "Search notes",
                                    labelText: "Search notes",
                                    textInputType: TextInputType.name,
                                    onChange: (value) {
                                      if (value.toString().isNotEmpty) {
                                        Future.delayed(
                                            const Duration(milliseconds: 300),
                                            () {
                                          // Call your function here
                                          myNotesController.getMyNotes(
                                              searchText: value);
                                        });
                                      } else {
                                        Future.delayed(
                                            const Duration(milliseconds: 300),
                                            () {
                                          // Call your function here
                                          myNotesController.getMyNotes(
                                              searchText: "");
                                        });
                                      }
                                    },
                                    obscureText: false),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Notes",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(() => myNotesController.noteList.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.only(
                        left: 23.adaptSize, right: 23.adaptSize),

                    // itemExtent:
                    //     MediaQuery.of(context).size.height * 0.2 + 20.0,
                    itemCount: myNotesController.noteList.length,
                    itemBuilder: (context, index) {
                      var item = myNotesController.noteList[index];
                      return InkWell(
                        onTap: () {
                          Get.to(MyNotesDetailsScreen(
                            notesId: item.id ?? -1,
                            index: index,
                          ));
                        },
                        child: MyNotesCardWidget(
                            onSeleted: (value) {
                              if (value.toString() == "Edit") {
                                Get.to(EditNotesScreen(
                                  id: item.id!,
                                  subject: item.subject ?? "",
                                  text: item.text ?? "",
                                ));
                              } else {
                                AwesomeDialog(
                                        btnOkColor: AppColors.buttonColor,
                                        context: context,
                                        dialogType: DialogType.question,
                                        animType: AnimType.bottomSlide,
                                        title: 'Remove',
                                        desc:
                                            'Are you sure to delete this notes?',
                                        btnCancelOnPress: () {},
                                        btnOkOnPress: () async {
                                          await myNotesController
                                              .deleteNotes(item.id!);
                                          myNotesController.noteList
                                              .removeAt(index);
                                        },
                                        barrierColor:
                                            Colors.red.withOpacity(0.3),
                                        descTextStyle: TextStyle(
                                            color: AppColors.buttonColor,
                                            fontSize: 15.adaptSize),
                                        titleTextStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.adaptSize))
                                    .show();
                              }
                            },
                            notesTitle: item.subject ?? "",
                            author:
                                "${profileController.userProfileModel.value.personalData?.firstName ?? ''} ${profileController.userProfileModel.value.personalData?.lastName ?? ""}",
                            description: item.text ?? "",
                            dateTime: myNotesController
                                .dateTime(item.dateUpdated ?? "")),
                      );
                    },
                  )
                : myNotesController.isNotesLitsLoading.value
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : const Center(child: Text("No notes found"))),
          )
        ],
      ),
    );
  }
}
