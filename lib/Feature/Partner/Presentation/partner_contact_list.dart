import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Partner/Controller/partner_contact_controller.dart';
import 'package:forever_connection/Feature/Partner/Controller/partner_dashboard_controller.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner-appbar.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_contact_widget.dart';
import 'package:forever_connection/Feature/Partner/Widgets/partner_drawer.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:get/get.dart';

import '../Widgets/contact_list_table.dart';
import '../Widgets/data_table.dart';

class PartnerContactListScreen extends StatefulWidget {
  const PartnerContactListScreen({super.key});

  @override
  State<PartnerContactListScreen> createState() =>
      _PartnerContactListScreenState();
}

class _PartnerContactListScreenState extends State<PartnerContactListScreen> {
  final partnerContactController = Get.put(PartnerContactController());

  List<Map<String, dynamic>> connectionTableTitle = [
    {'title': "blackfield", "width": "0"},
    {'title': "Action", "width": "80"},
    {'title': "Contact Name", "width": "200"},
    {'title': "Mobile Number", "width": "160"},
    {'title': "Email", "width": "300"},
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      partnerContactController.getPartnetContactList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const PartnerDrawer(),
        appBar: PartnerAppBar(
          title: "Partner Contact",
        ),
        body: Obx(
          () => partnerContactController.isContactLoading.value
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PartnerContactWidget(
                          onChanged: (val) {
                            partnerContactController.searchText.value =
                                val.toString();
                            EasyDebounce.debounce(
                                'partner-list-serach', // <-- An ID for this particular debouncer
                                const Duration(
                                    milliseconds:
                                        500), // <-- The debounce duration
                                () => partnerContactController
                                    .getPartnetContactList(
                                        isLoadingShow:
                                            false) // <-- The target method
                                );
                          },
                          isContactAddShowingn: false,
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius: BorderRadius.circular(1.r)),
                          child: Text(
                            "Contacts",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Obx(() => Container(
                              color: Colors.black,
                              height: MediaQuery.of(context).size.height,
                              child: ContactListTable(
                                  titleList: connectionTableTitle,
                                  data: partnerContactController
                                      .parnerContactList.value),
                            )),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
