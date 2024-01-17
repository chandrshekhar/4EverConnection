import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/My%20Profile/Controller/relationship_controller.dart';
import 'package:forever_connection/Feature/My%20Profile/Widgets/relationship_details.dart';
import 'package:forever_connection/core/utils/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:get/get.dart';

// ignore_for_file: must_be_immutable
class RelationshipsScreen extends StatefulWidget {
  const RelationshipsScreen({Key? key}) : super(key: key);

  @override
  State<RelationshipsScreen> createState() => _RelationshipsScreenState();
}

class _RelationshipsScreenState extends State<RelationshipsScreen> {
  final relationshipController = Get.put(RelationShipController());

  @override
  void initState() {
    relationshipController.getUserRelationshipData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var relationData = relationshipController.relationshipData;
    return Scaffold(
        backgroundColor: appTheme.lightBlue50,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: 44.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                margin: EdgeInsets.only(left: 24.h, top: 20.v, bottom: 30.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Relationships"),
            actions: [
              AppbarImage1(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
                  },
                  svgPath: ImageConstant.imgCart,
                  margin: EdgeInsets.fromLTRB(24.h, 15.v, 24.h, 24.v))
            ],
            styleType: Style.bgShadow),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(
            () => relationshipController.isLoadingRelationshipData == true
                ? const Center(child: CircularProgressIndicator.adaptive())
                : ListView.builder(
                    itemCount: relationData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 7.h),
                        decoration: const BoxDecoration(
                            color: AppColors.floatingActionButtonColor),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          title: Text(
                            relationData[index].relationshipType ?? "",
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          onTap: () {
                            relationshipController.updateControllerValue(
                              relationshipModel: relationData[index],
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RelationshipDetailsScreen(
                                          relationshipType: relationData[index]
                                                  .relationshipType ??
                                              "",
                                        )));
                          },
                        ),
                      );
                    },
                  ),
          ),
        ));
  }
}
