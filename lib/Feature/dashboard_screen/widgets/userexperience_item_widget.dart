import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class UserexperienceItemWidget extends StatelessWidget {
  String? title;
  String? desc;
  String? buttonName;
  void Function()? ontap;
  UserexperienceItemWidget(
      {Key? key, this.title, this.desc, this.buttonName, this.ontap})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.2,
      margin: EdgeInsets.only(bottom: 30.h),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder9,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            decoration: AppDecoration.fillLightBlue.copyWith(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9.h),
                    topRight: Radius.circular(9.h))),
            child: Text(
              title!,
              style: CustomTextStyles.titleLargePrimary_1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.h, left: 15.adaptSize, right: 15.adaptSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  desc!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumGray600Light.copyWith(
                    height: 1.47,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(13.h),
                  child: CustomElevatedButton(
                    onTap: ontap,
                    height: 38.v,
                    width: 198.h,
                    text: buttonName!,
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
