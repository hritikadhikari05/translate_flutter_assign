import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_task/controllers/homepage.controller.dart';
import 'package:translator_task/features/homepage/widgets/homepageButtons.dart';
import 'package:translator_task/widgets/customTexfield.dart';
import 'package:translator_task/widgets/customText.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomepageController homeController = Get.put(HomepageController());
  @override
  Widget build(BuildContext context) {
    // log("message : ${homeController.currentLanguage}");
    // log("message : ${homeController.translatedTextController.text}");
    return Scaffold(
      // appBar: AppBar(
      //   title: CustomText(
      //     text: "Language translator",
      //     color: Colors.white,
      //     fontSize: 18,
      //   ),
      //   centerTitle: true,
      // ),
      backgroundColor: const Color(0xff121416),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title Text
              CustomText(
                text: "Text Translation",
                fontSize: 20,
              ),

              //Divider
              const SizedBox(
                height: 20,
              ),

              //Divider
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),

              //Buttons
              HomePageButtons(),

              //Textfields

              CustomTextfield(
                language: homeController.currentLanguage.isEmpty
                    ? "English"
                    : homeController.currentLanguage['name'],
                type: "current",
                translatedText: "",
              ),
              Obx(
                () => CustomTextfield(
                  language: homeController.translateLanguage.isEmpty
                      ? "English"
                      : homeController.translateLanguage['name'],
                  type: "translated",
                  controller: homeController.translatedTextController,
                  // translatedText: homeController.translatedTextController.text,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
