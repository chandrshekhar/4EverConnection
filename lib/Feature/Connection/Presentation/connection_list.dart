import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Connection/Controller/connection_controller.dart';
import 'package:forever_connection/Feature/Connection/Model/connection_model.dart';
import 'package:forever_connection/Feature/Connection/Widget/connection_list_card_widget.dart';
import 'package:forever_connection/Feature/My%20Notes/Controller/my_notes_controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConnectionListScreen extends StatelessWidget {
  ConnectionListScreen({super.key});
  final connectionController = Get.put(ConnectionController());
  final myNotesController = Get.put(MyNotesController());

  @override
  Widget build(BuildContext context) {
    connectionController.getConnection();
    return Scaffold(
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
        title: AppbarTitle(text: "My Connections"),
        actions: [
          AppbarImage1(
              svgPath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 25.v))
        ],
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 32.v),
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
                                margin: EdgeInsets.only(top: 3.v, bottom: 13.v),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                    // controller: passwordController,
                                    margin: EdgeInsets.only(left: 22.h),
                                    hintText: "Search connection",
                                    textInputType: TextInputType.name,
                                    onChange: (value) {
                                      if (value.toString().isNotEmpty) {
                                        Future.delayed(
                                            const Duration(milliseconds: 300),
                                            () {
                                          // Call your function here
                                          // connectionController.getConnection(
                                          //     searchText: value);
                                        });
                                      } else {
                                        Future.delayed(
                                            const Duration(milliseconds: 300),
                                            () {
                                          // Call your function here
                                          // myNotesController.getMyNotes(
                                          //     searchText: null);
                                        });
                                      }
                                    },
                                    obscureText: false),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Connections",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(() => connectionController.connectionList.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.only(
                        left: 23.adaptSize, right: 23.adaptSize),
                    itemCount: connectionController.connectionList.value.length,
                    itemBuilder: (context, index) {
                      var item = connectionController.connectionList[index];
                      return ConnectionListWidget(
                        onSeleted: (p0) async {
                          switch (p0) {
                            case "Email":
                              await connectionController
                                  .launchEmail(item.email ?? "");
                              break;
                            case "Resend":
                              break;
                            case "Call":
                              await connectionController
                                  .launchPhoneDialer(item.mobilePhone ?? "");
                              break;
                          }
                        },
                        dateTime:
                            myNotesController.dateTime(item.dateCreated ?? ""),
                        description: "",
                        notesTitle:
                            "${item.firstName ?? ""} ${item.middleName ?? ""} ${item.lastName ?? ""}",
                        author:
                            item.userCreated == null ? "Pending" : "Accepted",
                        addButtonTap: () {
                          _showBottomSheet(
                              context: context, connectionModel: item);
                        },
                      );
                    },
                  )
                : connectionController.isLoading.value
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : const Center(child: Text("No notes found"))),
          )
        ],
      ),
    );
  }
}

void _showBottomSheet(
    {required BuildContext context, required ConnectionModel connectionModel}) {
  showModalBottomSheet(
    useSafeArea: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.adaptSize),
            topRight: Radius.circular(15.adaptSize))),
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _bottomSheetWidget(
                  lableName: "ID", value: connectionModel.id.toString()),
              _bottomSheetWidget(
                  lableName: "Created Date",
                  value: DateFormat("yyyy-MM-dd").format(
                      DateTime.parse(connectionModel.dateCreated ?? ""))),
              _bottomSheetWidget(
                  lableName: "Service",
                  value: connectionModel.serviceName ?? ""),
              _bottomSheetWidget(
                  lableName: "Prefred Partner",
                  value: connectionModel.preferredPartnerName ?? ""),
              _bottomSheetWidget(
                  lableName: "First Name",
                  value: connectionModel.firstName ?? ""),
              _bottomSheetWidget(
                  lableName: "Middle Name",
                  value: connectionModel.middleName ?? ""),
              _bottomSheetWidget(
                  lableName: "Last Name",
                  value: connectionModel.lastName ?? ""),
              _bottomSheetWidget(
                  lableName: "Mobile Phone",
                  value: connectionModel.mobilePhone ?? ""),
              _bottomSheetWidget(
                  lableName: "Personal Email",
                  value: connectionModel.email ?? ""),
              _bottomSheetWidget(
                  lableName: "Business Name",
                  value: connectionModel.companyName ?? ""),
              _bottomSheetWidget(
                  lableName: "Home Address",
                  value: connectionModel.homeAddress ?? ""),
              _bottomSheetWidget(
                  lableName: "Apt", value: connectionModel.homeApt ?? ""),
              _bottomSheetWidget(
                  lableName: "ZIP", value: connectionModel.homeZip ?? ""),
              _bottomSheetWidget(
                  lableName: "Additional Information",
                  value: connectionModel.additional ?? ""),
            ],
          ),
        ),
      );
    },
  );
}

_bottomSheetWidget({
  required String lableName,
  required String value,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        lableName,
        style: TextStyle(
            color: AppColors.floatingActionButtonColor,
            fontWeight: FontWeight.w500,
            fontSize: 18.adaptSize),
      ),
      SizedBox(
        height: 5.h,
      ),
      Container(
        height: lableName.contains("Additional Information") ? 100 : 48,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: AppColors.greyTextColor.withOpacity(0.03),
            border: Border.all(color: AppColors.greyTextColor, width: 1)),
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.adaptSize, top: 18.adaptSize),
              child: Text(
                value,
              ),
            )),
      ),
      SizedBox(
        height: 10.h,
      ),
    ],
  );
}
