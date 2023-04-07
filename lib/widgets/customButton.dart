import 'package:flutter/material.dart';
import 'package:translator_task/widgets/customText.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontColor,
      this.fontWeight,
      this.buttonColor,
      this.buttonHeight,
      this.buttonWidth,
      this.buttonRadius,
      this.onPressed});
  String text;
  double? fontSize;
  Color? fontColor;
  FontWeight? fontWeight;
  Color? buttonColor;
  double? buttonHeight;
  double? buttonWidth;
  double? buttonRadius;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: buttonHeight ?? 40,
        width: buttonWidth ?? 140,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: buttonColor ?? Colors.blue,
          borderRadius: BorderRadius.circular(buttonRadius ?? 18),
        ),
        child: Center(
            child: CustomText(
          text: text,
          fontSize: fontSize ?? 14,
        )),
      ),
    );
  }
}
