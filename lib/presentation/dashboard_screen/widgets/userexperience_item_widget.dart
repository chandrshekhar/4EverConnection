import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class UserexperienceItemWidget extends StatelessWidget {
  const UserexperienceItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 342.h,
      margin: EdgeInsets.symmetric(vertical:8.h),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder9,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 46.h,
            alignment: Alignment.center,
            decoration: AppDecoration.fillLightBlue.copyWith(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9.h),
                    topRight: Radius.circular(9.h))),
            child: Text(
              "Request New Service",
              style: CustomTextStyles.titleLargePrimary_1,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 9.v.v,left: 15.v,right: 15.v),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Explore Our Suite of Essential Services &Get ready for an Amazing 5 Star Experience!",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumGray600Light.copyWith(
                    height: 1.47,
                  ),
                ),
               
                Padding(
                  padding:  EdgeInsets.all(13.h),
                  child: CustomElevatedButton(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.requestServiceOneScreen);
                    },
                    height: 38.v,
                    width: 198.h,
                    text: "Request Service",
                    buttonTextStyle: CustomTextStyles.titleSmallPrimary,
                  ),
                ),
                // SizedBox(height: 4.v),
                // CustomElevatedButton(
                //   height: 38.v,
                //   width: 198.h,
                //   text: "Go to my Vault",
                //   buttonTextStyle: CustomTextStyles.titleSmallPrimary,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
