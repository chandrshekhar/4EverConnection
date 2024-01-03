import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forever_connection/Feature/Contact/Controller/add_contact_controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/utils/address_search.dart';
import 'package:forever_connection/core/utils/place_service.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_drop_down.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:forever_connection/widgets/phone_number_formating_widget.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../Controller/contact_text_validation.dart';

// ignore_for_file: must_be_immutable
class AddContactScreen extends StatefulWidget {
  final bool isCommingFromEdit;

  const AddContactScreen({
    Key? key,
    required this.isCommingFromEdit,
  }) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final addController = Get.put(AddContactController());
  final formValidation = Get.put(ContactValidation());
  final firstNameKey = GlobalKey<FormState>();
  final lastNameKey = GlobalKey<FormState>();
  final phoneKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final homeKey = GlobalKey<FormState>();
  final zipKey = GlobalKey<FormState>();
  final focus = FocusNode();
  final focus2 = FocusNode();

  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(_formatDate);
    // Initialize the selected value
  }

  @override
  void dispose() {
    _controller.removeListener(_formatDate);
    _controller.dispose();
    super.dispose();
  }

  void _formatDate() {
    final text = _controller.text;
    if (text.length == 2 && !_controller.text.endsWith('/')) {
      _controller.text = '$text/';
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    } else if (text.length == 5 && !_controller.text.endsWith('/')) {
      _controller.text = '${text.substring(0, 5)}/';
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    }
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
          title: AppbarTitle(
              text:
                  widget.isCommingFromEdit ? "Edit Contact" : "Create Contact"),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.v),
                    Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.grey),
                          image: addController.networkImage.value.isNotEmpty
                              ? DecorationImage(
                                  image: addController.networkImage.value
                                          .contains("https://")
                                      ? NetworkImage(
                                              addController.networkImage.value)
                                          as ImageProvider
                                      : FileImage(File(
                                          addController.files.value!.path)),
                                  fit: BoxFit.cover)
                              : const DecorationImage(
                                  image: AssetImage("assets/images/user.png"),
                                  fit: BoxFit.fitHeight),
                        ),
                        //AssetImage("assets/images/user_female.jpg"),),),
                        height: 200,
                        width: 200,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PopupMenuButton<String>(
                              icon: Container(
                                padding: EdgeInsets.all(5.adaptSize),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.floatingActionButtonColor),
                                child: const Icon(
                                  Icons.menu, // Replace with your custom icon
                                  color: Colors.white, // Icon color
                                ),
                              ),
                              onSelected: (value) async {
                                // Handle the selected menu item
                                switch (value) {
                                  case 'Add':
                                    addController.pickImageFromGallery();
                                    break;
                                  case 'Delete':
                                    addController.choosenFilename.value = "";
                                    addController.files = Rx<File?>(null);
                                    break;
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                    value: 'Add',
                                    child: Text('Add'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'Delete',
                                    child: Text('Delete'),
                                  ),
                                ];
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 29.v),
                    iconWithTextField(
                      key: firstNameKey,
                      lableText: "First name *",
                      controller: addController.firstNameController.value,
                      icon: ImageConstant.imgUser,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "First name can't be empty.";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    iconWithTextField(
                      lableText: "Middle name (if Any)",
                      controller: addController.middleNameController.value,
                      icon: ImageConstant.imgUser,
                      validator: (value) {
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 16.adaptSize,
                    ),

                    iconWithTextField(
                      lableText: "Last name *",
                      controller: addController.lastNameController.value,
                      icon: ImageConstant.imgUser,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUser,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomDropDown(
                            borderDecoration: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            // margin: const EdgeInsets.only(left: 14, right: 14),
                            // contentPadding:
                            //     const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            items: const ["Male", "Female", "Other"],
                            onChanged: (value) {
                              addController.gender.value = value;
                            },
                            hintText: addController.gender.value.isEmpty
                                ? "Select gender"
                                : addController.gender.value,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    iconWithTextField(
                      readOnly: true,
                      textFieldTap: () {
                        addController.selectDate(context);
                      },
                      lableText: "Date of Birth",
                      controller: addController.dateOfBirthController.value,
                      icon: ImageConstant.imgCalendar,
                      validator: (value) {
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 16.adaptSize,
                    ),
                  
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUser,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomDropDown(
                            borderDecoration: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            items: addController.positionList,
                            onChanged: (value) {
                              addController.postionController.value.text =
                                  value;
                            },
                            hintText: addController
                                    .postionController.value.text.isNotEmpty
                                ? addController.postionController.value.text
                                : "Select position",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),

                    iconWithTextField(
                      lableText: "Occupation",
                      controller: addController.occupationController.value,
                      icon: ImageConstant.imgCarGray600,
                      validator: (value) {
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 16.adaptSize,
                    ),

                    iconWithTextField(
                      lableText: "Ideal Occupation",
                      controller: addController.idealOccupationController.value,
                      icon: ImageConstant.imgCarGray600,
                      validator: (value) {
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 16.adaptSize,
                    ),

                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgCall,
                            height: 15.adaptSize,
                            width: 15.adaptSize,
                            margin: EdgeInsets.only(top: 8.v, bottom: 13.v)),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: Obx(() => Form(
                                  key: phoneKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: PhoneNumberTextFieldWidget(
                                      onChange: (value) {
                                        formValidation
                                            .setPhoneNameValidation(value);
                                        formValidation.checkButtonValidation();
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Number is required";
                                        } else {
                                          return null;
                                        }
                                      },
                                      c: 1,
                                      ignore: false,
                                      phoneController: addController
                                          .mobilePhoneController.value,
                                      lable: "Mobile Number"),
                                )),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Form(
                    //         key: phoneKey,
                    //         autovalidateMode:
                    //             AutovalidateMode.onUserInteraction,
                    //         child: CustomTextFormField(
                    //             controller:
                    //                 addController.mobilePhoneController.value,
                    //             margin: EdgeInsets.only(
                    //                 left: 12.h, top: 0.v, right: 12),
                    //             hintText: "Mobile Phone",
                    //             labelText: "Mobile Phone",
                    //             textInputType: TextInputType.phone,
                    //             inputFormatters: [
                    //               FilteringTextInputFormatter.digitsOnly
                    //             ],
                    //             textInputAction: TextInputAction.done,
                    //             validator: (value) {
                    //               if (value!.isEmpty) {
                    //                 return "Phone can't be empty";
                    //               } else {
                    //                 return null;
                    //               }
                    //             },
                    //             maxLines: 1,
                    //             contentPadding: EdgeInsets.symmetric(
                    //                 horizontal: 20.h, vertical: 17.v),
                    //             borderDecoration: const OutlineInputBorder(),
                    //             filled: false,
                    //             onChange: (value) {},
                    //             fillColor: theme.colorScheme.primary),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 16.adaptSize,
                    // ),
                    iconWithTextField(
                      lableText: "Life Partner Name",
                      controller: addController.lifePartnerName.value,
                      icon: ImageConstant.imgUser,
                      validator: (value) {
                        return null;
                      },
                    ),

                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgCall,
                            height: 15.adaptSize,
                            width: 15.adaptSize,
                            margin: EdgeInsets.only(top: 8.v, bottom: 13.v)),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: PhoneNumberTextFieldWidget(
                                c: 1,
                                ignore: false,
                                phoneController:
                                    addController.lifePartnerPhone.value,
                                lable: "Life Partner Phone"),
                          ),
                        ),
                      ],
                    ),
                    // CustomTextFormField(
                    //     controller: addController.lifePartnerPhone.value,
                    //     margin:
                    //         EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                    //     hintText: "Life Partner Phone",
                    //     labelText: "Life Partner Phone",
                    //     textInputAction: TextInputAction.done,
                    //     maxLines: 1,
                    //     textInputType: TextInputType.phone,
                    //     inputFormatters: [
                    //       FilteringTextInputFormatter.digitsOnly
                    //     ],
                    //     contentPadding: EdgeInsets.symmetric(
                    //         horizontal: 11.h, vertical: 17.v),
                    //     borderDecoration: const OutlineInputBorder(),
                    //     filled: false,
                    //     onChange: (value) {},
                    //     fillColor: theme.colorScheme.primary),
                    SizedBox(
                      height: 16.adaptSize,
                    ),

                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgCall,
                            height: 15.adaptSize,
                            width: 15.adaptSize,
                            margin: EdgeInsets.only(top: 8.v, bottom: 13.v)),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: PhoneNumberTextFieldWidget(
                                c: 1,
                                ignore: false,
                                phoneController: addController.homePhone.value,
                                lable: "Home Phone"),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    iconWithTextField(
                      lableText: "Personal Email",
                      controller: addController.personalEmail.value,
                      icon: ImageConstant.imgVector,
                      validator: (value) {
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    iconWithTextField(
                      lableText: "Business Name",
                      controller: addController.businessNameController.value,
                      icon: ImageConstant.myBusinessProfile,
                      validator: (value) {
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    iconWithTextField(
                      lableText: "Business Email",
                      controller: addController.businessEmailController.value,
                      icon: ImageConstant.imgVector,
                      validator: (value) {
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    iconWithTextField(
                      lableText: "Business Fax",
                      controller: addController.businessFaxController.value,
                      icon: ImageConstant.imgVideocamera,
                      validator: (value) {
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 16.adaptSize,
                    ),

                    iconWithTextField(
                      lableText: "Website",
                      controller: addController.webSiteController.value,
                      icon: ImageConstant.imgGlobe,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),

                    Form(
                      key: homeKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Row(
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgLocation,
                              height: 15.adaptSize,
                              width: 15.adaptSize,
                              margin: EdgeInsets.only(
                                  top: 8.v, bottom: 13.v, right: 15)),
                          Expanded(
                            child: CustomTextFormField(
                                onTap: () async {
                                  // generate a new token here
                                  final sessionToken = const Uuid().v4();
                                  final Suggestion? result = await showSearch(
                                    context: context,
                                    delegate: AddressSearch(sessionToken),
                                  );
                                  // This will change the text displayed in the TextField
                                  if (result != null) {
                                    final placeDetails = await PlaceApiProvider(
                                            sessionToken)
                                        .getPlaceDetailFromId(result.placeId);
                                    addController.homeAddressController.value
                                        .text = result.description;
                                    addController.zipController.value.text =
                                        placeDetails.zipCode ?? "";
                                  }
                                  // ignore: use_build_context_synchronously
                                  FocusScope.of(context).requestFocus(focus);
                                },
                                controller:
                                    addController.homeAddressController.value,
                                // margin: EdgeInsets.only(
                                //     left: 12.h, top: 15.v, right: 12.h),
                                // hintText: "Home Address *",
                                labelText: "Home Address *",
                                textInputAction: TextInputAction.done,
                                maxLines: 1,
                                // contentPadding: EdgeInsets.symmetric(
                                //     horizontal: 11.h, vertical: 7.v),
                                borderDecoration: const OutlineInputBorder(),
                                filled: false,
                                onChange: (value) {
                                  formValidation
                                      .setHomeAddressValidation(value);
                                  formValidation.checkButtonValidation();
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: 15.adaptSize,
                                  width: 15.adaptSize,
                                  margin: EdgeInsets.only(
                                      top: 8.v, bottom: 13.v, right: 15)),
                              Expanded(
                                child: CustomTextFormField(
                                    controller:
                                        addController.aptController.value,
                                    focusNode: focus,
                                    // margin: EdgeInsets.only(
                                    //     left: 12.h, top: 15.v, right: 12.h),
                                    // hintText: "Apt, Ste",
                                    labelText: "Apt, Ste",
                                    textInputAction: TextInputAction.done,
                                    maxLines: 1,
                                    // contentPadding: EdgeInsets.symmetric(
                                    //     horizontal: 11.h, vertical: 7.v),
                                    borderDecoration:
                                        const OutlineInputBorder(),
                                    filled: false,
                                    onChange: (value) {},
                                    fillColor: theme.colorScheme.primary),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.adaptSize,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: 15.adaptSize,
                                  width: 15.adaptSize,
                                  margin: EdgeInsets.only(
                                    top: 8.v,
                                    bottom: 13.v,
                                  )),
                              Expanded(
                                child: Form(
                                  key: zipKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: CustomTextFormField(
                                      controller:
                                          addController.zipController.value,
                                      margin: EdgeInsets.only(
                                        left: 12.h,
                                      ),
                                      // hintText: "ZIP *",
                                      labelText: "ZIP *",
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.number,
                                      maxLines: 1,
                                      // contentPadding: EdgeInsets.symmetric(
                                      //     horizontal: 11.h, vertical: 7.v),
                                      borderDecoration:
                                          const OutlineInputBorder(),
                                      filled: false,
                                      onChange: (value) {
                                        formValidation.setZipValidation(value);
                                        formValidation.checkButtonValidation();
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgLocation,
                            height: 15.adaptSize,
                            width: 15.adaptSize,
                            margin: EdgeInsets.only(top: 8.v, bottom: 13.v)),
                        Expanded(
                          child: CustomTextFormField(
                              onTap: () async {
                                // generate a new token here
                                final sessionToken = const Uuid().v4();
                                final Suggestion? result = await showSearch(
                                  context: context,
                                  delegate: AddressSearch(sessionToken),
                                );
                                // This will change the text displayed in the TextField
                                if (result != null) {
                                  final placeDetails =
                                      await PlaceApiProvider(sessionToken)
                                          .getPlaceDetailFromId(result.placeId);
                                  addController.businessAddressController.value
                                      .text = result.description;
                                  addController.businessZipController.value
                                      .text = placeDetails.zipCode ?? "";
                                }
                                // ignore: use_build_context_synchronously
                                FocusScope.of(context).requestFocus(focus2);
                              },
                              controller:
                                  addController.businessAddressController.value,
                              margin: EdgeInsets.only(left: 12.h, top: 15.v),
                              // hintText: "Business Address *",
                              labelText: "Business Address *",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              // contentPadding: EdgeInsets.symmetric(
                              //     horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {
                                formValidation.setHomeAddressValidation(value);
                                formValidation.checkButtonValidation();
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
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: 15.adaptSize,
                                  width: 15.adaptSize,
                                  margin: EdgeInsets.only(
                                      top: 8.v, bottom: 13.v, right: 15)),
                              Expanded(
                                child: CustomTextFormField(
                                    focusNode: focus2,
                                    controller: addController
                                        .businessAptController.value,
                                    // margin: EdgeInsets.only(
                                    //     left: 12.h, top: 5.v, right: 12.h),
                                    // hintText: "Apt, Ste",
                                    labelText: "Apt, Ste",
                                    textInputAction: TextInputAction.done,
                                    maxLines: 1,
                                    // contentPadding: EdgeInsets.symmetric(
                                    //     horizontal: 11.h, vertical: 7.v),
                                    borderDecoration:
                                        const OutlineInputBorder(),
                                    filled: false,
                                    onChange: (value) {},
                                    fillColor: theme.colorScheme.primary),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.adaptSize,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: 15.adaptSize,
                                  width: 15.adaptSize,
                                  margin: EdgeInsets.only(
                                      top: 8.v, bottom: 13.v, right: 15)),
                              Expanded(
                                child: CustomTextFormField(
                                    controller: addController
                                        .businessZipController.value,
                                    // margin: EdgeInsets.only(
                                    //   left: 12.h,
                                    // ),
                                    // hintText: "ZIP *",
                                    labelText: "ZIP *",
                                    textInputType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    textInputAction: TextInputAction.done,
                                    maxLines: 1,
                                    // contentPadding: EdgeInsets.symmetric(
                                    //     horizontal: 11.h, vertical: 7.v),
                                    borderDecoration:
                                        const OutlineInputBorder(),
                                    filled: false,
                                    onChange: (value) {
                                      formValidation.setZipValidation(value);
                                      formValidation.checkButtonValidation();
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
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20.adaptSize,
                    ),
                    Obx(
                      () => addController.isUploadingContact.value
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : CustomElevatedButton(
                              onTap: () {
                                // addController.addContact();
                                if (widget.isCommingFromEdit) {
                                } else {
                                  addController.addContact();
                                }
                              },
                              text: widget.isCommingFromEdit
                                  ? "Save"
                                  : "Create Contact",
                              buttonStyle: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.buttonColor)),
                              margin: EdgeInsets.only(
                                  left: 24.h, right: 24.h, bottom: 22.v),
                              rightIcon: Container(
                                margin: EdgeInsets.only(left: 16.h),
                                child: CustomImageView(
                                    svgPath:
                                        ImageConstant.imgArrowrightPrimary),
                              ),
                            ),
                    )
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

  Widget iconWithTextField(
      {required String lableText,
      required TextEditingController controller,
      required String icon,
      required FormFieldValidator validator,
      GlobalKey? key,
      bool? readOnly,
      VoidCallback? textFieldTap}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
            svgPath: icon,
            height: 18.adaptSize,
            width: 18.adaptSize,
            color: Colors.black,
            margin: EdgeInsets.only(top: 18.v, right: 15)),
        Expanded(
          child: Form(
            key: key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: CustomTextFormField(
                readOnly: readOnly ?? false,
                onTap: textFieldTap,
                controller: controller,
                // margin: EdgeInsets.only(
                //     left: 12.h, top: 0.v, right: 12.h),
                // hintText: "First name *",
                labelText: lableText,
                textInputAction: TextInputAction.done,
                maxLines: 1,
                // contentPadding: EdgeInsets.symmetric(
                //     horizontal: 11.h, vertical: 7.v),
                borderDecoration: const OutlineInputBorder(),
                filled: false,
                onChange: (value) {
                  formValidation.setFirstNameValidation(value);
                  formValidation.checkButtonValidation();
                },
                validator: validator,
                fillColor: theme.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
