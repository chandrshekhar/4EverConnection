import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/document_vault/Presentation/Widgets/document_vault_table.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/size_utils.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/search_drpdown.dart';
import 'package:get/get.dart';
import '../Documents Vault controller/documents_vault_controller.dart';
import '../../../core/constants/colors.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/app_bar/appbar_image.dart';
import '../../../widgets/app_bar/appbar_image_1.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/custom_bottom_modal_sheet.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_image_view.dart';

// ignore_for_file: must_be_immutable
class DocumentVaultScreen extends StatefulWidget {
  DocumentVaultScreen({Key? key}) : super(key: key);

  @override
  State<DocumentVaultScreen> createState() => _DocumentVaultScreenState();
}

class _DocumentVaultScreenState extends State<DocumentVaultScreen> {
  final documentVaultController = Get.put(DocumentsVaultController());

  @override
  void initState() {
    documentVaultController.getVaultDocumentList(query: "");
    documentVaultController.choosenFilename.value = "";
    documentVaultController.files.value = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            height: 60.v,
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
          padding: EdgeInsets.all(10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 8.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.h, vertical: 20.h),
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
                            Expanded(
                              child: Obx(
                                () => SearchDropDownWidget(
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
                                  onSuggestionSelected: (suggestion) {
                                    documentVaultController
                                        .setSearchValue(suggestion.name);
                                    documentVaultController
                                        .setDocumentId(suggestion.id);
                                  },
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(height: 15.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 32.h,
                              width: MediaQuery.of(context).size.width - 6,
                              padding: const EdgeInsets.only(left: 5),
                              // decoration: BoxDecoration(
                              //   border: Border.all(width: 0.5),
                              // ),
                              child: TextField(
                                controller: documentVaultController
                                    .documentDescControler.value,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("File description"),
                                    labelStyle: TextStyle(
                                        color: AppColors.greyTextColor)),
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
                                InkWell(
                                  onTap: () {
                                    // documentVaultController.pickFile();
                                    showCustomBottomSheet(
                                        context,
                                        '',
                                        SizedBox(
                                          height: 150,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.all(10),
                                              itemCount: documentVaultController
                                                  .chatPickerList.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    switch (index) {
                                                      case 0:
                                                        documentVaultController
                                                            .pickFile();
                                                        break;
                                                      case 1:
                                                        documentVaultController
                                                            .pickImageFromGallery();
                                                        break;
                                                      case 2:
                                                        documentVaultController
                                                            .pickImageFromCamera();
                                                        break;
                                                    }
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width: 60,
                                                          height: 60,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(18),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: AppColors
                                                                      .lightBlue),
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .circle),
                                                          child:
                                                              documentVaultController
                                                                  .chatPickerList[
                                                                      index]
                                                                  .icon,
                                                        ),
                                                        const SizedBox(
                                                            height: 9),
                                                        Text(
                                                          '${documentVaultController.chatPickerList[index].title}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ));
                                  },
                                  child: Text("Choose file",
                                      style: TextStyle(
                                          fontSize: 18.h,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF6B6B6B))),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: 21.h,
                                    width: 2,
                                    color: const Color(0xFF6B6B6B)),
                                Obx(
                                  () => Expanded(
                                    child: Text(documentVaultController
                                            .choosenFilename.value.isEmpty
                                        ? "No file chosen"
                                        : documentVaultController
                                            .choosenFilename.value
                                            .toString()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Obx(
                            () => documentVaultController.uplodDocument == true
                                ? const CircularProgressIndicator.adaptive()
                                : CustomElevatedButton(
                                    onTap: (documentVaultController
                                                    .choosenFilename.value !=
                                                "" ||
                                            documentVaultController
                                                    .files.value !=
                                                null)
                                        ? () {
                                            documentVaultController
                                                .addFileDocumentVault();
                                          }
                                        : () => null,
                                    width: 150.h,
                                    buttonStyle: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          documentVaultController
                                                          .choosenFilename
                                                          .value !=
                                                      "" ||
                                                  documentVaultController
                                                          .files.value !=
                                                      null
                                              ? AppColors
                                                  .floatingActionButtonColor
                                              : AppColors.greyTextColor
                                                  .withOpacity(0.5),
                                        )),
                                    text: "Upload",
                                    buttonTextStyle: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 18.h,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                          )
                        ],
                      )
                    ],
                  )),
              Row(
                children: [
                  const Text("Documents Vault",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 35,
                        child: TextField(
                            onChanged: (value) {
                              if (value.toString().isNotEmpty) {
                                Future.delayed(
                                    const Duration(milliseconds: 300), () {
                                  documentVaultController.getVaultDocumentList(
                                      query: value);
                                });
                              } else {
                                Future.delayed(
                                    const Duration(milliseconds: 300), () {
                                  documentVaultController.getVaultDocumentList(
                                      query: "");
                                });
                              }
                            },
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Search document",
                                border: OutlineInputBorder())),
                      ))
                ],
              ),
              SizedBox(height: 12.h),
              Expanded(
                  child: Obx(
                      () => documentVaultController.documentVaultList.isNotEmpty
                          ? DocumentVaultDataTable(
                              documentsVaultController: documentVaultController,
                            )
                          : const Center(
                              child: Text("No data"),
                            )))
            ],
          ),
        ));
  }
}
