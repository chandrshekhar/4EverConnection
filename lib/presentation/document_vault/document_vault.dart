import 'package:flutter/material.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/size_utils.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:get/get.dart';

import '../../Controllers/Documents Vault controller/documents_vault_controller.dart';
import '../../routes/app_routes.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_image_1.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';

// ignore_for_file: must_be_immutable
class DocumentVaultScreen extends StatelessWidget {
  DocumentVaultScreen({Key? key}) : super(key: key);

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  final documentVaultController = Get.put(DocumentsVaultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            height: 40.v,
            leadingWidth: 44.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                margin: EdgeInsets.only(left: 24.h, top: 6.v, bottom: 12.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Document Vault"),
            actions: [
              AppbarImage1(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
                  },
                  svgPath: ImageConstant.imgCart,
                  margin: EdgeInsets.fromLTRB(24.h, 1.v, 24.h, 6.v))
            ]),
        backgroundColor: const Color(0xFFE4F5FF),
        body: Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.h),
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 30.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgFile,
                          height: 19.v,
                          width: 17.h,
                          margin: EdgeInsets.only(top: 2.v, bottom: 13.v)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropDown(
                              width: 300.h,
                              icon: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 10.v, 15.h, 10.v),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgVectorGray6004x7)),
                              margin: EdgeInsets.only(left: 22.h),
                              hintText: "Select professional",
                              items: dropdownItemList,
                              borderDecoration:
                                  DropDownStyleHelper.underLineBlack,
                              onChanged: (value) {}),
                          SizedBox(height: 12.h),
                          CustomElevatedButton(
                              width: 167.h,
                              buttonStyle: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      const Color(0xFF6B6B6B)),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xffe1f1fb))),
                              text: "Cancel",
                              buttonTextStyle: TextStyle(
                                  fontSize: 18.h,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF6B6B6B)),
                              leftIcon: const Icon(Icons.file_copy_sharp,
                                  color: Color(0xFF6B6B6B))),
                        ],
                      )
                    ]),
              ),
              const Text("Documents Vault",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )),
              Obx(
                () => documentVaultController.isLoadingDocument == true
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : documentVaultController.documentValultDataList.isEmpty
                        ? const Center(
                            child: Text("No Data Found!"),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: documentVaultController
                                  .documentValultDataList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 260.h,
                                  margin: EdgeInsets.symmetric(vertical: 5.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        minLeadingWidth: 12.h,
                                        leading: CustomImageView(
                                          svgPath: ImageConstant.imgCalendar,
                                        ),
                                        title: const Text("Upload Date",
                                            style: TextStyle(
                                              color: Color(0xFF6B6B6B),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        subtitle: Text(
                                            documentVaultController
                                                .documentValultDataList[index]
                                                .publicationDate
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF1E1E1E),
                                              fontWeight: FontWeight.w400,
                                            )),
                                        trailing: const Icon(Icons.more_vert),
                                      ),
                                      ListTile(
                                        minLeadingWidth: 12.h,
                                        leading: CustomImageView(
                                          svgPath: ImageConstant.imgUser,
                                        ),
                                        title: const Text("Document Name",
                                            style: TextStyle(
                                              color: Color(0xFF6B6B6B),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        subtitle: Text(
                                            documentVaultController
                                                .documentValultDataList[index]
                                                .name
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF1E1E1E),
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ),
                                      ListTile(
                                        minLeadingWidth: 12.h,
                                        leading: CustomImageView(
                                          svgPath: ImageConstant.imgEdit,
                                        ),
                                        title: const Text("Description",
                                            style: TextStyle(
                                              color: Color(0xFF6B6B6B),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        subtitle: Text(
                                            documentVaultController
                                                .documentValultDataList[index]
                                                .description
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF1E1E1E),
                                              fontWeight: FontWeight.w400,
                                            )),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
              )
            ],
          ),
        ));
  }
}
