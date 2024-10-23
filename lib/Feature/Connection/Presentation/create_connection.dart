import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Connection/Controller/connection_controller.dart';
import 'package:forever_connection/Feature/Connection/Controller/connection_validation.dart';
import 'package:forever_connection/Feature/Contact/Controller/add_contact_controller.dart';
import 'package:forever_connection/Feature/Request%20Service/Controller/reqiest_service_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/address_search.dart';
import 'package:forever_connection/core/utils/place_service.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:forever_connection/theme/app_decoration.dart';
import 'package:forever_connection/theme/theme_helper.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image_1.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_image_view.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:forever_connection/widgets/phone_number_formating_widget.dart';
import 'package:forever_connection/widgets/search_drpdown.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

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
  final contactControllers = Get.put(AddContactController());

  final firstNameKey = GlobalKey<FormState>();
  final lastNameKey = GlobalKey<FormState>();
  final phoneKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final homeKey = GlobalKey<FormState>();
  final zipKey = GlobalKey<FormState>();
  final focus = FocusNode();

  @override
  void initState() {
    super.initState();
    // Initialize the selected value
    requestServiceController.getServiceProfssional();
    connectionController.clearAllField();
    contactControllers.getContactList(search: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.lightBlue50,
      appBar: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarImage(
              svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
              margin: EdgeInsets.only(left: 24.h, top: 22.h, bottom: 28.h),
              onTap: () {
                Navigator.pop(context);
              }),
          actions: [
            AppbarImage1(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.notificationsScreen);
                },
                svgPath: ImageConstant.imgCart,
                margin: EdgeInsets.fromLTRB(24.w, 1.h, 24.w, 6.h)),
          ],
          centerTitle: true,
          title: AppbarTitle(text: "Create Connection"),
          styleType: Style.bgShadow),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 5.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.h),
              decoration: AppDecoration.outlineBlack
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 15.v),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.myservice,
                              height: 18.h,
                              width: 18.w,
                              color: Colors.black,
                              margin: EdgeInsets.only(top: 25.h, right: 15.w)),
                          Expanded(
                            child: SearchDropDownWidget(
                              onClearPressed: () {
                                connectionController
                                    .searchServiceController.value
                                    .clear();
                                connectionController.serviceId(-1);
                              },
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
                    // SizedBox(height: 10.v),
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
                                    height: 19.h,
                                    width: 17.h,
                                    margin: EdgeInsets.only(
                                        top: 25.h, right: 15.w)),
                                Expanded(
                                  child: Obx(
                                    () => SearchDropDownWidget(
                                      onClearPressed: () {
                                        connectionController
                                            .searchPartnerController.value
                                            .clear();
                                        connectionController.setPartnerId(-1);
                                      },
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

                    SizedBox(height: 15.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUser,
                            height: 19.h,
                            width: 17.w,
                            margin: EdgeInsets.only(top: 25.h, right: 15.w)),
                        Expanded(
                          child: Obx(
                            () => SearchDropDownWidget(
                              onClearPressed: () {
                                connectionController.contactController.value
                                    .clear();
                                connectionController.setContactId(-1);
                              },
                              fromWhere: "contact",
                              lableName: "Select from my contact",
                              list: contactControllers.contactModelList,
                              controller:
                                  connectionController.contactController.value,
                              suggestionsCallback: (pattern) {
                                return contactControllers.contactModelList
                                    .where((item) =>
                                        "${item.firstName!} ${item.lastName!}"
                                            .toLowerCase()
                                            .contains(pattern.toLowerCase()))
                                    .toList();
                              },
                              onSuggestionSelected: (suggestion) async {
                                connectionController
                                    .setContactId(suggestion.id);
                                connectionController
                                        .contactController.value.text =
                                    "${suggestion.firstName} ${suggestion.lastName}";
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Obx(
                      () => connectionController.contactId.value != -1
                          ? const SizedBox.shrink()
                          : Column(
                              children: [
                                Form(
                                  key: firstNameKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgUser,
                                          height: 18.h,
                                          width: 18.w,
                                          color: Colors.black,
                                          margin: EdgeInsets.only(
                                              top: 18.h, right: 15.w)),
                                      Expanded(
                                        child: CustomTextFormField(
                                            controller: connectionController
                                                .firstNameController.value,
                                            // margin: EdgeInsets.only(
                                            //     left: 12.h, top: 0.v, right: 12.h),
                                            // hintText: "First name *",
                                            labelText: "First name *",
                                            textInputAction:
                                                TextInputAction.next,
                                            maxLines: 1,
                                            borderDecoration:
                                                const OutlineInputBorder(),
                                            filled: false,
                                            onChange: (value) {
                                              validationController
                                                  .setFirstNameValidation(
                                                      value);
                                              validationController
                                                  .checkButtonValidation();
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "First name will not Empty";
                                              } else {
                                                return null;
                                              }
                                            },
                                            fillColor:
                                                theme.colorScheme.primary),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgUser,
                                        height: 18.h,
                                        width: 18.w,
                                        color: Colors.black,
                                        margin: EdgeInsets.only(
                                            top: 18.h, right: 15)),
                                    Expanded(
                                      child: CustomTextFormField(
                                          controller: connectionController
                                              .middleNameController.value,

                                          // hintText: "Middle name (if Any)",
                                          labelText: "Middle name (if Any)",
                                          textInputAction: TextInputAction.next,
                                          maxLines: 1,
                                          borderDecoration:
                                              const OutlineInputBorder(),
                                          filled: false,
                                          onChange: (value) {},
                                          fillColor: theme.colorScheme.primary),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Form(
                                  key: lastNameKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgUser,
                                          height: 18.h,
                                          width: 18.w,
                                          color: Colors.black,
                                          margin: EdgeInsets.only(
                                              top: 18.h, right: 15.w)),
                                      Expanded(
                                        child: CustomTextFormField(
                                            controller: connectionController
                                                .lastNameController.value,

                                            // hintText: "Last name *",
                                            labelText: "Last name *",
                                            textInputAction:
                                                TextInputAction.next,
                                            maxLines: 1,
                                            filled: false,
                                            onChange: (value) {
                                              validationController
                                                  .setLastNameValidation(value);
                                              validationController
                                                  .checkButtonValidation();
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Last name must have 2 character";
                                              } else {
                                                return null;
                                              }
                                            },
                                            fillColor:
                                                theme.colorScheme.primary),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgCall,
                                        height: 18.h,
                                        width: 18.w,
                                        color: Colors.black,
                                        margin: EdgeInsets.only(
                                            top: 18.h, right: 15.w)),
                                    Expanded(
                                      child: PhoneNumberTextFieldWidget(
                                          c: 1,
                                          ignore: false,
                                          phoneController: connectionController
                                              .phoneController.value,
                                          lable: "Phone Number"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Form(
                                  key: emailKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgVector,
                                          height: 18.h,
                                          width: 18.w,
                                          color: Colors.black,
                                          margin: EdgeInsets.only(
                                              top: 18.h, right: 15.w)),
                                      Expanded(
                                        child: CustomTextFormField(
                                            textInputType:
                                                TextInputType.emailAddress,
                                            controller: connectionController
                                                .personalEmailController.value,

                                            // hintText: "Personal Email *",
                                            labelText: "Personal Email *",
                                            textInputAction:
                                                TextInputAction.next,
                                            maxLines: 1,
                                            borderDecoration:
                                                const OutlineInputBorder(),
                                            filled: false,
                                            onChange: (value) {
                                              validationController
                                                  .setEmailValidation(value);
                                              validationController
                                                  .checkButtonValidation();
                                            },
                                            validator: (value) {
                                              if (!GetUtils.isEmail(value!)) {
                                                return "Please enter valid email id";
                                              } else {
                                                return null;
                                              }
                                            },
                                            fillColor:
                                                theme.colorScheme.primary),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.myBusinessProfile,
                                        height: 18.h,
                                        width: 18.w,
                                        color: Colors.black,
                                        margin: EdgeInsets.only(
                                            top: 18.h, right: 15)),
                                    Expanded(
                                      child: CustomTextFormField(
                                          controller: connectionController
                                              .businessNameController.value,

                                          // hintText: "Business Name (If Any)",
                                          labelText: "Business Name (If Any)",
                                          textInputAction: TextInputAction.next,
                                          maxLines: 1,
                                          borderDecoration:
                                              const OutlineInputBorder(),
                                          filled: false,
                                          onChange: (value) {},
                                          fillColor: theme.colorScheme.primary),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Form(
                                  key: homeKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgLocation,
                                          height: 18.h,
                                          width: 18.w,
                                          color: Colors.black,
                                          margin: EdgeInsets.only(
                                              top: 18.h, right: 15.w)),
                                      Expanded(
                                        child: CustomTextFormField(
                                            readOnly: true,
                                            onTap: () async {
                                              // generate a new token here
                                              final sessionToken =
                                                  const Uuid().v4();
                                              final Suggestion? result =
                                                  await showSearch(
                                                context: context,
                                                delegate:
                                                    AddressSearch(sessionToken),
                                              );
                                              // This will change the text displayed in the TextField
                                              if (result != null) {
                                                final placeDetails =
                                                    await PlaceApiProvider(
                                                            sessionToken)
                                                        .getPlaceDetailFromId(
                                                            result.placeId);
                                                connectionController
                                                    .homeAddressController
                                                    .value
                                                    .text = result.description;
                                                connectionController
                                                        .zipController
                                                        .value
                                                        .text =
                                                    placeDetails.zipCode ?? "";
                                              }
                                              // ignore: use_build_context_synchronously
                                              FocusScope.of(context)
                                                  .requestFocus(focus);
                                            },
                                            controller: connectionController
                                                .homeAddressController.value,

                                            // hintText: "Home Address *",
                                            labelText: "Home Address *",
                                            textInputAction:
                                                TextInputAction.next,
                                            context: context,
                                            maxLines: 1,
                                            borderDecoration:
                                                const OutlineInputBorder(),
                                            filled: false,
                                            // onChange: (value) {
                                            // validationController
                                            //     .setHomeAddressValidation(value);
                                            // validationController.checkButtonValidation();
                                            // },
                                            validator: (value) {
                                              if (connectionController
                                                  .homeAddressController
                                                  .value
                                                  .text
                                                  .isEmpty) {
                                                return "Home address must have atlease 8 character";
                                              } else {
                                                return null;
                                              }
                                            },
                                            fillColor:
                                                theme.colorScheme.primary),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgLocation,
                                        height: 18.h,
                                        width: 18.w,
                                        color: Colors.black,
                                        margin: EdgeInsets.only(
                                            top: 18.h, right: 15.w)),
                                    Expanded(
                                      child: CustomTextFormField(
                                          focusNode: focus,
                                          controller: connectionController
                                              .aptController.value,
                                          // margin: EdgeInsets.only(
                                          //     left: 12.h, top: 15.v, right: 12.h),
                                          // hintText: "Apt, Ste",
                                          labelText: "Apt, Ste",
                                          textInputAction: TextInputAction.next,
                                          maxLines: 1,
                                          borderDecoration:
                                              const OutlineInputBorder(),
                                          filled: false,
                                          onChange: (value) {},
                                          fillColor: theme.colorScheme.primary),
                                    ),
                                    Form(
                                      key: zipKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: Expanded(
                                        child: CustomTextFormField(
                                            controller: connectionController
                                                .zipController.value,
                                            margin: EdgeInsets.only(
                                              left: 12.h,
                                            ),
                                            // hintText: "ZIP *",
                                            labelText: "ZIP *",
                                            textInputAction:
                                                TextInputAction.next,
                                            maxLines: 1,
                                            textInputType: TextInputType.number,
                                            borderDecoration:
                                                const OutlineInputBorder(),
                                            filled: false,
                                            onChange: (value) {
                                              validationController
                                                  .setZipValidation(value);
                                              validationController
                                                  .checkButtonValidation();
                                            },
                                            validator: (value) {
                                              if (value!.length < 4) {
                                                return "Enter valid zip code";
                                              } else {
                                                return null;
                                              }
                                            },
                                            fillColor:
                                                theme.colorScheme.primary),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgEdit,
                                        height: 18.h,
                                        width: 18.w,
                                        color: Colors.black,
                                        margin: EdgeInsets.only(
                                            top: 18.h, right: 15.w)),
                                    Expanded(
                                      child: CustomTextFormField(
                                          controller: connectionController
                                              .additionalController.value,

                                          // hintText: "ZIP *",
                                          labelText:
                                              "Additonal Information (optional)",
                                          textInputAction:
                                              TextInputAction.newline,
                                          maxLines: 2,
                                          textInputType:
                                              TextInputType.multiline,
                                          borderDecoration:
                                              const OutlineInputBorder(),
                                          filled: false,
                                          onChange: (value) {
                                            validationController
                                                .setZipValidation(value);
                                            validationController
                                                .checkButtonValidation();
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
                                  ],
                                ),
                              ],
                            ),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(() => connectionController.contactId.value == -1
                        ? connectionController.isConnectionLoading.value
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : CustomElevatedButton(
                                onTap: validationController
                                            .isButtonStateChange.value ==
                                        false
                                    ? null
                                    : () {
                                        connectionController
                                            .addConnection(context);
                                      },
                                text: "Create Connection",
                                buttonStyle: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        validationController.isButtonStateChange
                                                    .value ==
                                                false
                                            ? Colors.grey
                                            : AppColors.buttonColor)),
                                margin: EdgeInsets.only(
                                    left: 24.w, right: 24.w, bottom: 22.h),
                                rightIcon: Container(
                                  margin: EdgeInsets.only(left: 16.h),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgArrowrightPrimary),
                                ),
                              )
                        : connectionController.isContactUploding.value
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : CustomElevatedButton(
                                onTap: () {
                                  connectionController
                                      .userContactConnect(context);
                                      
                                },
                                text: "Create Connection",
                                buttonStyle: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        AppColors.buttonColor)),
                                margin: EdgeInsets.only(
                                    left: 24.w, right: 24.w, bottom: 22.h),
                                rightIcon: Container(
                                  margin: EdgeInsets.only(left: 16.h),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgArrowrightPrimary),
                                ),
                              ))
                  ]),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ]),
      ),
    );
  }
}
