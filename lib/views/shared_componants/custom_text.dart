import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final Alignment alignment;
  final Function onTap;

  const CustomText({
    Key? key,
    this.text = "",
    this.color = Colors.black,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.alignment = Alignment.center,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
