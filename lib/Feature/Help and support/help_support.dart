import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Contact/Controller/add_contact_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/utils.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_drawar_widget.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';
import 'package:forever_connection/widgets/custom_menu_button.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  TextEditingController searchController = TextEditingController();
  final addContactController = Get.put(AddContactController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawerWidget(),
      appBar: CustomAppBar(
        leadingWidth: 44.h,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        centerTitle: true,
        title: AppbarTitle(text: "Help"),
        styleType: Style.bgShadow,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: CustomMenuButtonWidget(globalKey: _key),
          ),
        ],
      ),
      key: _key,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEAF7FE),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              cardWidget(
                  onTap: () {
                    launchPhone(phone: "844-999-1040");
                  },
                  context: context,
                  iconPath: ImageConstant.helpPhoneIcon,
                  lable: "Company Phone",
                  value: "844-999-1040"),
              SizedBox(
                height: 20.h,
              ),
              cardWidget(
                  onTap: () {
                    launchEmail(email: "support@4ever.net");
                  },
                  context: context,
                  iconPath: ImageConstant.helpEmailIcon,
                  lable: "Email",
                  value: "support@4ever.net"),
              SizedBox(
                height: 20.h,
              ),
              cardWidget(
                  onTap: () {
                    addContactController.launchMap(
                        "7531 Leesburg Pke Suite 400 Falls Church, VA22043");
                  },
                  context: context,
                  iconPath: ImageConstant.helpCompanyAddress,
                  lable: "4ever Corporation",
                  value: "7531 Leesburg Pke Suite 400\nFalls Church, VA22043"),
              SizedBox(
                height: 20.h,
              ),
              cardWidget(
                  onTap: () {},
                  context: context,
                  iconPath: ImageConstant.helpFaxIcon,
                  lable: "Fax Line",
                  value: "888-527-1280")
            ],
          ),
        )),
      ),
      // bottomNavigationBar: CustomElevatedButton(
      //     onTap: () {},
      //     text: "Access My Link",
      //     margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 22.v),
      //     rightIcon: Container(
      //         margin: EdgeInsets.only(left: 16.h),
      //         child: CustomImageView(
      //             svgPath: ImageConstant.imgArrowrightPrimary))),
    );
  }

  Widget cardWidget(
      {required BuildContext context,
      required String iconPath,
      lable,
      value,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              svgPath: iconPath,
              color: AppColors.appBarTextColor,
              width: 30,
              height: 30,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              lable,
              style: TextStyle(
                  color: AppColors.appBarTextColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              value,
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
            )
          ],
        ),
      ),
    );
  }
}
