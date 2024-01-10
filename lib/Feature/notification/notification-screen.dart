import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/custom_drawar_widget.dart';
import 'package:forever_connection/widgets/custom_menu_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Controllers/Notification Controller/notification_controller.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  final notificationController = Get.put(NotificationController());

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    notificationController.getNotification();
    // final profileImage = userProfileController.userProfileModel.value.personalData.
    return Scaffold(
      backgroundColor: appTheme.lightBlue50,
      key: _key,
       endDrawer: CustomDrawerWidget(),
      appBar: CustomAppBar(
        leadingWidth: 44.h,
        leading: CustomMenuButtonWidget(
          globalKey: _key,
        ),
        // leading: AppbarImage(
        //     svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
        //     margin: EdgeInsets.only(left: 24.h, top: 22.h, bottom: 25.h),
        //     onTap: () {
        //       Navigator.pop(context);
        //     }),
        actions:const [
          SizedBox()
        ],
        centerTitle: true,
        title: AppbarTitle(text: "Notifications"),
      ),
     
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => notificationController.isLoading == true
              ? const Center(child: CircularProgressIndicator.adaptive())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: notificationController.notificationList.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      notificationController.notificationLastSeen(
                          notificationController.notificationList[index].id!);
                    }
                    return Column(
                      children: [
                        Container(
                            // height: 80.h,
                            alignment: Alignment.topLeft,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: notificationController
                                          .notificationList[index]
                                          .announcedFromPhoto ??
                                      "", // Replace with the actual image URL
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    backgroundImage: imageProvider,
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator.adaptive(
                                          backgroundColor: AppColors
                                              .appBackgroundColor), // Placeholder widget
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 60,
                                  ), // Widget to display when an error occurs
                                ),
                                SizedBox(width: 10.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'From ',
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                              text: notificationController
                                                      .notificationList[index]
                                                      .announcedFromName ??
                                                  ""),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      notificationController
                                              .notificationList[index]
                                              .subject ??
                                          "",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Html(
                                      data:
                                          "  ${notificationController.notificationList[index].text}",
                                      shrinkWrap: true,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(DateFormat('EEEE')
                                    .format(DateTime.parse(
                                        notificationController
                                                .notificationList[index]
                                                .dateCreated ??
                                            ""))
                                    .substring(0, 3))
                              ],
                            )),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              DateFormat("yyyy-MM-dd").format(DateTime.parse(
                                  notificationController.notificationList[index]
                                          .dateCreated ??
                                      "")),
                              style: const TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text(
                              "|",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              DateFormat("hh:mm a").format(DateTime.parse(
                                  notificationController.notificationList[index]
                                          .dateCreated ??
                                      "")),
                              style: const TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
