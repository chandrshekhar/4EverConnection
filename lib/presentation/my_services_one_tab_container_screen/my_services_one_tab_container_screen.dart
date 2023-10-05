import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/presentation/my_services_one_page/my_services_one_page.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';

class MyServicesOneTabContainerScreen extends StatefulWidget {
  const MyServicesOneTabContainerScreen({Key? key}) : super(key: key);

  @override
  MyServicesOneTabContainerScreenState createState() =>
      MyServicesOneTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class MyServicesOneTabContainerScreenState
    extends State<MyServicesOneTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 13.v),
                      decoration: AppDecoration.outlineBlack,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        CustomAppBar(
                            height: 31.v,
                            leadingWidth: 44.h,
                            leading: AppbarImage(
                                svgPath:
                                    ImageConstant.imgArrowleftOnerrorcontainer,
                                margin: EdgeInsets.only(
                                    left: 24.h, top: 6.v, bottom: 12.v),
                                onTap: () {
                                  onTapArrowleftone(context);
                                }),
                            centerTitle: true,
                            title: AppbarTitle(text: "My Services"),
                            actions: [
                              AppbarImage1(
                                  svgPath: ImageConstant.imgCart,
                                  margin:
                                      EdgeInsets.fromLTRB(24.h, 1.v, 24.h, 6.v))
                            ]),
                        SizedBox(height: 29.v),
                        Container(
                            height: 40.v,
                            width: 342.h,
                            child: TabBar(
                                controller: tabviewController,
                                labelPadding: EdgeInsets.zero,
                                labelColor: appTheme.lightBlue90001,
                                labelStyle: TextStyle(
                                    fontSize: 12.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                                unselectedLabelColor: theme.colorScheme.primary,
                                unselectedLabelStyle: TextStyle(
                                    fontSize: 12.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.h),
                                    border: Border.all(
                                        color: appTheme.lightBlue90001,
                                        width: 1.h)),
                                tabs: [
                                  Tab(child: Text("Services in Progress")),
                                  Tab(child: Text("Completed Services"))
                                ])),
                        SizedBox(height: 13.v)
                      ])),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              decoration: AppDecoration.fillLightblue50,
                              child: SizedBox(
                                  height: 1108.v,
                                  child: TabBarView(
                                      controller: tabviewController,
                                      children: [
                                        MyServicesOnePage(),
                                        MyServicesOnePage()
                                      ])))))
                ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
