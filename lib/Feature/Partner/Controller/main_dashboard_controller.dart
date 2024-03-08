import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:get/get.dart';

class PartnerMainDashboardController extends GetxController {
  void updateSelectedField(int selectedIndex) {
    for (int i = 0; i < partnerDrawerDataList.length; i++) {
      if (i == selectedIndex) {
        partnerDrawerDataList[i] = true;
      } else {
        partnerDrawerDataList[i] = false;
      }
    }
  }

  List<Map<String, dynamic>> partnerMainDashboardListData = [
    {
      "imagePath": ImageConstant.connectIcon,
      "title": "Partner\nDashboard",
      // "buttonName": "Connect",
      "buttonTap": () {
        // Navigator.pushNamed(Get.context!, AppRoutes.requestServiceOneScreen);
      }
    },
    {
      "imagePath": ImageConstant.newServiceIcon,
      "title": "Partner\nLobby",
      // "buttonName": "Request Service",
      "buttonTap": () {
        // Navigator.pushNamed(Get.context!, AppRoutes.requestServiceOneScreen);
      }
    },
    {
      "title": "Partner\nDesk",
      "imagePath": ImageConstant.viewMyServiceIcon,
      // "buttonName": "View & Collaborate",
      "buttonTap": () {}
    },
    {
      "title": "Partner\nRegister",
      "imagePath": ImageConstant.viewUploadDocument,
      // "buttonName": "Access My Vault",
      "buttonTap": () {}
    },
    {
      "title": "Partner\nReceivables",
      "imagePath": ImageConstant.viewUploadDocument,
      // "buttonName": "Access My Vault",
      "buttonTap": () {}
    },
  ];

  RxList<bool> partnerDrawerDataList = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ].obs;
}
