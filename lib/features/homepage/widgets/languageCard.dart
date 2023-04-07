import 'package:flutter/material.dart';
import 'package:translator_task/controllers/homepage.controller.dart';
import 'package:translator_task/widgets/customText.dart';

class LanguageCard extends StatelessWidget {
  LanguageCard({super.key, this.text});
  final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 20, left: 20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff121416),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomText(
        text: text,
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
