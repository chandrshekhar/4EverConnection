import 'package:forever_connection/Feature/Wallet/Repo/wallet_repo.dart';
import 'package:get/get.dart';

import '../Model/withdrawal_method_model.dart';

class WithdrawMethodController extends GetxController {
  final MyWalletRepo _myWalletRepo = MyWalletRepo();
  RxList<WithdrawalMethod> withdrawMethodList = <WithdrawalMethod>[].obs;
  RxBool isWithdrawMethodLoading = false.obs;
  getWithdrawalMethodList() async {
    try {
      isWithdrawMethodLoading(true);
      var res = await _myWalletRepo.getWithdrawalMethodList();
      if (res.isNotEmpty) {
        withdrawMethodList.value = res;
        isWithdrawMethodLoading(false);
      } else {
        withdrawMethodList.value = [];
        isWithdrawMethodLoading(false);
      }
    } catch (e) {
      withdrawMethodList.value = [];
      isWithdrawMethodLoading(false);
    }
  }

  @override
  void onInit() {
    getWithdrawalMethodList();
    super.onInit();
  }
}
