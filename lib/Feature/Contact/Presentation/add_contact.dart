import 'dart:developer';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forever_connection/Feature/Contact/Controller/add_contact_controller.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:forever_connection/core/utils/address_search.dart';
import 'package:forever_connection/core/utils/date_formatter.dart';
import 'package:forever_connection/core/utils/place_service.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:forever_connection/widgets/app_bar/custom_app_bar.dart';
import 'package:forever_connection/widgets/custom_drop_down.dart';
import 'package:forever_connection/widgets/custom_elevated_button.dart';
import 'package:forever_connection/widgets/custom_radio_button.dart';
import 'package:forever_connection/widgets/custom_text_form_field.dart';
import 'package:forever_connection/widgets/phone_number_formating_widget.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../Controller/contact_text_validation.dart';

// ignore_for_file: must_be_immutable
class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

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

  String oldDateTxt = "", newDateTxt = "";

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
          title: AppbarTitle(text: "Create Contact"),
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
                          image: addController.choosenFilename.value.isNotEmpty
                              ? DecorationImage(
                                  image: FileImage(addController.files.value!),
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
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUser,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: Form(
                            key: firstNameKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: CustomTextFormField(
                                controller: addController.firstNameController.value,
                                margin: EdgeInsets.only(
                                    left: 12.h, top: 0.v, right: 12.h),
                                // hintText: "First name *",
                                labelText: "First name *",
                                textInputAction: TextInputAction.done,
                                maxLines: 1,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 7.v),
                                borderDecoration: const OutlineInputBorder(),
                                filled: false,
                                onChange: (value) {
                                  formValidation.setFirstNameValidation(value);
                                  formValidation.checkButtonValidation();
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "First name can't be empty.";
                                  } else if (value.length < 4) {
                                    return "First name must have 4 character";
                                  } else {
                                    return null;
                                  }
                                },
                                fillColor: theme.colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUser,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.middleNameController.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 5.v, right: 12.h),
                              // hintText: "Middle name (if Any)",
                              labelText: "Middle name (if Any)",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUser,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: Form(
                            key: lastNameKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: CustomTextFormField(
                                controller: addController.lastNameController.value,
                                margin: EdgeInsets.only(
                                    left: 12.h, top: 5.v, right: 12.h),
                                // hintText: "Last name *",
                                labelText: "Last name *",
                                textInputAction: TextInputAction.done,
                                maxLines: 1,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 7.v),
                                borderDecoration: const OutlineInputBorder(),
                                filled: false,
                                onChange: (value) {
                                  formValidation.checkButtonValidation();
                                },
                                fillColor: theme.colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    // CustomDropDown(
                    //   borderDecoration: const UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.grey)),
                    //   margin: const EdgeInsets.only(left: 14, right: 14),
                    //   contentPadding:
                    //       const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    //   items: const ["Male", "Female", "Other"],
                    //   onChanged: (value) {
                    //     addController.gender.value = value;
                    //   },
                    //   hintText: "Select gender",
                    // ),
                     Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUser,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        // CustomImageView(
                        //   svgPath: ImageConstant.imgUser,
                        //   height: 17.v,
                        //   width: 15.h,
                        //   margin: EdgeInsets.only(
                        //     top: 7.v,
                        //     bottom: 2.v,
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "Gender",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12.h, 4.v, 12.h, 8.v),
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomRadioButton(
                                text: "Male",
                                value: "Male",
                                groupValue:
                                    addController.gender.value,
                                onChange: (value) {
                                  addController.gender(value);
                                },
                              ),
                              CustomRadioButton(
                                text: "Female",
                                value: "Female",
                                groupValue:
                                    addController.gender.value,
                                onChange: (value) {
                                  addController.gender(value);
                                },
                              ),
                              CustomRadioButton(
                                text: "Other",
                                value: "Other",
                                groupValue:
                                    addController.gender.value,
                                onChange: (value) {
                                  addController.gender(value);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                        
                    // SizedBox(
                    //   height: 16.adaptSize,
                    // ),
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgCalendar,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.dateOfBirth.value,
                              onTap: () {
                                // addController.selectDate(context);
                              },
                          
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              hintText: "MM/DD/YYYY",
                              counterText: "",
                              
                              labelText: "Date of Birth",
                              
                              maxLength: 10,
                              textInputType: TextInputType.number,
                              inputFormatters: [DateTextFormatter()],
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {
                                
                          
                                
                                
                              },
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgFile,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.companyController.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              // hintText: "Company Name",
                              labelText: "Company Name",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUser,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.postionController.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              // hintText: "Position",
                              labelText: "Position",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgCarGray600,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.occupationController.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              // hintText: "Occupation",
                              labelText: "Occupation",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgCarGray600,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller:
                                  addController.idealOccupationController.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              // hintText: "Ideal Occupation",
                              labelText: "Ideal Occupation",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),

                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgCall,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: Form(
                              key: phoneKey,
                              child: PhoneNumberTextFieldWidget(
                                  c: 1,
                                  ignore: false,
                                  phoneController:
                                      addController.mobilePhoneController.value,
                                  lable: "Mobile Number"),
                            ),
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
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUser,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.lifePartnerName.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              // hintText: "Life Partner Name",
                              labelText: "Life Partner Name",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 16.adaptSize,
                    // ),

                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgCall,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
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
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
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

                    // CustomTextFormField(
                    //     controller: addController.homePhone.value,
                    //     margin:
                    //         EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                    //     hintText: "Home Phone",
                    //     labelText: "Home Phone",
                    //     textInputAction: TextInputAction.done,
                    //     textInputType: TextInputType.phone,
                    //     inputFormatters: [
                    //       FilteringTextInputFormatter.digitsOnly
                    //     ],
                    //     maxLines: 1,
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
                            svgPath: ImageConstant.imgVector,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.personalEmail.value,
                              textInputType: TextInputType.emailAddress,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              // hintText: "Personal Email",
                              labelText: "Personal Email",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.myBusinessProfile,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.businessNameController.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              // hintText: "Business Name",
                              labelText: "Business Name",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgVector,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.businessEmail.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              // hintText: "Business Email",
                              labelText: "Business Email",
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    Row(
                      children: [
                         CustomImageView(
                            svgPath: ImageConstant.myBusinessProfile,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.businessFax.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              // hintText: "Business Fax",
                              labelText: "Business Fax",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.adaptSize,
                    ),
                    Row(
                      children: [
                         CustomImageView(
                            svgPath: ImageConstant.imgGlobe,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.webSiteController.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
                              // hintText: "Website",
                              labelText: "Website",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                         CustomImageView(
                            svgPath: ImageConstant.imgLocation,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        Expanded(
                          child: Form(
                            key: homeKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                    addController.homeAddressController.value.text =
                                        result.description;
                                    addController.zipController.value.text =
                                        placeDetails.zipCode ?? "";
                                  }
                                  // ignore: use_build_context_synchronously
                                  FocusScope.of(context).requestFocus(focus);
                                },
                                controller: addController.homeAddressController.value,
                                margin: EdgeInsets.only(
                                    left: 12.h, top: 15.v, right: 12.h),
                                // hintText: "Home Address *",
                                labelText: "Home Address *",
                                textInputAction: TextInputAction.done,
                                maxLines: 1,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 7.v),
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
                        ),
                      ],
                    ),
                    Row(
                      children: [
                         CustomImageView(
                            svgPath: ImageConstant.imgLocation,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                         
                        Expanded(
                          child: CustomTextFormField(
                              controller: addController.aptController.value,
                              focusNode: focus,
                              margin: EdgeInsets.only(
                                  left: 12.h, top: 15.v, right: 12.h),
                              // hintText: "Apt, Ste",
                              labelText: "Apt, Ste",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                        
                        Expanded(
                          child: Form(
                            key: zipKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: CustomTextFormField(
                                controller: addController.zipController.value,
                                margin: EdgeInsets.only(
                                    left: 12.h, top: 15.v, right: 12.h),
                                // hintText: "ZIP *",
                                labelText: "ZIP *",
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.number,
                                maxLines: 1,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 7.v),
                                borderDecoration: const OutlineInputBorder(),
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
                    Row(
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgLocation,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
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
                                  addController.businessAddressController.value.text =
                                      result.description;
                                  addController.businessZipController.value.text =
                                      placeDetails.zipCode ?? "";
                                }
                                // ignore: use_build_context_synchronously
                                FocusScope.of(context).requestFocus(focus2);
                              },
                              controller:
                                  addController.businessAddressController.value,
                              margin:
                                  EdgeInsets.only(left: 12.h, top: 15.v, right: 12.h),
                              // hintText: "Business Address *",
                              labelText: "Business Address *",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
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
                    Row(
                      children: [
                         CustomImageView(
                            svgPath: ImageConstant.imgLocation,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            color: Colors.black,
                            margin: EdgeInsets.only(top: 18.v, right: 15)),
                        
                        Expanded(
                          child: CustomTextFormField(
                              focusNode: focus2,
                              controller:
                                  addController.businessAptController.value,
                              margin: EdgeInsets.only(
                                  left: 12.h, top: 5.v, right: 12.h),
                              // hintText: "Apt, Ste",
                              labelText: "Apt, Ste",
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
                              filled: false,
                              onChange: (value) {},
                              fillColor: theme.colorScheme.primary),
                        ),
                       
                        Expanded(
                          child: CustomTextFormField(
                              controller:
                                  addController.businessZipController.value,
                              margin: EdgeInsets.only(
                                  left: 12.h, top: 5.v, right: 12.h),
                              // hintText: "ZIP *",
                              labelText: "ZIP *",
                              textInputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 7.v),
                              borderDecoration: const OutlineInputBorder(),
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
                                if (firstNameKey.currentState!.validate() &&
                                    lastNameKey.currentState!.validate() &&
                                    phoneKey.currentState!.validate()) {
                                  addController.addContact();
                                }
                              },
                              text: "Create Contact",
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
}


