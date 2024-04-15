import 'package:get/get.dart';
import '../../Request Service/Model/partner_contact_model.dart';
import '../Repository/dashboard_repo.dart';

class PartnerContactController extends GetxController {
  final PartnerRepo _myRepo = PartnerRepo();
  RxList<PartnerContactModel> parnerContactList = <PartnerContactModel>[].obs;
  RxBool isContactLoading = false.obs;
  RxString searchText = ''.obs;
  getPartnetContactList({bool isLoadingShow  = true}) async {
    try {
    isLoadingShow?  isContactLoading(true):null;
      var res = await _myRepo.getPartnerContactList(searchText: searchText.value);
      if (res.data != null) {
        parnerContactList.value = res.data!;
        isContactLoading(false);
      } else {
        parnerContactList.value = [];
        isContactLoading(false);
      }
    } catch (e) {
      isContactLoading(false);
      parnerContactList.value = [];
    }
  }
}
