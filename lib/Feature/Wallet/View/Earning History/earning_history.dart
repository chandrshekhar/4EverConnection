import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/widgets/custom_icon_button.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../Controller/earning_history_controller.dart';
import '../../Controller/mywallet_cotroller.dart';
import '../../Widget/got_it_widget.dart';

class EarningHistoryScreen extends StatefulWidget {
  const EarningHistoryScreen({super.key});

  @override
  State<EarningHistoryScreen> createState() => _EarningHistoryScreenState();
}

class _EarningHistoryScreenState extends State<EarningHistoryScreen> {
  final myWalletController = Get.put(MyWalletController());
  final earningHistoryController = Get.put(EarningHistoryController());
  @override
  void initState() {
    super.initState();
    callGetWalletAfterDelay();
    earningHistoryController.getEarningHinstoryList();
  }

  void callGetWalletAfterDelay() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      await myWalletController.getWalletData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          "Earning History",
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
        padding:
            EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h, bottom: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WithdraFundsCardWidget(
                onPress: () {},
              ),
              Container(
                  color: AppColors.appBarTextColor,
                  margin: EdgeInsets.only(bottom: 20.h),
                  padding: EdgeInsets.only(
                      left: 17.w, right: 17.w, top: 24.h, bottom: 24.h),
                  child: Obx(
                    () => myWalletController.isDataLoading.value
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.white,
                            ),
                          )
                        : Column(
                            children: [
                              CustomIconButton(
                                height: 54.h,
                                width: 200.w,
                                onTap: () {},
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.zero,
                                    color: AppColors.buttonColor),
                                child: Center(
                                    child: Text(
                                  "Upload From W-9",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                )),
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                              CustomIconButton(
                                height: 54.h,
                                width: 200.w,
                                onTap: () {},
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.zero,
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.white)),
                                child: Center(
                                    child: Text(
                                  "Download From 1099",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                )),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  richTextStyl(
                                      amount: myWalletController
                                          .walletModel.value.totalEarnings
                                          .toString(),
                                      titile: "Total\nM\$ Earned"),
                                  Container(
                                    height: 93.h,
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  richTextStyl(
                                      amount: myWalletController
                                          .walletModel.value.yearToDateEarnings
                                          .toString(),
                                      titile: "YTD\nM\$ Earned"),
                                ],
                              ),
                            ],
                          ),
                  )),
              Obx(() => earningHistoryController.isEarningHistoryLoading.value
                  ? Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    )
                  : earningHistoryController.earningHistoryList.isNotEmpty
                      ? Column(
                          children: List.generate(
                              earningHistoryController
                                  .earningHistoryList.length,
                              (index) => Container(
                                    margin: EdgeInsets.only(bottom: 13.h),
                                    padding: EdgeInsets.only(
                                        left: 17.w,
                                        right: 17.w,
                                        top: 24.h,
                                        bottom: 24.h),
                                    color: AppColors.cardColorBg,
                                    child: Column(
                                      children: [
                                        titleTypeText(
                                            leadingText: "Date:",
                                            value: earningHistoryController
                                                    .earningHistoryList[index]
                                                    .date ??
                                                ""),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        titleTypeText(
                                            leadingText: "M\$ Earned:",
                                            value:
                                                "\$${earningHistoryController.earningHistoryList[index].earned}"),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        titleTypeText(
                                            leadingText: "Client Name:",
                                            value: earningHistoryController
                                  .earningHistoryList[index].client??""),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        titleTypeText(
                                            leadingText: "Related Service:",
                                            value: earningHistoryController
                                  .earningHistoryList[index].service??""),
                                      ],
                                    ),
                                  )),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: const Center(
                            child: Text("No earning history found"),
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }

  Widget richTextStyl({required String amount, required String titile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          titile,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
        Text(
          "\$$amount",
          style: TextStyle(
              color: AppColors.buttonColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
      ],
    );
  }

  Widget titleTypeText({required String leadingText, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingText,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
