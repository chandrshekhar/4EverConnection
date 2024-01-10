import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.textStyle,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.labelText,
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
      this.readOnly = false,
      this.onTap,
      this.inputFormatters,
      this.onChange,
      this.maxLength,
      this.context,
      this.onEditingComplete})
      : super(
          key: key,
        );
  final bool readOnly;
  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText, labelText;

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

  void Function()? onTap;

  final ValueChanged? onChange;

  final int? maxLength;

  final List<TextInputFormatter>? inputFormatters;

  final BuildContext? context;

  void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Container(
        width: width ?? double.maxFinite,
        margin: margin,
        child: TextFormField(
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          textCapitalization: TextCapitalization.sentences,
          maxLength: maxLength,
          readOnly: readOnly,
          controller: controller,
          style: textStyle ??
              TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp),
          obscureText: obscureText!,
          textInputAction: textInputAction,
          onEditingComplete: onEditingComplete,
          onChanged: onChange,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
          cursorColor: Colors.black.withOpacity(0.1),
          onTap: onTap,
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        labelText: labelText ?? "",
        counterText: "",
        hintStyle: hintStyle ??
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        labelStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        suffixIcon: suffix,
        contentPadding: contentPadding ?? EdgeInsets.all(2.v),
        fillColor: fillColor,
        filled: filled,
        border: const UnderlineInputBorder(),
        // enabledBorder: borderDecoration ??
        //     UnderlineInputBorder(
        //       borderRadius: BorderRadius.circular(3.h),
        //       borderSide: BorderSide(
        //         color: appTheme.black900,
        //         width: 1,
        //       ),
        //     ),
        // focusedBorder:
        //     UnderlineInputBorder(
        //       borderRadius: BorderRadius.circular(3.h),
        //       borderSide: BorderSide(
        //         color: appTheme.black900,
        //         width: 1,
        //       ),
        //     ),
      );
}

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillPrimary => OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.r),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get outlineBlack => OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.black900,
          width: 1,
        ),
      );
}
