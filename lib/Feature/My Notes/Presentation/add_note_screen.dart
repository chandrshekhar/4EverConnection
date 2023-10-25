import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/Feature/My%20Notes/Controller/my_notes_controller.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});
  final myNoteController = Get.put(MyNotesController());
  final subjectKey = GlobalKey<FormState>();
  final notesKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    myNoteController.clearTextField();
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
        title: AppbarTitle(text: "Add Notes"),
        actions: [
          AppbarImage1(
              svgPath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 25.v))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.adaptSize, right: 15.adaptSize),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 32.v),
              decoration: AppDecoration.outlineBlack
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgSearch,
                        height: 17.adaptSize,
                        width: 17.adaptSize,
                        margin: EdgeInsets.only(top: 3.v, bottom: 13.v)),
                    Obx(() => Expanded(
                          flex: 1,
                          child: Form(
                              key: subjectKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: CustomTextFormField(
                                  controller:
                                      myNoteController.subjectController.value,
                                  margin: EdgeInsets.only(left: 22.h),
                                  hintText: "Subject",
                                  textInputType: TextInputType.visiblePassword,
                                  onChange: (value) {
                                    myNoteController.setSubjectVlidate(value);
                                  },
                                  validator: (value) {
                                    if (value!.length < 4) {
                                      return "Subject must have 4 character";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: false)),
                        ))
                  ]),
                  SizedBox(
                    height: 15.h,
                  ),
                  Obx(() => Form(
                      key: notesKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: CustomTextFormField(
                          controller: myNoteController.notesController.value,
                          margin: EdgeInsets.only(
                              left: 12.h, top: 34.v, right: 12.h),
                          hintText: "Write your notes",
                          textInputAction: TextInputAction.done,
                          maxLines: 6,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 11.h, vertical: 17.v),
                          borderDecoration: OutlineInputBorder(),
                          filled: false,
                          onChange: (value) {
                            myNoteController.setNotesValidate(value);
                          },
                          validator: (value) {
                            if (value!.length < 10) {
                              return "Notes have atleast 10 character";
                            } else {
                              return null;
                            }
                          },
                          fillColor: theme.colorScheme.primary))),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
                padding: EdgeInsets.all(13.h),
                child: Obx(() => myNoteController.isAddNoteLoading.value
                    ? Center(
                        child: SizedBox(
                          height: 60.h,
                          width: 60.adaptSize,
                          child: const CircularProgressIndicator.adaptive(),
                        ),
                      )
                    : CustomElevatedButton(
                        onTap: myNoteController.isSubjectValidate.value ==
                                    false ||
                                myNoteController.isNotesValidate.value == false
                            ? null
                            : () {
                                myNoteController.addNotes(context);
                              },
                        height: 45.v,
                        width: 300.h,
                        text: "Save",
                        buttonStyle: ButtonStyle(
                            backgroundColor: myNoteController
                                            .isSubjectValidate.value ==
                                        false ||
                                    myNoteController.isNotesValidate.value ==
                                        false
                                ? const MaterialStatePropertyAll(Colors.grey)
                                : const MaterialStatePropertyAll(
                                    AppColors.buttonColor)),
                        buttonTextStyle: CustomTextStyles.titleSmallPrimary,
                      ))),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
