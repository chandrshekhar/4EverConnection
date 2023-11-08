import 'package:forever_connection/Feature/Connection/Controller/connection_controller.dart';
import 'package:forever_connection/Feature/Connection/Controller/connection_validation.dart';
import 'package:forever_connection/Feature/request_service_one_screen/Controller/reqiest_service_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/widgets/phone_number_formating_widget.dart';
import 'package:forever_connection/widgets/search_drpdown.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';

import '../../../core/utils/address_autocomplete_widget.dart';

// ignore_for_file: must_be_immutable
class CreateConnectionScreen extends StatefulWidget {
  const CreateConnectionScreen({Key? key}) : super(key: key);

  @override
  State<CreateConnectionScreen> createState() => _CreateConnectionScreenState();
}

class _CreateConnectionScreenState extends State<CreateConnectionScreen> {
  final requestServiceController = Get.put(RequestServiceController());
  final connectionController = Get.put(ConnectionController());
  final validationController = Get.put(ConnectionValidationController());

  final firstNameKey = GlobalKey<FormState>();
  final lastNameKey = GlobalKey<FormState>();
  final phoneKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final homeKey = GlobalKey<FormState>();
  final zipKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // Initialize the selected value
    requestServiceController.getServiceProfssional();
    connectionController.clearAllField();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.lightBlue50,
      appBar: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarImage(
              svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
              margin: EdgeInsets.only(left: 24.h, top: 22.v, bottom: 28.v),
              onTap: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Create Connection"),
          styleType: Style.bgShadow),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 5.v),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.v),
              decoration: AppDecoration.outlineBlack
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.v),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgSettings,
                              height: 18.adaptSize,
                              width: 18.adaptSize,
                              margin: EdgeInsets.only(top: 25.v, right: 15)),
                          Expanded(
                            child: SearchDropDownWidget(
                              fromWhere: "service",
                              lableName: "Service need",
                              list: requestServiceController.listOfServices,
                              controller: connectionController
                                  .searchServiceController.value,
                              suggestionsCallback: (pattern) {
                                return requestServiceController.listOfServices
                                    .where((item) => item.name!
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase()))
                                    .toList();
                              },
                              onSuggestionSelected: (suggestion) async {
                                connectionController.searchServiceController
                                    .value.text = suggestion.name.toString();
                                connectionController.serviceId(suggestion.id);
                                await requestServiceController
                                    .getPartnerByServiceId(suggestion.id);
                              },
                            ),
                          ),
                        ]),
                    SizedBox(height: 29.v),
                    Obx(
                      () => requestServiceController.isPartnerLoading.value
                          ? Center(
                              child: LottieBuilder.asset(
                                "assets/lottie/linear_loader.json",
                                height: 60,
                              ),
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgUser,
                                    height: 19.v,
                                    width: 17.h,
                                    margin:
                                        EdgeInsets.only(top: 25.v, right: 15)),
                                Expanded(
                                  child: Obx(
                                    () => SearchDropDownWidget(
                                      fromWhere: "partner",
                                      lableName: "Select Partner",
                                      list:
                                          requestServiceController.partnerList,
                                      controller: connectionController
                                          .searchPartnerController.value,
                                      suggestionsCallback: (pattern) {
                                        return requestServiceController
                                            .partnerList
                                            .where((item) => item.fullName!
                                                .toLowerCase()
                                                .contains(
                                                    pattern.toLowerCase()))
                                            .toList();
                                      },
                                      onSuggestionSelected: (suggestion) async {
                                        connectionController
                                                .searchPartnerController
                                                .value
                                                .text =
                                            suggestion.fullName.toString();
                                        connectionController
                                            .setPartnerId(suggestion.id);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 29.v),
                    Form(
                      key: firstNameKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: CustomTextFormField(
                          controller:
                              connectionController.firstNameController.value,
                          margin: EdgeInsets.only(
                              left: 12.h, top: 0.v, right: 12.h),
                          hintText: "First name *",
                          labelText: "First name *",
                          textInputAction: TextInputAction.done,
                          maxLines: 1,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 11.h, vertical: 17.v),
                          borderDecoration: const OutlineInputBorder(),
                          filled: false,
                          onChange: (value) {
                            validationController.setFirstNameValidation(value);
                            validationController.checkButtonValidation();
                          },
                          validator: (value) {
                            if (value!.length < 4) {
                              return "First name must have 4 character";
                            } else {
                              return null;
                            }
                          },
                          fillColor: theme.colorScheme.primary),
                    ),
                    CustomTextFormField(
                        controller:
                            connectionController.middleNameController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "Middle name (if Any)",
                        labelText: "Middle name (if Any)",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    Form(
                      key: lastNameKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: CustomTextFormField(
                          controller:
                              connectionController.lastNameController.value,
                          margin: EdgeInsets.only(
                              left: 12.h, top: 15.v, right: 12.h),
                          hintText: "Last name *",
                          labelText: "Last name *",
                          textInputAction: TextInputAction.done,
                          maxLines: 1,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 11.h, vertical: 17.v),
                          borderDecoration: OutlineInputBorder(),
                          filled: false,
                          onChange: (value) {
                            validationController.setLastNameValidation(value);
                            validationController.checkButtonValidation();
                          },
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Last name must have 2 character";
                            } else {
                              return null;
                            }
                          },
                          fillColor: theme.colorScheme.primary),
                    ),
                    Container(
                        decoration: BoxDecoration(border: Border.all()),
                        margin: EdgeInsets.symmetric(
                            horizontal: 13.h, vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: PhoneNumberTextFieldWidget(
                            c: 1,
                            phoneController:
                                connectionController.phoneController.value,
                            lable: "Phone Number")),
                    Form(
                      key: emailKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: CustomTextFormField(
                          controller: connectionController
                              .personalEmailController.value,
                          margin: EdgeInsets.only(
                              left: 12.h, top: 15.v, right: 12.h),
                          hintText: "Personal Email *",
                          labelText: "Personal Email *",
                          textInputAction: TextInputAction.done,
                          maxLines: 1,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 11.h, vertical: 17.v),
                          borderDecoration: const OutlineInputBorder(),
                          filled: false,
                          onChange: (value) {
                            validationController.setEmailValidation(value);
                            validationController.checkButtonValidation();
                          },
                          validator: (value) {
                            if (!GetUtils.isEmail(value!)) {
                              return "Please enter valid email id";
                            } else {
                              return null;
                            }
                          },
                          fillColor: theme.colorScheme.primary),
                    ),
                    CustomTextFormField(
                        controller:
                            connectionController.businessNameController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "Business Name (If Any)",
                        labelText: "Business Name (If Any)",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: const OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    Form(
                      key: homeKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: CustomTextFormField(
                          readOnly: true,
                          onTap: () async {
                            var address = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddressAutoCompleteWidget(),
                              ),
                            );
                            connectionController
                                .homeAddressController.value.text = address;
                          },
                          controller:
                              connectionController.homeAddressController.value,
                          margin: EdgeInsets.only(
                              left: 12.h, top: 15.v, right: 12.h),
                          hintText: "Home Address *",
                          labelText: "Home Address *",
                          textInputAction: TextInputAction.done,
                          maxLines: 1,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 11.h, vertical: 17.v),
                          borderDecoration: const OutlineInputBorder(),
                          filled: false,
                          onChange: (value) {
                            // validationController
                            //     .setHomeAddressValidation(value);
                            // validationController.checkButtonValidation();
                          },
                          validator: (value) {
                            if (value!.length < 8) {
                              return "Home address must have atlease 8 character";
                            } else {
                              return null;
                            }
                          },
                          fillColor: theme.colorScheme.primary),
                    ),
                    CustomTextFormField(
                        maxLength: 10,
                        controller: connectionController.aptController.value,
                        margin:
                            EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                        hintText: "Apt, Ste",
                        labelText: "Apt, Ste",
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 17.v),
                        borderDecoration: const OutlineInputBorder(),
                        filled: false,
                        onChange: (value) {},
                        fillColor: theme.colorScheme.primary),
                    Form(
                      key: zipKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: CustomTextFormField(
                          controller: connectionController.zipController.value,
                          margin: EdgeInsets.only(
                              left: 12.h, top: 15.v, right: 12.h),
                          hintText: "ZIP *",
                          labelText: "ZIP *",
                          textInputAction: TextInputAction.done,
                          maxLines: 1,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 11.h, vertical: 17.v),
                          borderDecoration: const OutlineInputBorder(),
                          filled: false,
                          onChange: (value) {
                            validationController.setZipValidation(value);
                            validationController.checkButtonValidation();
                          },
                          validator: (value) {
                            if (value!.length < 4) {
                              return "Enter valid zip code";
                            } else {
                              return null;
                            }
                          },
                          fillColor: theme.colorScheme.primary),
                    ),
                    SizedBox(
                      height: 20.adaptSize,
                    ),
                    Obx(() => connectionController.isConnectionLoading.value
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : CustomElevatedButton(
                            onTap: validationController
                                        .isButtonStateChange.value ==
                                    false
                                ? null
                                : () {
                                    connectionController.addConnection(context);
                                  },
                            text: "Create Connection",
                            buttonStyle: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    validationController
                                                .isButtonStateChange.value ==
                                            false
                                        ? Colors.grey
                                        : AppColors.buttonColor)),
                            margin: EdgeInsets.only(
                                left: 24.h, right: 24.h, bottom: 22.v),
                            rightIcon: Container(
                              margin: EdgeInsets.only(left: 16.h),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightPrimary),
                            ),
                          )),
                  ]),
            ),
          ),
          SizedBox(
            height: 20.adaptSize,
          )
        ]),
      ),
    );
  }
}
