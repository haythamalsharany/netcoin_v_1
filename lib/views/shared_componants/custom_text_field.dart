// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netcoin_v_1/views/constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Icon icon;
  final TextInputType textInputType;
  final bool autoFoucs;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String>? onSaved;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.textInputType,
    required this.icon,
    this.autoFoucs = false,
    required this.validator,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFoucs,
      validator: (value) {
        return validator(value);
      },
      onSaved: (value) {
        return onSaved!(value);
      },
      // textAlign: TextAlign.right,
      // textDirection: TextDirection.rtl,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          filled: true,
          fillColor: AppColors.grey,
          hintText: hintText,
          hintTextDirection: TextDirection.rtl,
          prefixIcon: icon,
          helperStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}
