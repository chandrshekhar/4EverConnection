import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Controllers/Auth%20Controller/signup_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class CustomAlretDialogs {
  List<Map> sourceType = [
    {"id": "1", "name": "Family"},
    {"id": "2", "name": "Friend"},
    {"id": "3", "name": "Google"},
    {"id": "4", "name": "Facebook"},
    {"id": "5", "name": "Twitter"},
    {"id": "6", "name": "Instagram"},
    {"id": "7", "name": "Youtube"},
    {"id": "8", "name": "Email"},
    {"id": "9", "name": "Radio"},
    {"id": "10", "name": "TV"},
    {"id": "11", "name": "Newspaper"},
    {"id": "12", "name": "Other"}
  ];
  void openDialogforCheckClient(
      BuildContext context, SignupController signupController) {
    AwesomeDialog(
            btnOkColor: AppColors.floatingActionButtonColor,
            context: context,
            dialogType: DialogType.question,
            animType: AnimType.bottomSlide,
            dismissOnTouchOutside: false,
            desc: 'You may already have an account',
            body: Obx(
              () => Column(
                children: [
                  const Text(
                    "You may already have an account",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.floatingActionButtonColor),
                  ),
                  const Text(
                    "Let's Check!",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.floatingActionButtonColor),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                    child: CustomTextFormField(
                        controller: signupController.firstNameController.value,
                        contentPadding: const EdgeInsets.all(5),
                        labelText: "First Name",
                        textInputType: TextInputType.visiblePassword,
                        borderDecoration: const OutlineInputBorder(),
                        onChange: (value) {
                          //  myNoteController.setSubjectVlidate(value);
                        },
                        obscureText: false),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                    child: CustomTextFormField(
                        controller: signupController.lastnameController.value,
                        contentPadding: const EdgeInsets.all(5),
                        labelText: "last Name",
                        textInputType: TextInputType.visiblePassword,
                        borderDecoration: const OutlineInputBorder(),
                        onChange: (value) {
                          //  myNoteController.setSubjectVlidate(value);
                        },
                        obscureText: false),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10),
                    child: CustomTextFormField(
                        controller: signupController.emailController.value,
                        contentPadding: const EdgeInsets.all(5),
                        labelText: "Email Address",
                        textInputType: TextInputType.visiblePassword,
                        borderDecoration: const OutlineInputBorder(),
                        onChange: (value) {
                          //  myNoteController.setSubjectVlidate(value);
                        },
                        obscureText: false),
                  ),
                  SizedBox(height: 20.h),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.5),
                  )
                ],
              ),
            ),
            btnCancelOnPress: () {},
            btnOkText: "Check",
            btnCancelColor: AppColors.buttonColor,
            btnOkOnPress: () async {
              signupController.checkClient(context);
            },
            barrierColor: AppColors.lightBlue.withOpacity(0.3),
            descTextStyle:
                const TextStyle(color: AppColors.buttonColor, fontSize: 15),
            titleTextStyle: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.w600, fontSize: 16))
        .show();
  }

  void openDialogForNoClient(
      BuildContext context, SignupController signupController) {
    AwesomeDialog(
      btnOkColor: AppColors.floatingActionButtonColor,
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.bottomSlide,
      // dismissOnTouchOutside: false,
      body: Column(
        children: [
          const Text(
            "How did you learn about us?",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.floatingActionButtonColor),
          ),
          const Text(
            "Please Choose One option:",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: AppColors.floatingActionButtonColor),
          ),
          SizedBox(height: 10.h),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0,
                childAspectRatio: 4 // spacing between columns
                ),
            padding: const EdgeInsets.all(8.0), // padding around the grid
            itemCount: sourceType.length, // total number of items
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: Row(
                    children: [
                      Obx(
                        () => Radio(
                            value: int.parse(sourceType[index]["id"]),
                            groupValue:
                                signupController.selectedSourceType.value,
                            onChanged: (v) {
                              signupController.sourceOption(
                                  int.parse(sourceType[index]["id"]));
                              Navigator.pop(context);
                            }),
                      ),
                      Text(
                        sourceType[index]["name"],
                        style: const TextStyle(color: AppColors.dashBoardColor),
                      )
                    ],
                  ));
            },
          ),
          SizedBox(height: 20.h),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      // btnCancelOnPress: () {},
      // btnOkText: "Check",
      // btnCancelColor: AppColors.buttonColor,
      // btnOkOnPress: () async {},
      barrierColor: AppColors.lightBlue.withOpacity(0.3),
      // descTextStyle:
      //     const TextStyle(color: AppColors.buttonColor, fontSize: 15),
      // titleTextStyle: const TextStyle(
      //     color: Colors.red, fontWeight: FontWeight.w600, fontSize: 16)
    ).show();
  }

  void successfullServiceDialog(BuildContext context) {
    AwesomeDialog(
            btnOkColor: AppColors.floatingActionButtonColor,
            context: context,
            dialogType: DialogType.question,
            animType: AnimType.bottomSlide,
            // dismissOnTouchOutside: false,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Your appointment with ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.floatingActionButtonColor),
                    children: <TextSpan>[
                      TextSpan(
                          text: '4ever Corporation ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'has been confirmed!',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.floatingActionButtonColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Appointment details:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 5.h),
                const Align(
                  alignment: Alignment.center,
                  child: Text("Allen Chatterjee",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.floatingActionButtonColor)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Wednesday, 11/22/2023-07;30",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ]),
                      SizedBox(height: 5.h),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.account_balance,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Accounting",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ]),
                      SizedBox(height: 5.h),
                      Row(children: [
                        const Icon(
                          Icons.timer_outlined,
                          size: 14,
                        ),
                        SizedBox(width: 10.w),
                        const Text(
                          "In person",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 50.w),
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(2)),
                            child: const Text("Get Direction"))
                      ]),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.5),
                )
              ],
            ),
            btnCancelOnPress: () {},
            btnOkText: "Upload",
            btnCancelColor: AppColors.buttonColor,
            btnOkOnPress: () async {},
            barrierColor: AppColors.lightBlue.withOpacity(0.3),
            descTextStyle:
                const TextStyle(color: AppColors.buttonColor, fontSize: 15),
            titleTextStyle: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.w600, fontSize: 16))
        .show();
  }
}
