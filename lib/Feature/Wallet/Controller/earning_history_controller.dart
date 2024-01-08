import 'package:forever_connection/Feature/Wallet/Model/earning_history_model.dart';
import 'package:forever_connection/Feature/Wallet/Repo/wallet_repo.dart';
import 'package:get/get.dart';

class EarningHistoryController extends GetxController {
  final MyWalletRepo _myWalletRepo = MyWalletRepo();

  RxList<EarningHistoryModel> earningHistoryList = <EarningHistoryModel>[].obs;
  RxBool isEarningHistoryLoading = false.obs;
  getEarningHinstoryList() async {
    try {
      isEarningHistoryLoading(true);
      var res = await _myWalletRepo.getEarningHstoryList();
      if (res.isNotEmpty) {
        earningHistoryList.value = res;
        isEarningHistoryLoading(false);
      } else {
        earningHistoryList.value = [];
        isEarningHistoryLoading(false);
      }
    } catch (e) {
      earningHistoryList.value = [];
      isEarningHistoryLoading(false);
    }
  }

  @override
  void onInit() {
    getEarningHinstoryList();
    super.onInit();
  }
}
