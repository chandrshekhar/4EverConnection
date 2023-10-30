import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/document_vault/Controller/document_controller.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/size_utils.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/search_typeahead.dart';
import 'package:get/get.dart';

import '../../Controllers/Documents Vault controller/documents_vault_controller.dart';
import '../../core/constants/colors.dart';
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

  List<String> dropdownItemList = [
    "Birth Certificate",
    "Sociel Security",
    "State ID",
    "School ID",
    "Driver License",
    "Passport Book",
    "Passport Card",
    "Naturalization Certificate",
    "Greencard",
    "Employment Authorization",
    "marriage Certificate",
    "Divorce Decree",
    "Military ID",
    "Auto Insurance Card",
    "Life Insurance Card"
  ];

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
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                margin: EdgeInsets.only(bottom: 8.h),
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgFile,
                              height: 19.v,
                              width: 17.h,
                              margin: EdgeInsets.only(
                                  top: 25.v, bottom: 0.v, right: 15)),
                          Obx(
                            () => Expanded(
                              child: SearchDropDownWidget(
                                fromWhere: "service",
                                lableName: "Select Document Type",
                                list: documentVaultController.documentTypes,
                                controller: documentVaultController
                                    .searchForDocumentController.value,
                                suggestionsCallback: (pattern) {
                                  return documentVaultController.documentTypes
                                      .where((item) => item.name!
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()))
                                      .toList();
                                },
                                onSuggestionSelected: (suggestion) async {
                                  documentVaultController
                                      .searchForDocumentController
                                      .value
                                      .text = suggestion.name.toString();
                                  // requestServiceController
                                  //     .setServiceId(suggestion.id);
                                  // await requestServiceController
                                  //     .getPartnerByServiceId(suggestion.id);
                                },
                              ),
                            ),
                          ),
                        ]),
                    SizedBox(height: 15.h),
                    Container(
                        height: 32.h,
                        width: MediaQuery.of(context).size.width - 6,
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'File description',
                          ),
                        )),
                    SizedBox(height: 15.h),
                    Container(
                      width: MediaQuery.of(context).size.width - 6,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.file_copy),
                          SizedBox(width: 5.h),
                          Text("Choose file",
                              style: TextStyle(
                                  fontSize: 18.h,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF6B6B6B))),
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 21.h,
                              width: 2,
                              color: const Color(0xFF6B6B6B)),
                          const Text("No file chosen"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomElevatedButton(
                      width: 150.h,
                      buttonStyle: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                              const Color(0xFF6B6B6B)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffe1f1fb))),
                      text: "Upload",
                      buttonTextStyle: TextStyle(
                          fontSize: 18.h,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF6B6B6B)),
                    )
                  ],
                ),
              ),
              const Text("Documents Vault",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.darkBlue,
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 5),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text('Document Name',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('Description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('Action',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
              // const Divider(),
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
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  color: (index % 2 == 0)
                                      ? Colors.white
                                      : AppColors.bgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "G",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              "sf",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            )),
                                        const Expanded(
                                            flex: 2,
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: SizedBox(
                                                  width: 10,
                                                  height: 10,
                                                  child: Icon(Icons.more_vert)),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
              ),
            ],
          ),
        ));
  }
}
