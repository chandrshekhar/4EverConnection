import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/theme/theme_helper.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/custom_text_form_field.dart';
import '../Documents Vault controller/documents_vault_controller.dart';
import '../../../core/constants/colors.dart';

// ignore: must_be_immutable
class DocumentVaultDataTable extends StatelessWidget {
  DocumentVaultDataTable({Key? key, required this.documentsVaultController})
      : super(key: key);
  DocumentsVaultController documentsVaultController;

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 0,
      rightHandSideColumnWidth: 700.w,
      isFixedHeader: true,
      headerWidgets: _getTitleWidget(),
      leftSideItemBuilder: _generateFirstColumnRow,
      rightSideItemBuilder: _generateRightHandSideColumnRow,
      itemCount: documentsVaultController.documentVaultList.length,
      // rowSeparatorWidget: const Divider(
      //   color: Colors.black38,
      //   height: 1.0,
      //   thickness: 0.0,
      // ),
      leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      itemExtent: 40.h,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Termination', 0),
      _getTitleItemWidget('Action', 80),
      _getTitleItemWidget('Upload Date', 150),
      _getTitleItemWidget('Document Name', 200),
      _getTitleItemWidget('Description', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width.w,
      height: 40.h,
      alignment: Alignment.center,
      color: AppColors.floatingActionButtonColor,
      child: Text(label,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container();
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Container(
      color: (index % 2 == 0) ? Colors.white : AppColors.bgColor,
      padding: EdgeInsets.symmetric(vertical: (index % 2 != 0) ? 4.h : 0),
      child: Row(
        children: <Widget>[
          Container(
            height: 30.h,
            width: 80.w,
            child: PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                // position: PopupMenuPosition.under,
                onSelected: null,
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.blueGrey,
                ), // Icon for the button
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    // Define the menu items
                    PopupMenuItem<String>(
                      onTap: () async {
                        var url = documentsVaultController
                            .documentVaultList[index].file!;
                        if (await canLaunch(url)) {
                          await launch(url,
                              forceSafariVC: false, forceWebView: false);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            color: AppColors.lightBlue,
                            size: 15.sp,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'View',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () async {
                        documentsVaultController.download2(
                            documentsVaultController
                                .documentVaultList[index].file!);
                      },
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.download,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Download',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () async {
                        var emailUrl = "pandey211998@gmail.com";

                        await launch(emailUrl);
                      },
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Email',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {
                        documentsVaultController.printDocument(
                            documentsVaultController
                                .documentVaultList[index].file!);
                      },
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.print,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Print',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      16), // Set the border radius for the dialog
                                ),
                                child: editDocumentVaultWidget(
                                    context,
                                    documentsVaultController
                                        .documentVaultList[index].id!,
                                    documentsVaultController
                                        .documentVaultList[index].name
                                        .toString(),
                                    documentsVaultController
                                        .documentVaultList[index]
                                        .description!));
                          },
                        );
                      },
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Edit',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {
                        AwesomeDialog(
                                btnOkColor: AppColors.buttonColor,
                                context: context,
                                dialogType: DialogType.question,
                                animType: AnimType.bottomSlide,
                                title: 'Remove',
                                desc: 'Are you sure to delete this vault?',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () async {
                                  await documentsVaultController
                                      .deleteDocumentVault(
                                          id: documentsVaultController
                                              .documentVaultList[index].id!);
                                },
                                barrierColor:
                                    AppColors.lightBlue.withOpacity(0.3),
                                descTextStyle: TextStyle(
                                    color: AppColors.buttonColor,
                                    fontSize: 15.sp),
                                titleTextStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp))
                            .show();
                      },
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      height: 40.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 15.sp,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Delete',
                            style: TextStyle(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                  ];
                }),
          ),
          Container(
            width: 150.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(DateFormat("yyyy-MM-dd").format(DateTime.parse(
                documentsVaultController
                    .documentVaultList[index].publicationDate
                    .toString()))),
          ),
          Container(
            width: 200.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(
              documentsVaultController.documentVaultList[index].typeName
                  .toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
          Container(
            width: 200.w,
            height: 30.h,
            alignment: Alignment.center,
            child: Text(
              documentsVaultController.documentVaultList[index].description
                  .toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget editDocumentVaultWidget(
      BuildContext context, int id, String name, String desc) {
    TextEditingController descController = TextEditingController(text: desc);
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10.h, width: 10.w),
                Text(
                  "Edit Description",
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(1.sp),
                    margin: EdgeInsets.all(15.sp),
                    color: AppColors.darkBlue,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomTextFormField(
              controller: descController,
              maxLines: 6,
              margin: EdgeInsets.all(8.sp),
              textInputAction: TextInputAction.newline,
              textInputType: TextInputType.multiline,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 11.h, vertical: 17),
              borderDecoration: OutlineInputBorder(
                borderSide: BorderSide(
                  color: appTheme.black900,
                  width: 1,
                ),
              ),
              filled: true,
              fillColor: theme.colorScheme.primary),
          InkWell(
            onTap: () async {
              await documentsVaultController.updateDocumentVaultDescription(
                  id: id, name: name, desc: descController.text);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: CustomElevatedButton(
              onTap: () async {
                // await documentsVaultController.updateDocumentVaultDescription(
                //     id: id, name: name, desc: desc);
                // Navigator.pop(context);
              },
              text: "Update",
              isDisabled: true,
              height: 40,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
