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
    isSelect.value = controller.markAll.value ? true : false;
    return InkWell(
      child: ListTile(
        onTap: () {
          // Navigator.pushNamed(
          //   context,
          //   ContactDetailsScreen.routeName,
          //   arguments: {
          //     'name': widget.name,
          //     'phoneNumber': widget.phoneNumber,
          //   },
          // ),
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
                isSelect.value = value!;
              },
              value: isSelect.value,
            )),
      ),
    );
  }
}
