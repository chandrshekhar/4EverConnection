import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Wallet/Model/wallet_model.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/custom_drawar_widget.dart';
import 'package:forever_connection/widgets/custom_menu_button.dart';
import 'package:get/get.dart';

import '../../../dashboard_screen/widgets/userexperience_item_widget.dart';
import '../../Controller/mywallet_cotroller.dart';
import '../Earning History/earning_history.dart';
import '../Withdraw Available Funds/withdraw_available_screen.dart';
import '../Withdrawal History/withdrawal_history_screen.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  final myWalletController = Get.put(MyWalletController());
  @override
  void initState() {
    myWalletController.walletModel.value = WalletModel();
    myWalletController.getWalletData();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        actions: [
          AppbarImage1(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.notificationsScreen);
            },
            svgPath: ImageConstant.imgCart,

            // margin: EdgeInsets.fromLTRB(10.h, 14.v, 15.h, 15.v)
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: CustomMenuButtonWidget(globalKey: _key),
          ),
        ],
      ),
      endDrawer: CustomDrawerWidget(),
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.115,
              margin: EdgeInsets.only(
                  bottom: 10.h, left: 25.w, right: 25.w, top: 30.h),
              color: AppColors.darkBlue,
              child: Obx(
                () => myWalletController.isDataLoading.value
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Available Funds",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "\$${myWalletController.walletModel.value.accountBalance.toString()}",
                            style: TextStyle(
                              color: AppColors.buttonColor2,
                              fontFamily: "Poppins",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
              )),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 20.h),
              itemCount: myWalletController.myWalletList.length,
              itemBuilder: (context, index) {
                return UserexperienceItemWidget(
                  title: myWalletController.myWalletList[index]['name'],
                  leftImagePath: myWalletController.myWalletList[index]
                      ['image'],
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
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  const WithdrawAvailableFundsScreen()));
                      //Get.to(const WithdrawAvailableFundsScreen());
                    } else if (index == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const WithdrawalHistoryScreen()));
                    } else if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const EarningHistoryScreen()));
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
          ),
        ],
      ),
    );
  }
}
