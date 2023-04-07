import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_task/controllers/homepage.controller.dart';

import 'customText.dart';

class CustomTextfield extends StatefulWidget {
  CustomTextfield(
      {super.key,
      this.controller,
      this.language,
      this.type,
      this.translatedText});
  TextEditingController? controller;
  String? language;
  String? type;
  String? translatedText;
  HomepageController homeController = Get.put(HomepageController());
  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  String? enteredText = "";
  String? translatedText = "";
  @override
  Widget build(BuildContext context) {
    // Obx(() => widget.homeController.translatedText.value);
    setState(() {
      translatedText = widget.translatedText;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: CustomText(
              text: 'Translate From (${widget.language ?? "English"})',
              fontSize: 14),
        ),
        TextFormField(
          readOnly: widget.type == "current" ? false : true,
          controller: widget.controller,
          maxLines: 10,
          cursorColor: Colors.amber,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          // initialValue: "current",
          onChanged: (val) {
            // if (widget.type == "current") {
            //   widget.homeController.postTranslateLanguage(
            //       widget.homeController.currentLanguage.isEmpty
            //           ? "en"
            //           : widget.homeController.currentLanguage['code'],
            //       widget.homeController.translateLanguage.isEmpty
            //           ? "en"
            //           : widget.homeController.translateLanguage['code'],
            //       val.toString());
            // }

            setState(() {
              enteredText = val;
            });
          },
          decoration: InputDecoration(
            counterStyle: TextStyle(color: Colors.white),
            counterText:
                widget.type == "current" ? "${enteredText!.length} / 500" : "",
            filled: true,
            fillColor: Color(0xff232527),
            hintText: "Enter text here",
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
