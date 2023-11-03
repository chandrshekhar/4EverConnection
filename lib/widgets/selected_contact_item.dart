import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:get/get.dart';

class SelectedContactItemWidget extends StatefulWidget {
  final String name;
  final String initials;
  final Contact contact;
  final bool selectedContacts;

  final String phoneNumber;
  final Color color;
  const SelectedContactItemWidget(
      {super.key,
      required this.initials,
      required this.selectedContacts,
      required this.name,
      required this.contact,
      required this.color,
      required this.phoneNumber});

  @override
  State<SelectedContactItemWidget> createState() => _SelectedContactItemWidgetState();
}

class _SelectedContactItemWidgetState extends State<SelectedContactItemWidget> {
  @override
  Widget build(BuildContext context) {
    //print("contactName" + widget.phoneNumber);
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
      ),
    );
  }
}
