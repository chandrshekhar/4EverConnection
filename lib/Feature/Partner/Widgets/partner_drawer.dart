import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forever_connection/Feature/Dashboard/Presentation/dashboard_screen.dart';
import 'package:forever_connection/Feature/Partner/Controller/main_dashboard_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/alery_dailog.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/widgets/custom_expation_tile.dart';
import 'package:get/get.dart';

class PartnerDrawer extends StatefulWidget {
  const PartnerDrawer({
    super.key,
  });

  @override
  State<PartnerDrawer> createState() => _PartnerDrawerState();
}

class _PartnerDrawerState extends State<PartnerDrawer> {
  final partnermainController = Get.put(PartnerMainDashboardController());

  int selectedInd = -1;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> subList = [
      {
        'title': "MANAGE",
        'leading': const Icon(Icons.person_outline),
        'children': <Widget>[
          InkWell(
            onTap: () {
              partnermainController.updateSelectedField(0);
              // Navigator.pushNamed(context, AppRoutes.requestServiceOneScreen);
            },
            child: Items(
              icon: ImageConstant.newServiceIcon,
              itemText: "Users",
              valueText: "(1280)",
            ),
          ),
          InkWell(
            onTap: () {
              partnermainController.updateSelectedField(1);
              Navigator.pushNamed(context, AppRoutes.myServicesScreen);
            },
            child: Items(
              icon: ImageConstant.myservice,
              itemText: "Marketing partners",
              valueText: "(1280)",
            ),
          ),
          InkWell(
            onTap: () {
              partnermainController.updateSelectedField(2);
              Navigator.pushNamed(context, AppRoutes.myProfileScreen);
            },
            child: Items(
              icon: ImageConstant.myprofile,
              itemText: "Partners",
              valueText: "(1280)",
            ),
          ),
          InkWell(
            onTap: () async {
              partnermainController.updateSelectedField(3);
              // await personalDetailsController.getMagicLink(context);
            },
            child: Items(
              icon: ImageConstant.myBusinessProfile,
              itemText: "Admins",
              valueText: "(1280)",
            ),
          ),
          InkWell(
            onTap: () {
              partnermainController.updateSelectedField(4);
              // Navigator.pushNamed(context, AppRoutes.myNotesListScreen);
            },
            child: Items(
              icon: ImageConstant.myNotes,
              itemText: "Brodcasters",
              valueText: "(1280)",
            ),
          ),
        ],
      },
      {
        'title': "Reports",
        'leading': const Icon(Icons.handshake_outlined),
        'children': <Widget>[
          InkWell(
            onTap: () {
              partnermainController.updateSelectedField(5);
              // Get.to(ConnectionMainScreen());
            },
            child: Items(
              icon: ImageConstant.connect,
              itemText: "item1",
            ),
          ),
          InkWell(
            onTap: () {
              // Get.to(const ConnectionListScreen());
              partnermainController.updateSelectedField(6);
            },
            child: Items(
              icon: ImageConstant.myConnection,
              itemText: "item2",
            ),
          ),
          InkWell(
            onTap: () {
              // Get.to(const MyWalletScreen());
              partnermainController.updateSelectedField(7);
            },
            child: Items(
              icon: ImageConstant.myWallet,
              itemText: "item3",
            ),
          ),
        ],
      },
      {
        'title': "General Settings",
        'leading': const Icon(Icons.construction_outlined),
        'children': <Widget>[
          InkWell(
            onTap: () {
              // myProfileController.getMagicLinkForPassSecurity(context);
              partnermainController.updateSelectedField(8);
            },
            child: Items(
              icon: ImageConstant.passwordandSecurity,
              itemText: "item1",
            ),
          ),
          InkWell(
            onTap: () {
              partnermainController.updateSelectedField(9);
              // Navigator.pop(context);

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (_) => WebViewScreen(
              //               webViewUrl:
              //                   "https://4everconnection.com/help/",
              //             )));
            },
            child: Items(
              icon: ImageConstant.support,
              itemText: "item2",
            ),
          ),
          InkWell(
            onTap: () {
              partnermainController.updateSelectedField(10);

              CustomAlretDialogs().comingSoonPopUp(
                  context, "COMING...", "Donate connection will Coming soon");
            },
            child: Items(
              icon: ImageConstant.donateConnection,
              itemText: "item3",
            ),
          ),
        ],
      }
    ];

    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.darkBlue,
        child: Column(
          children: [
            Container(
              color: AppColors.darkBlue,
              padding: EdgeInsets.only(
                  top: 20.h, left: 18.w, right: 16.w, bottom: 12.h),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Partner Menu",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                )
              ]),
            ),
            ListView.builder(
              key: Key(selectedInd.toString()),
              shrinkWrap: true,
              itemCount: subList.length,
              itemBuilder: (context, index) {
                return CustomExpansionPanel(
                    leading: subList[index]['leading'],
                    collapsedBackgroundColor: AppColors.darkBlue,
                    initiallyExpanded: index == selectedInd,
                    backgroundColor: Colors.blue[50],
                    onExpansionChanged: (value) {
                      if (value) {
                        setState(() {
                          selectedInd = index;
                        });

                        // myProfileController.setIndex(index);
                      } else {
                        // myProfileController.setIndex(-1);
                        setState(() {
                          selectedInd = -1;
                        });
                      }
                    },
                    title: subList[index]['title'],
                    children: subList[index]['children']);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                    (route) => false);
              },
              leading: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              title: Transform.translate(
                offset: Offset(-15.w, 0),
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items(
      {super.key, required this.icon, required this.itemText, this.valueText});
  final String icon;
  final String itemText;
  final String? valueText;

  final Color grayColor = const Color(0xffEBEEF0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 0.5.h, color: AppColors.darkBlue),
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  color: grayColor,
                  width: 40.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.sp, vertical: 16.sp),
                  child: SvgPicture.asset(
                    icon,
                    height: 15.h,
                    width: 15.h,
                    fit: BoxFit.fill,
                    color: AppColors.darkBlue,
                  )),
              SizedBox(
                width: 10.h,
              ),
              Text(
                itemText,
                style: TextStyle(fontSize: 16.sp, color: AppColors.darkBlue),
              ),
              const Spacer(),
              Text(
                valueText ?? '',
                style: TextStyle(fontSize: 16.sp, color: AppColors.darkBlue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
