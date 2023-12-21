import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Wallet/My%20Wallet/Controller/controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:get/get.dart';

import '../../dashboard_screen/widgets/userexperience_item_widget.dart';
import '../Earning History/View/earning_history.dart';
import '../Withdraw Available Funds/View/withdraw_available_screen.dart';
import '../Withdrawal History/View/withdrawal_history_screen.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  final myWalletController = Get.put(MyWalletController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          "My Wallet",
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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 41.h),
        itemCount: myWalletController.myWalletList.length,
        itemBuilder: (context, index) {
          return UserexperienceItemWidget(
            title: myWalletController.myWalletList[index]['name'],
            leftImagePath: myWalletController.myWalletList[index]['image'],
            infoButtonColor: AppColors.buttonColor,
            infoButtonSize: 20.sp,
            onIconClick: () {
              // if (index == 0) {
              //   showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return Dialog(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(
              //               16), // Set the border radius for the dialog
              //         ),
              //         child: const CustomPopupContent(
              //             title: "Connect",
              //             content: "assets/images/connect-tooltips.png"),
              //       );
              //     },
              //   );
              // } else if (index == 1) {
              //   showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return Dialog(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(
              //               16), // Set the border radius for the dialog
              //         ),
              //         child: const CustomPopupContent(
              //           title: "Request Service",
              //           content: "assets/images/request-tooltips.png",
              //         ),
              //       );
              //     },
              //   );
              // } else if (index == 2) {
              //   showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return Dialog(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(
              //               16), // Set the border radius for the dialog
              //         ),
              //         child: const CustomPopupContent(
              //             title: "View & Collaborate",
              //             content: "assets/images/collaborate-tooltips.png"),
              //       );
              //     },
              //   );
              // } else if (index == 3) {
              //   showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return Dialog(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(
              //               16), // Set the border radius for the dialog
              //         ),
              //         child: const CustomPopupContent(
              //             title: "Access My Vault",
              //             content: "assets/images/access-my-vault.png"),
              //       );
              //     },
              //   );
              // }
            },
            ontap: () {
              if (index == 2) {
                Get.to(const WithdrawAvailableFundsScreen());
              } else if (index == 1) {
                Get.to(const WithdrawalHistoryScreen());
              } else if (index == 0) {
                Get.to(const EarningHistoryScreen());
              }
              // else if (index == 1) {
              //   Navigator.pushNamed(
              //       context, AppRoutes.requestServiceOneScreen);
              // } else if (index == 2) {
              //   Navigator.pushNamed(
              //       context, AppRoutes.myServicesScreen);
              // } else if (index == 3) {
              //   Navigator.pushNamed(
              //       context, AppRoutes.documentVaultScreen);
              // }
            },
          );
        },
      ),
    );
  }
}
