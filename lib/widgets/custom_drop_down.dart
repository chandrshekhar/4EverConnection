import 'package:flutter/material.dart';
import 'package:forever_connection/core/utils/app_export.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key? key,
    this.alignment,
    this.width,
    this.margin,
    this.focusNode,
    this.icon,
    this.autofocus = true,
    this.textStyle,
    this.items,
    this.hintText,
    this.whereUse,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    this.onChanged,
    this.internalTextl,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final String? whereUse;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final String? internalTextl;

  final FocusNode? focusNode;

  final Widget? icon;

  final bool? autofocus;

  final TextStyle? textStyle;

  final List<dynamic>? items;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: dropDownWidget,
          )
        : dropDownWidget;
  }

  Widget get dropDownWidget => Container(
        width: width ?? double.maxFinite,
        margin: margin,
        child: DropdownButtonFormField<dynamic>(
            focusNode: focusNode ?? FocusNode(),
            icon: icon,
            autofocus: autofocus!,
            style: textStyle ?? theme.textTheme.bodyLarge,
            items: items?.map<DropdownMenuItem<dynamic>>((value) {
              return DropdownMenuItem<dynamic>(
                value: value,
                child: Text(
                  whereUse == "professional"
                      ? value.name
                      : whereUse == "partner"
                          ? value.fullName
                          : value,
                  overflow: TextOverflow.ellipsis,
                  style: hintStyle ?? theme.textTheme.bodyLarge,
                ),
              );
            }).toList(),
            decoration: decoration,
            onChanged: onChanged),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodyLarge,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.only(
              left: 1.h,
              top: 1.v,
              bottom: 1.v,
            ),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.h),
              borderSide: BorderSide(
                color: appTheme.black900,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.h),
              borderSide: BorderSide(
                color: appTheme.black900,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.h),
              borderSide: BorderSide(
                color: appTheme.black900,
                width: 1,
              ),
            ),
      );
}

/// Extension on [CustomDropDown] to facilitate inclusion of all types of border style etc
extension DropDownStyleHelper on CustomDropDown {
  static UnderlineInputBorder get underLineBlack => UnderlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.black900,
        ),
      );
}
