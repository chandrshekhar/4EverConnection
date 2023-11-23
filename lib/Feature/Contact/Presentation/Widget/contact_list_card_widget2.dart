import 'package:flutter/material.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/size_utils.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:forever_connection/theme/custom_text_style.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';

class ContactListCard2 extends StatelessWidget {
  final String notesTitle;
  final String author;
  final String description;
  final String dateTime;
  final Function(String)? onSeleted;
  final String? whereFrom;
  const ContactListCard2(
      {super.key,
      required this.notesTitle,
      required this.author,
      required this.description,
      required this.dateTime,
      this.onSeleted,
      this.whereFrom});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.only(bottom: 4.h),
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
                top: 6.adaptSize,
                bottom: 6.adaptSize,
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
                    notesTitle,
                    style: CustomTextStyles.titleLargePrimary_1,
                  ),
                ),
                ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 6.h,
                left: 15.adaptSize,
                right: 15.adaptSize,
                bottom: 6.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLable(context, "Contact Name", ImageConstant.imgUser),
                Padding(
                  padding: EdgeInsets.only(left: 38, top: 10.h),
                  child: Text(
                    author,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.adaptSize),
                  ),
                ),
                
                
                
               
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 6.h, left: 15.adaptSize, right: 15.adaptSize, bottom: 6.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLable(context, "Occupation", ImageConstant.imgEdit),
                Padding(
                  padding: EdgeInsets.only(left: 38, top: 10.h),
                  child: Text(
                    description,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.adaptSize),
                  ),
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
