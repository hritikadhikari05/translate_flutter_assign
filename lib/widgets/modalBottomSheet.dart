import 'dart:developer';

import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get/get.dart';
import 'package:translator_task/controllers/homepage.controller.dart';
import 'package:translator_task/features/homepage/widgets/languageCard.dart';
import 'package:translator_task/features/homepage/widgets/modalBottomTextField.dart';
import 'package:translator_task/features/homepage/widgets/shimmerLoading.dart';
import 'package:translator_task/widgets/customText.dart';

import '../utils/languages.dart';

showModalBottom(context, languages, buttonType) {
  HomepageController homeController = Get.put(HomepageController());
  //Search language from array

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      )),
      backgroundColor: const Color(0xff232527),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "From",
                color: Colors.white,
                fontSize: 18,
              ),
              const SizedBox(
                height: 10,
              ),
              ModalBottomTextField(),
              Obx(() => Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Container(
                        height: 400,
                        child: homeController.loading.isTrue
                            ? const ShimmerLoadingList()
                            //If loading is false search query array is empty then all language list will be displayed
                            : homeController.searchQuery.isEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: languages.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            //Button type is current language then else
                                            buttonType == "current"
                                                ? homeController.currentLanguage
                                                    .value = languages[index]
                                                : homeController
                                                    .translateLanguage
                                                    .value = languages[index];

                                            // Pop the context
                                            Get.back();
                                            //Clear the search controller
                                            homeController.searchController
                                                .clear();
                                          },
                                          child: LanguageCard(
                                            text: languages[index]['name'],
                                          ));
                                    },
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        homeController.searchQuery.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          buttonType == "current"
                                              ? homeController
                                                      .currentLanguage.value =
                                                  homeController
                                                      .searchQuery[index]
                                              : homeController
                                                      .translateLanguage.value =
                                                  homeController
                                                      .searchQuery[index];
                                          Get.back();
                                        },
                                        child: LanguageCard(
                                          text: homeController
                                              .searchQuery[index]['name'],
                                        ),
                                      );
                                    },
                                  ),
                      ),
                    ),
                  ))
            ],
          ),
        );
      });
}
