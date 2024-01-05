import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Wallet/Controller/withdraw_availabl_funds.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../Widget/add_fund_widget.dart';
import '../../Widget/got_it_widget.dart';
import '../../Widget/model_bottom_sheet.dart';

class WithdrawAvailableFundsScreen extends StatefulWidget {
  const WithdrawAvailableFundsScreen({super.key});

  @override
  State<WithdrawAvailableFundsScreen> createState() =>
      _WithdrawAvailableFundsScreenState();
}

class _WithdrawAvailableFundsScreenState
    extends State<WithdrawAvailableFundsScreen> {
      final withdraController = Get.put(WithdrawFundsController());
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
              AddFundWidget(
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
                amount: "10.25",
              ),
              SizedBox(
                height: 42.h,
              ),
              CustomTextFormField(
                  readOnly: true,
                  labelText: "Method",
                  contentPadding: EdgeInsets.only(left: 10.w, right: 10.w)),
              SizedBox(
                height: 31.h,
              ),
              CustomTextFormField(
                  labelText: "Enter Amount",
                  contentPadding: EdgeInsets.only(left: 10.w, right: 10.w)),
            ],
          ),
        ),
      ),
    );
  }
}
