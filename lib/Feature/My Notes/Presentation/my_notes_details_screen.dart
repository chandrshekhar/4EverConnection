import 'package:flutter/material.dart';
import 'package:forever_connection/Controllers/User%20Profile%20Controller/user_profile_controller.dart';
import 'package:forever_connection/Feature/My%20Notes/Controller/my_notes_controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../widgets/app_bar/appbar_image.dart';
import '../../../widgets/app_bar/appbar_image_1.dart';
import '../../../widgets/app_bar/appbar_title.dart';

class MyNotesDetailsScreen extends StatelessWidget {
  final int notesId;
  final int index;
  MyNotesDetailsScreen({super.key, required this.notesId, required this.index});
  final myNotesController = Get.put(MyNotesController());
  final profileController = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    myNotesController.getNotesDetails(id: notesId);
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarImage(
            svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
            margin: EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
            onTap: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Note Description"),
        actions: [
          AppbarImage1(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.notificationsScreen);
              },
              svgPath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 25.v))
        ],
      ),
      body: Obx(() => myNotesController.isNotesDetailsLoading.value
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.adaptSize, vertical: 15.adaptSize),
              child: noteCard(
                  context: context,
                  author:
                      "${profileController.userProfileModel.value.personalData?.firstName} ${profileController.userProfileModel.value.personalData?.lastName}",
                  description: myNotesController.myNotesModel.value.text ?? "",
                  notesTitle:
                      myNotesController.myNotesModel.value.subject ?? "",
                  onSeleted: (p0) {},
                  createdOn: myNotesController.dateTime(
                      myNotesController.myNotesModel.value.dateCreated!),
                  lastUpdate: myNotesController.dateTime(
                      myNotesController.myNotesModel.value.dateUpdated!)),
            )),
    );
  }

  Widget noteCard(
      {required BuildContext context,
      String? notesTitle,
      String? author,
      String? description,
      String? createdOn,
      String? lastUpdate,
      Function(String)? onSeleted}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder9,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 10.adaptSize,
                bottom: 10.adaptSize,
                left: 16.adaptSize,
                right: 10),
            alignment: Alignment.center,
            decoration: AppDecoration.fillLightBlue.copyWith(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9.h),
                topRight: Radius.circular(9.h),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "User Note | ${notesTitle}",
                    style: CustomTextStyles.titleLargePrimary_1,
                  ),
                ),
                // PopupMenuButton<String>(
                //     position: PopupMenuPosition.under,
                //     onSelected: onSeleted,
                //     icon: const Icon(
                //       Icons.more_vert,
                //       color: Colors.white,
                //     ), // Icon for the button
                //     itemBuilder: (BuildContext context) {
                //       return <PopupMenuEntry<String>>[
                //         // Define the menu items
                //         const PopupMenuItem<String>(
                //           value: 'Edit',
                //           child: Text('Edit'),
                //         ),
                //         const PopupMenuItem<String>(
                //           value: 'Delete',
                //           child: Text('Delete'),
                //         ),
                //       ];
                //     })
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 14.h,
                left: 15.adaptSize,
                right: 15.adaptSize,
                bottom: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLable(context, "Author", ImageConstant.imgUser),
                Padding(
                  padding: EdgeInsets.only(left: 38, top: 6.h),
                  child: Text(
                    author ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.adaptSize),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                // _buildLable(context, "Service", ImageConstant.serviceImage),
                // Padding(
                //   padding: EdgeInsets.only(left: 38, top: 6.h),
                //   child: Text(
                //     "Allen Chatterjee",
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w400,
                //         fontSize: 18.adaptSize),
                //   ),
                // ),
                // SizedBox(
                //   height: 12.h,
                // ),
                _buildLable(context, "Created On", ImageConstant.imgCalendar),
                Padding(
                  padding: EdgeInsets.only(left: 38, top: 6.h),
                  child: Text(
                    createdOn ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.adaptSize,
                        height: 1.5),
                  ),
                ),
                SizedBox(
                  height: 12.adaptSize,
                ),
                _buildLable(context, "Last updated", ImageConstant.imgCalendar),
                Padding(
                  padding: EdgeInsets.only(left: 38, top: 6.h),
                  child: Text(
                    createdOn ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.adaptSize,
                        height: 1.5),
                  ),
                ),
                SizedBox(
                  height: 12.adaptSize,
                ),
                _buildLable(context, "Description", ImageConstant.imgEdit),
                Padding(
                  padding: EdgeInsets.only(left: 38, top: 6.h),
                  child: Text(
                    description ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.adaptSize,
                        height: 1.5),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLable(BuildContext context, String lableName, String lableIcon) {
    return Row(
      children: [
        CustomImageView(svgPath: lableIcon),
        SizedBox(
          width: 21.adaptSize,
        ),
        Text(
          lableName,
          style: TextStyle(
              color: AppColors.greyTextColor,
              fontSize: 18.adaptSize,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
