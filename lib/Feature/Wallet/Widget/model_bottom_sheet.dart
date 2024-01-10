import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Wallet/Controller/withdraw_availabl_funds.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../widgets/custom_drop_down.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class MyBottomSheetContent extends StatefulWidget {
  final bool isCommingFromEdit;
  final int? id;
  const MyBottomSheetContent(
      {super.key, required this.isCommingFromEdit, this.id});

  @override
  State<MyBottomSheetContent> createState() => _MyBottomSheetContentState();
}

class _MyBottomSheetContentState extends State<MyBottomSheetContent> {
  final withdrawController = Get.put(WithdrawFundsController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.appBarTextColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r))),
              child: Center(
                child: Text(
                  widget.isCommingFromEdit ? "Edit Method" : "Add Method",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 15.h, bottom: 20.h, right: 20.h, left: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richTextForLable(title: "Available Pay Methods"),
                  Obx(() => CustomDropDown(
                        contentPadding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 10),
                        hintText: withdrawController
                                .paymentTypeSelectedValue.value.isNotEmpty
                            ? withdrawController.paymentTypeSelectedValue.value
                            : "Zelle",
                        items: const ["Zelle", "PayPal", "Venmo", "E-Check"],
                        onChanged: (val) {
                          withdrawController.setPaymentMethod(val);
                        },
                        validator: (value) {
                          return null;
                        },
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  richTextForLable(title: "Account Association"),
                  CustomDropDown(
                    contentPadding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 10, right: 10),
                    hintText: withdrawController
                            .accountAssociateSelectedValue.value.isNotEmpty
                        ? withdrawController.accountAssociateSelectedValue.value
                        : "Phone",
                    items: const ["Phone", "Email"],
                    onChanged: (val) {
                      withdrawController.setAccountAssociateValue(val);
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => richTextForLable(
                        title: withdrawController
                                .accountAssociateSelectedValue.value
                                .contains("Email")
                            ? "Email"
                            : "Mobile"),
                  ),
                  Obx(() => CustomTextFormField(
                        onChange: (value) {
                          withdrawController.setEmailPhone(value);
                        },
                        controller:
                            withdrawController.phoneEmailController.value,
                        hintText: withdrawController
                                .accountAssociateSelectedValue.value
                                .contains("Email")
                            ? "Email"
                            : "Mobile",
                        validator: (v) {
                          if (v.toString().isEmpty) {
                            return "Enter valid mobile number";
                          } else {
                            return null;
                          }
                        },
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                          onTap: () {
                            Get.back();
                            withdrawController.phoneEmailController.value
                                .clear();
                            withdrawController
                                .accountAssociateSelectedValue("Phone");
                            withdrawController
                                .paymentTypeSelectedValue("Zelle");
                          },
                          height: 54.h,
                          width: 150.w,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.zero,
                              color: Colors.transparent),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w500),
                            ),
                          )),
                      Obx(() => withdrawController.isEditLoading.value
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : CustomIconButton(
                              onTap: withdrawController
                                      .phoneEmailString.value.isNotEmpty
                                  ? () {
                                      if (widget.isCommingFromEdit == true) {
                                        withdrawController.editMethodService(
                                            id: widget.id!.toInt(),
                                            context: context);
                                      }
                                    }
                                  : null,
                              height: 45.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.zero,
                                  color: withdrawController
                                          .phoneEmailString.value.isNotEmpty
                                      ? AppColors.appBarTextColor
                                      : Colors.grey),
                              child: Center(
                                child: Text(
                                  widget.isCommingFromEdit
                                      ? "Edit Method"
                                      : "Add Method",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ))),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget richTextForLable({
    required String title,
  }) {
    return RichText(
        text: TextSpan(
      text: title,
      style: TextStyle(
        color: AppColors.appBarTextColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      children: const <TextSpan>[
        TextSpan(
          text: '*',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }
}
