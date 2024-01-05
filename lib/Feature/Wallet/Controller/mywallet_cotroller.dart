import 'package:get/get.dart';

import '../../../core/constants/image_constant.dart';
import '../Model/wallet_model.dart';
import '../Repo/wallet_repo.dart';

class MyWalletController extends GetxController {
  final _myWalletService = MyWalletRepo();
  var walletModel = WalletModel().obs;
  List myWalletList = [
    {"image": ImageConstant.withdraw, "name": "Withdraw Available Funds"},
    {"image": ImageConstant.earningHistory, "name": "Earning History"},
    {"image": ImageConstant.withdrawHistory, "name": "Withdrawal History"},
  ];

  RxBool isDataLoading = false.obs;
  getWalletData() async {
    try {
      isDataLoading(true);
      var res = await _myWalletService.getWalletData();
      if (res.toString().isNotEmpty) {
        walletModel.value = res;
        isDataLoading(false);
      } else {
        walletModel.value = WalletModel();
        isDataLoading(false);
      }
    } catch (e) {
      walletModel.value = WalletModel();
      isDataLoading(false);
    }
  }

  @override
  void onInit() {
    getWalletData();
    super.onInit();
  }
}
