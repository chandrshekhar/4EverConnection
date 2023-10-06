import 'package:forever_connection/Controllers/Dashboard%20Controller/dhashboard_controller.dart';
import 'package:get/get.dart';
import '../dashboard_screen/widgets/userexperience_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_circleimage.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_search_view.dart';
import '../side_bar_draweritem/side_bar_draweritem.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFE4F5FF),
        drawer: const SideBarDraweritem(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 13.v),
              decoration: AppDecoration.outlineBlack,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    height: 42.v,
                    leadingWidth: 47.h,
                    leading: AppbarImage(
                      onTap: () {
                        _key.currentState!.openDrawer();
                      },
                      svgPath: ImageConstant.imgGrid,
                      margin: EdgeInsets.only(
                        left: 24.h,
                        top: 8.v,
                        bottom: 11.v,
                      ),
                    ),
                    actions: [
                      AppbarImage1(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.notificationsScreen);
                        },
                        svgPath: ImageConstant.imgCart,
                        margin: EdgeInsets.only(
                          left: 24.h,
                          top: 9.v,
                          bottom: 10.v,
                        ),
                      ),
                      AppbarCircleimage(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.myProfileScreen);
                        },
                        imagePath: ImageConstant.imgEllipse1,
                        margin: EdgeInsets.only(
                          left: 15.h,
                          right: 24.h,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h),
                    child: Text(
                      "Hey Austin!",
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h),
                    child: Text(
                      "Lorem ipsum dolor sit amet consectetur. ",
                      style: CustomTextStyles.bodyMediumGray600Light,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(15.v),
              child: CustomSearchView(
                controller: searchController,
                hintText: "Search",
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 16.v),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgSearch,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 46.v,
                ),
                suffix: Padding(
                  padding: EdgeInsets.only(
                    right: 15.h,
                  ),
                  child: IconButton(
                    onPressed: () {
                      searchController.clear();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 17.v),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dashboardController.dashboardListData.length,
                  itemBuilder: (context, index) {
                    return UserexperienceItemWidget(
                      title: dashboardController.dashboardListData[index]
                          ['title'],
                      desc: dashboardController.dashboardListData[index]
                          ['desc'],
                      ontap: () {
                        if (index == 0) {
                          Navigator.pushNamed(
                              context, AppRoutes.requestServiceOneScreen);
                        }
                      },
                      buttonName: dashboardController.dashboardListData[index]
                          ['buttonName'],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
