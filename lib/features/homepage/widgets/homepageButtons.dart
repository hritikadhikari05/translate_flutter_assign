import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_task/controllers/homepage.controller.dart';
import 'package:translator_task/widgets/modalBottomSheet.dart';

import '../../../widgets/customButton.dart';

class HomePageButtons extends StatelessWidget {
  HomePageButtons({super.key});
  HomepageController homeController = Get.put(HomepageController());
  @override
  Widget build(BuildContext context) {
    List language = ["English", "Nepali"];
    log("message : ${homeController.currentLanguage}");
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => CustomButton(
                text: homeController.currentLanguage.isEmpty
                    ? "Current Language"
                    : homeController.currentLanguage['name'],
                buttonColor: Color(0xff232527),
                buttonRadius: 14,
                buttonHeight: 50,
                buttonWidth: 150,
                fontSize: 16,
                onPressed: () {
                  if (homeController.arry_languages.isEmpty) {
                    homeController.getAllLanguages();
                  }
                  // homeController.postTranslateLanguage(
                  //     "en", "ne", "Hello Wor ld");

                  showModalBottom(
                      context, homeController.arry_languages, "current");
                },
              )),
          const Icon(Icons.arrow_forward_ios, color: Colors.white),
          Obx(() => CustomButton(
                text: homeController.translateLanguage.isEmpty
                    ? "Selected Language"
                    : homeController.translateLanguage['name'],
                buttonColor: Color(0xff232527),
                buttonRadius: 14,
                buttonHeight: 50,
                buttonWidth: 150,
                fontSize: 16,
                onPressed: () {
                  if (homeController.arry_languages.isEmpty) {
                    homeController.getAllLanguages();
                  }
                  showModalBottom(
                      context, homeController.arry_languages, "translate");
                },
              )),
        ],
      ),
    );
  }
}
