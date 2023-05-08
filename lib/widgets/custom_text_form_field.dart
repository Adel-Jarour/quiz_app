import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/constance/color_const.dart';
import 'package:quiz_app/widgets/custem_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintTxt;
  final String? label;
  final String? errorText;
  final FocusNode? focusNode;
  final String? prefix;
  final String? initialValue;
  final Widget? prefixIcon;
  final Function? onPressedPrefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? prefixIconColor;
  final bool? obscureText;
  final bool? prefixVisible;
  final bool? enabled;
  final int? minLines;
  final int? maxLines;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? prefixScale;
  final TextDirection? textDirection;

  const CustomTextFormField({
    super.key,
    this.hintTxt,
    this.label = "",
    this.onPressedPrefixIcon,
    this.keyboardType,
    this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixIcon,
    this.fillColor = Colors.white,
    this.horizontalPadding,
    this.verticalPadding,
    this.prefixIconColor,
    this.enabled = true,
    this.initialValue,
    this.prefix,
    this.focusNode,
    this.prefixScale,
    this.prefixVisible = true,
    this.errorText,
    this.textDirection = TextDirection.ltr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.01),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextFormField(
        // focusNode: focusNode,
        // textDirection: textDirection,
        initialValue: initialValue,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter valid data";
          }
          return null;
        },
        minLines: minLines,
        maxLines: maxLines,
        style: TextStyle(
            fontFamily: "Sora",
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: hintTxt ?? "what you think!",
          prefixIconColor: prefixIconColor,
          fillColor: fillColor ?? Colors.white,
          filled: true,
          label: CustomText(
            txt: label ?? "",
            color: ColorConst.secondColor,
            fontSize: 18.sp,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorConst.primaryColor,
            ),
            borderRadius: BorderRadius.circular(27.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27.0),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            fontFamily: "Sora",
            color: Colors.grey,
            fontSize: 15.sp,
          ),
          errorText: errorText,
          errorStyle: TextStyle(
            fontFamily: "Sora",
            color: Colors.red,
            fontSize: 15.sp,
          ),
          alignLabelWithHint: true,
          contentPadding: EdgeInsetsDirectional.only(
            start: horizontalPadding ?? 25.w,
            end: horizontalPadding ?? 8.w,
            top: verticalPadding ?? 14.h,
            bottom: verticalPadding ?? 19.h,
          ),
          prefixIcon: prefixIcon,
        ),
        enabled: enabled,
        keyboardType: keyboardType,
        obscureText: obscureText!,
      ),
    );
  }
}
