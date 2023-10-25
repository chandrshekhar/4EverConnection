import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

class MyNotesListScreen extends StatelessWidget {
  const MyNotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.floatingActionButtonColor,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addNotesScreen);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
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
        title: AppbarTitle(text: "My Notes"),
        actions: [
          AppbarImage1(
              svgPath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 25.v))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
            decoration: AppDecoration.fillLightblue50,
            child: Column(
              children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 32.v),
                    decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder16),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgSearch,
                                    height: 17.adaptSize,
                                    width: 17.adaptSize,
                                    margin: EdgeInsets.only(
                                        top: 3.v, bottom: 13.v)),
                                Expanded(
                                    child: CustomTextFormField(
                                        // controller: passwordController,
                                        margin: EdgeInsets.only(left: 22.h),
                                        hintText: "Search",
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        obscureText: false))
                              ]),
                        ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
