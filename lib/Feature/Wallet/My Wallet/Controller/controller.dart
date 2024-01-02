import 'package:get/get.dart';

import '../../../../core/constants/image_constant.dart';

class MyWalletController extends GetxController {
  List myWalletList = [
    {"image": ImageConstant.withdraw, "name": "Withdraw Available Funds"},
    {"image": ImageConstant.earningHistory, "name": "Earning History"},
    {"image": ImageConstant.withdrawHistory, "name": "Withdrawal History"},
  ];
}
