import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Controllers/Personal%20Details%20Controller/personal_details-controller.dart';
import 'package:forever_connection/Controllers/Protection%20controller/protection_controller.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:forever_connection/theme/theme_helper.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';

class ProtectionDetailsScreen extends StatelessWidget {
  ProtectionDetailsScreen({super.key, required this.protectionType});
  final String protectionType;
  final protectionController = Get.put(ProtectionController());
  final personalDetailsController = Get.put(PersonalDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.lightBlue50,
      appBar: CustomAppBar(
          leadingWidth: 50.h,
          leading: AppbarImage(
              svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
              margin: EdgeInsets.only(left: 15.w, top: 18.h, bottom: 25.h),
              onTap: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: protectionType),
          actions: [
            AppbarImage1(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.notificationsScreen);
                },
                svgPath: ImageConstant.imgCart,
                margin: EdgeInsets.fromLTRB(24.w, 15.h, 24.w, 24.h))
          ],
          styleType: Style.bgShadow),
      body: Obx(
        () => Container(
          margin:
              EdgeInsets.only(left: 12.w, right: 12.w, bottom: 25.h, top: 15.h),
          padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.h),
          decoration: AppDecoration.outlineBlack
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
          child: Column(
            children: [
              rowWidget(
                
                  controller: protectionController.policeNumberController.value,
                  svgpath: ImageConstant.imgUser,
                  labelText: "Policy Number"),
              rowWidget(
                  controller: protectionController.policyTypeController.value,
                  svgpath: ImageConstant.imgUser,
                  labelText: "Policy Type"),
              rowWidget(
                  controller: protectionController.issueDateController.value,
                  svgpath: ImageConstant.imgUser,
                  labelText: "Issue Date"),
              rowWidget(
                  controller: protectionController.companynameController.value,
                  svgpath: ImageConstant.imgUser,
                  labelText: "Company Name"),
              rowWidget(
                  controller: protectionController.companyPhoneController.value,
                  svgpath: ImageConstant.imgUser,
                  labelText: "Company Phone"),
              rowWidget(
                  controller: protectionController.deathBenefitController.value,
                  svgpath: ImageConstant.imgUser,
                  labelText: "Current Death Benefit"),
              rowWidget(
                  controller: protectionController.premimusController.value,
                  svgpath: ImageConstant.imgUser,
                  labelText: "Current Premiums"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 5),
                    Obx(
                      () => personalDetailsController.isLoadingEdit.value
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : Expanded(
                              child: CustomElevatedButton(
                                  onTap: () async {
                                    await personalDetailsController
                                        .getMagicLink(context);
                                  },
                                  text: "Edit",
                                  buttonTextStyle: TextStyle(fontSize: 22.sp),
                                  rightIcon: Container(
                                      margin: EdgeInsets.only(left: 16.h),
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightPrimary))),
                            ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowWidget(
      {String? svgpath, String? labelText, TextEditingController? controller}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: CustomTextFormField(
          controller: controller,
          readOnly: true,
          margin: EdgeInsets.only(left: 22.h),
          labelText: labelText),
    );
  }
}
