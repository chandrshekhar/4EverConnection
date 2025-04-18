import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/size_utils.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:forever_connection/theme/custom_text_style.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';

class MyNotesCardWidget extends StatelessWidget {
  final String notesTitle;
  final String author;
  final String description;
  final String dateTime;
  final Function(String)? onSeleted;
  const MyNotesCardWidget(
      {super.key,
      required this.notesTitle,
      required this.author,
      required this.description,
      required this.dateTime,
      this.onSeleted});

  @override
  Widget build(BuildContext context) {
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
                    "User Note | $notesTitle",
                    style: CustomTextStyles.titleLargePrimary_1,
                  ),
                ),
                PopupMenuButton<String>(
                    position: PopupMenuPosition.under,
                    onSelected: onSeleted,
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ), // Icon for the button
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        // Define the menu items
                        const PopupMenuItem<String>(
                          value: 'Edit',
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Delete',
                          child: Text('Delete'),
                        ),
                      ];
                    })
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
                    author,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.adaptSize),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                _buildLable(context, "Description", ImageConstant.imgEdit),
                Padding(
                  padding: EdgeInsets.only(left: 38, top: 6.h),
                  child: Text(
                    description,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 8,
                        width: 9,
                        child: CustomImageView(
                            svgPath: ImageConstant.imgCalendar)),
                    SizedBox(
                      width: 5.adaptSize,
                    ),
                    Text(
                      dateTime,
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontSize: 12.adaptSize,
                          fontWeight: FontWeight.w400),
                    )
                  ],
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
        Html(
          data: lableName,
          shrinkWrap: true,
        ),
        // Text(
        //   lableName,
        //   style: TextStyle(
        //       color: AppColors.greyTextColor,
        //       fontSize: 18.adaptSize,
        //       fontWeight: FontWeight.w400),
        // ),
      ],
    );
  }
}
