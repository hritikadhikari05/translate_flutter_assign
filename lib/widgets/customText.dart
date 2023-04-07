import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      super.key});
  String text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 12,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
