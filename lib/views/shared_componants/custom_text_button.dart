import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netcoin_v_1/views/constants/app_colors.dart';

import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundButtonColor;
  final Function onParessed;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.color,
    this.backgroundButtonColor = AppColors.lightBlue,
    required this.onParessed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          onParessed();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundButtonColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 20.h))),
        child: CustomText(
          onTap: () {},
          text: text,
          color: color,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
