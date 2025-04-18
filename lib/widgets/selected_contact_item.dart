

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:forever_connection/Feature/Contact/Controller/contact_controller.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:get/get.dart';

class SelectedContactItemWidget extends StatefulWidget {
  final String name;
  final String initials;
  final Contact contact;
  final bool selectedContacts;
  

  final String phoneNumber;
  final Color color;
  final bool checkBoxVal;
  const SelectedContactItemWidget(
      {super.key,
      required this.initials,
      required this.selectedContacts,
      required this.name,
      required this.contact,
      required this.color,
      this.checkBoxVal = false,
      required this.phoneNumber});

  @override
  State<SelectedContactItemWidget> createState() =>
      _SelectedContactItemWidgetState();
}

class _SelectedContactItemWidgetState extends State<SelectedContactItemWidget> {
  late bool checkVal;
  final controller = Get.put(ContactController());
  late RxBool isSelect;

  @override
  void initState() {
    checkVal = widget.checkBoxVal;
    isSelect = controller.singleSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("contactName" + widget.phoneNumber);
    // /  print(controller.markAll.value);
    isSelect.value = false;
    RxBool isSel = (false || widget.checkBoxVal).obs;
    return InkWell(
      child: ListTile(
        onTap: () {
       
        },
        leading: CircleAvatar(
          // backgroundColor: widget.color,
          child: Text(
            widget.initials,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        title: Text(widget.name),
        trailing: Obx(() => Checkbox(
              activeColor: AppColors.buttonColor,
              onChanged: (value) {
                isSel.value = value!;
                if(value){
                  controller.selectedContactList.add(widget.contact);
                  if(controller.selectedContactList.length > 0){
                    controller.anySelected.value = true;
                  }
                  else{
                    controller.anySelected.value = false;
                  }
                }
                else{
                  if(controller.selectedContactList.contains(widget.contact)){
                    controller.selectedContactList.remove(widget.contact);
                    if (controller.selectedContactList.length > 0) {
                      controller.anySelected.value = true;
                    } else {
                      controller.anySelected.value = false;
                    }
                  }
                }
                log("length is "+controller.selectedContactList.length.toString());
              },
              value: controller.markAll.value
                  ? controller.markAll.value
                  : isSel.value,
            )),
      ),
    );
  }
}
