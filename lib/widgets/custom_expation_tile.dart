import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors.dart';

// ignore: must_be_immutable
class CustomExpansionPanel extends StatelessWidget {
  void Function(bool)? onExpansionChanged;
  bool initiallyExpanded;
  String title;
  List<Widget> children;
  TextStyle? titleStyle;
  Color? backgroundColor;
  Color? collapsedBackgroundColor;
  Widget? leading;
  // int? index;
  CustomExpansionPanel({
    super.key,
    required this.title,
    required this.onExpansionChanged,
    required this.initiallyExpanded,
    required this.children,
    this.titleStyle,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.leading,
    // this.index
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        collapsedTextColor: Colors.white,
        leading: leading,
        childrenPadding: EdgeInsets.zero,
        // tilePadding: EdgeInsets.symmetric(horizontal: 0.w),
        collapsedShape: ContinuousRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(
              0.r,
            ))),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.r))),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        backgroundColor: backgroundColor ?? AppColors.appBackgroundColor,
        collapsedBackgroundColor:
            collapsedBackgroundColor ?? AppColors.appBackgroundColor,
        expandedAlignment: Alignment.topLeft,
        collapsedIconColor: Colors.white,
        iconColor: AppColors.darkBlue,
        textColor: AppColors.darkBlue,
        title: Transform.translate(
          offset: Offset(-15.w, 0),
          child: Text(title, style: const TextStyle()),
        ),
        onExpansionChanged: onExpansionChanged,
        initiallyExpanded: initiallyExpanded,
        children: children);
  }
}
