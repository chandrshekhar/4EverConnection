import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/protection-profile/protection_profile_details_screen.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/theme/theme_helper.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:get/get.dart';

import '../../Controllers/Protection controller/protection_controller.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class ProtectionProfileScreen extends StatefulWidget {
  const ProtectionProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProtectionProfileScreen> createState() =>
      _ProtectionProfileScreenState();
}

class _ProtectionProfileScreenState extends State<ProtectionProfileScreen> {
  final protectionController = Get.put(ProtectionController());

  @override
  void initState() {
    protectionController.getUserRelationshipData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.lightBlue50,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: 44.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                margin: EdgeInsets.only(left: 15.w, top: 18.h, bottom: 25.h),
                onTap: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Protection"),
            actions: [
              AppbarImage1(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
                  },
                  svgPath: ImageConstant.imgCart,
                  margin: EdgeInsets.fromLTRB(24.w, 15.h, 24.w, 24.h))
            ],
            styleType: Style.bgShadow),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(
            () => protectionController.isprotectionDataLoading == true
                ? const Center(child: CircularProgressIndicator.adaptive())
                : ListView.builder(
                    itemCount: protectionController.protectionDataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 7.h),
                        decoration: const BoxDecoration(
                            color: AppColors.floatingActionButtonColor),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          title: Text(
                            capitalizeWords(protectionController
                                    .protectionDataList[index].type!) ??
                                "",
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: const Icon(Icons.arrow_drop_down,
                              color: Colors.white),
                          onTap: () {
                            protectionController.updateControllerData(
                                protectionController.protectionDataList[index],
                                context);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProtectionDetailsScreen(
                                            protectionType: capitalizeWords(
                                                protectionController
                                                    .protectionDataList[index]
                                                    .type!))));
                          },
                        ),
                      );
                    },
                  ),
          ),
        ));
  }

  String capitalizeWords(String input) {
    List<String> words = input.split('_');
    List<String> capitalizedWords = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      } else {
        return '';
      }
    }).toList();

    return capitalizedWords.join(' ');
  }
}
