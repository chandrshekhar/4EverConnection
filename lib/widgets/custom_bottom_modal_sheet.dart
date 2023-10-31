import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final String title;
  const CustomBottomSheet({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showCustomBottomSheet(context, title, child);
  }
}

showCustomBottomSheet(BuildContext context, String title, Widget child) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      context: context,
      builder: (context) {
        return child;
      });
}
