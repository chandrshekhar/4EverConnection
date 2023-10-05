import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LetSCheckDialog extends StatelessWidget {
  LetSCheckDialog({Key? key})
      : super(
          key: key,
        );

  TextEditingController fullNameController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 17.h,
              vertical: 27.v,
            ),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 277.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.h),
                  child: Text(
                    "You may already have an account",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall!.copyWith(
                      height: 1.22,
                    ),
                  ),
                ),
                SizedBox(height: 11.v),
                Text(
                  "Let’s Check!",
                  style: CustomTextStyles.headlineSmallYellow90002,
                ),
                SizedBox(height: 28.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgUser,
                      height: 19.v,
                      width: 17.h,
                      margin: EdgeInsets.only(
                        top: 7.v,
                        bottom: 5.v,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        controller: fullNameController,
                        margin: EdgeInsets.only(left: 22.h),
                        hintText: "Full Name",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgCall,
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      margin: EdgeInsets.only(
                        top: 9.v,
                        bottom: 7.v,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        controller: mobileNumberController,
                        margin: EdgeInsets.only(left: 24.h),
                        hintText: "Mobile Number",
                        textInputType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgVector,
                      height: 17.adaptSize,
                      width: 17.adaptSize,
                      margin: EdgeInsets.only(
                        top: 7.v,
                        bottom: 10.v,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        controller: addressController,
                        margin: EdgeInsets.only(left: 22.h),
                        hintText: "Mail Address",
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.v),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
