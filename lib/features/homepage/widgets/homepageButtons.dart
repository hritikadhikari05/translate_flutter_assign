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
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => CustomButton(
              text: homeController.currentLanguage.isEmpty
                  ? "From"
                  : homeController.currentLanguage['name'],
              buttonColor: Color(0xff232527),
              buttonRadius: 14,
              buttonHeight: 50,
              buttonWidth: 150,
              fontSize: 16,
              onPressed: () {
                //Will check the languages array is empty or not
                if (homeController.arry_languages.isEmpty) {
                  homeController.getAllLanguages();
                }

                //Show modal bottom sheet on click
                showModalBottom(
                    context, homeController.arry_languages, "current");
              },
            ),
          ),
          //Arrow Icon
          const Icon(Icons.arrow_forward_ios, color: Colors.white),
          //S
          Obx(
            () => CustomButton(
              text: homeController.translateLanguage.isEmpty
                  ? "To"
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
            ),
          ),
        ],
      ),
    );
  }
}
