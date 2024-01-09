import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Wallet/Controller/withdraw_availabl_funds.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:forever_connection/widgets/custom_icon_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../Controller/mywallet_cotroller.dart';
import '../../Widget/add_fund_widget.dart';
import '../../Widget/got_it_widget.dart';
import '../../Widget/model_bottom_sheet.dart';
import '../../Widget/withdraw_method.dart';

class WithdrawAvailableFundsScreen extends StatefulWidget {
  const WithdrawAvailableFundsScreen({super.key});

  @override
  State<WithdrawAvailableFundsScreen> createState() =>
      _WithdrawAvailableFundsScreenState();
}

class _WithdrawAvailableFundsScreenState
    extends State<WithdrawAvailableFundsScreen> {
  final withdraController = Get.put(WithdrawFundsController());
  final myWalletController = Get.put(MyWalletController());
  final amountKey = GlobalKey<FormState>();
  @override
  void initState() {
    callGetWalletAfterDelay();
    withdraController.amountController.value.clear();
    withdraController.methodController.value.clear();
    withdraController.methodIds(-1);
    super.initState();
  }

  void callGetWalletAfterDelay() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      await myWalletController.getWalletData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          "Withdraw Available Funds",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: AppColors.appBarTextColor),
        ),
        centerTitle: true,
        elevation: 3,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.appBarTextColor,
            size: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              WithdraFundsCardWidget(
                onPress: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(() => AddFundWidget(
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled:
                            true, // This makes the bottom sheet take up the full screen height
                        builder: (BuildContext context) {
                          return const MyBottomSheetContent();
                        },
                      );
                    },
                    amount: myWalletController.walletModel.value.accountBalance
                        .toString(),
                  )),
              SizedBox(
                height: 42.h,
              ),
              Obx(() => CustomTextFormField(
                  controller: withdraController.methodController.value,
                  // suffixConstraints:
                  //     BoxConstraints(maxHeight: 30.h, maxWidth: 60.w),
                  suffix: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const WithdrawMethodScreen()));
                    },
                    child: Container(
                      width: 30.w,
                      padding: EdgeInsets.all(5.sp),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: const Text(
                        "Edit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  readOnly: true,
                  labelText: "Method",
                  contentPadding: EdgeInsets.only(left: 10.w, right: 10.w))),
              SizedBox(
                height: 31.h,
              ),
              Form(
                key: amountKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: CustomTextFormField(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'Amount is required';
                      } else {
                        return null;
                      }
                    },
                    textInputType: TextInputType.number,
                    controller: withdraController.amountController.value,
                    labelText: "Enter Amount",
                    contentPadding: EdgeInsets.only(left: 10.w, right: 10.w)),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: KeyboardVisibilityBuilder(builder: (context, isVisible) {
        return isVisible
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: CustomIconButton(
                  height: 45.h,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.darkBlue),
                  onTap: () {
                    if (amountKey.currentState!.validate() &&
                        withdraController.methodIds.value != -1) {
                      withdraController.submitWithdrawRequest();
                    } else {
                      ToastWidget.errorToast(
                          error: "Method should be selected");
                    }
                  },
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
