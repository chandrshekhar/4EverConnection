import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Wallet/Controller/withdraw_method_controller.dart';
import 'package:forever_connection/Feature/Wallet/Widget/model_bottom_sheet.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/custom_icon_button.dart';
import 'package:get/get.dart';

import '../Controller/withdraw_availabl_funds.dart';

class WithdrawMethodScreen extends StatefulWidget {
  const WithdrawMethodScreen({super.key});

  @override
  State<WithdrawMethodScreen> createState() => _WithdrawMethodScreenState();
}

class _WithdrawMethodScreenState extends State<WithdrawMethodScreen> {
  final withdrawMethodController = Get.put(WithdrawMethodController());
  final withdrawAvailableFund = Get.put(WithdrawFundsController());
  @override
  void initState() {
    withdrawMethodController.getWithdrawalMethodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Text(
          "Withdraw Method",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 3,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                headerText(string: "Method\nName"),
                headerText(string: "Email/Phone Number"),
                headerText(string: "Default"),
                headerText(string: "Action"),
              ],
            ),
            Divider(
              thickness: 1.sp,
              color: Colors.black,
            ),
            Expanded(
                child: Obx(() => withdrawMethodController
                        .isWithdrawMethodLoading.value
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : withdrawMethodController.withdrawMethodList.isNotEmpty
                        ? ListView.builder(
                            itemCount: withdrawMethodController
                                .withdrawMethodList.length,
                            itemBuilder: (context, index) {
                              var item = withdrawMethodController
                                  .withdrawMethodList[index];
                              return methodCard(
                                  methodNamem: item.method ?? "",
                                  phoneNumber: item.identification ?? "",
                                  switchWidget: Obx(() => Switch.adaptive(
                                        activeTrackColor: AppColors.darkBlue,
                                        inactiveTrackColor: Colors.white,
                                        trackOutlineColor:
                                            const MaterialStatePropertyAll<
                                                Color>(Colors.grey),
                                        inactiveThumbColor: Colors.grey,
                                        value: item.defaults.value,
                                        onChanged: (bool value1) {
                                          withdrawAvailableFund
                                              .methodController.value
                                              .clear();
                                          withdrawAvailableFund.methodIds(-1);
                                          item.defaults.value = value1;
                                          withdrawAvailableFund
                                              .toggleMethod(item.id!);
                                          item.defaults.value
                                              ? withdrawAvailableFund
                                                  .addModelData(
                                                      methodId: item.id ?? -1,
                                                      methodName:
                                                          item.method ?? "")
                                              : null;
                                          // for (int i = 0;
                                          //     i <
                                          //         withdrawMethodController
                                          //             .withdrawMethodList
                                          //             .length;
                                          //     i++) {
                                          //   if (i != index) {
                                          //     withdrawMethodController
                                          //         .withdrawMethodList[i]
                                          //         .defaults
                                          //         .value = false;
                                          //   }
                                          //    }
                                        },
                                      )),
                                  onDeletePress: () {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.question,
                                      animType: AnimType.rightSlide,
                                      title: 'Delete',
                                      titleTextStyle: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600),
                                      desc: 'Are you want to delete?',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () async {
                                        await withdrawAvailableFund
                                            .deleteMethodService(
                                                id: item.id!, index: index);
                                      },
                                    ).show();
                                  },
                                  onEditPress: () {
                                    withdrawAvailableFund
                                        .setPrefiledEditValue(item);
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled:
                                          true, // This makes the bottom sheet take up the full screen height
                                      builder: (BuildContext context) {
                                        return MyBottomSheetContent(
                                          isCommingFromEdit: true,
                                          id: item.id,
                                        );
                                      },
                                    );
                                  });
                            },
                          )
                        : const Center(
                            child: Text("No Method found"),
                          ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  height: 45.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.zero, color: Colors.white),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                CustomIconButton(
                  height: 45.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.darkBlue),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget methodCard(
      {required String methodNamem,
      required String phoneNumber,
      required Widget switchWidget,
      required VoidCallback onEditPress,
      required VoidCallback onDeletePress}) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(child: Text(methodNamem)),
            Expanded(child: Text(phoneNumber)),
            Expanded(
                child: Transform.scale(
                    scaleY: 0.8, scaleX: 0.9, child: switchWidget)),
            PopupMenuButton<String>(
                position: PopupMenuPosition.under,
                padding: EdgeInsets.zero,
                // position: PopupMenuPosition.under,
                onSelected: null,
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ), // Icon for the button
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    // Define the menu items
                    PopupMenuItem<String>(
                      onTap: onEditPress,
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_document,
                            color: AppColors.lightBlue,
                            size: 15.sp,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Edit',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: onDeletePress,
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            size: 15.sp,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5.w),
                          const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ];
                }),
          ],
        ),
        Divider(
          thickness: 0.3.sp,
          color: Colors.black.withOpacity(0.4),
        )
      ],
    );
  }

  Widget headerText({required String string}) {
    return Text(
      string,
      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
    );
  }
}
