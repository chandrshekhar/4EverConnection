import 'package:forever_connection/Feature/Wallet/Repo/wallet_repo.dart';
import 'package:get/get.dart';

import '../Model/withdra_history_model.dart';

class WithdrawHistoryController extends GetxController {
  final MyWalletRepo _myWalletRepo = MyWalletRepo();
  RxList<WithdrawReqListModel> withdrawHistoryList =
      <WithdrawReqListModel>[].obs;

  RxBool isHistoryLoading = false.obs;
  getWithdrawHistoryList() async {
    try {
      isHistoryLoading(true);
      var res = await _myWalletRepo.getWithdrawHistoryList();
      if (res.isNotEmpty) {
        withdrawHistoryList.value = res;
        isHistoryLoading(false);
      } else {
        withdrawHistoryList.value = [];
        isHistoryLoading(false);
      }
    } catch (e) {
      withdrawHistoryList.value = [];
      isHistoryLoading(false);
    }
  }

  @override
  void onInit() {
    getWithdrawHistoryList();
    super.onInit();
  }
}
