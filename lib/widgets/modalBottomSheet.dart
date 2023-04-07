import 'dart:developer';

import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get/get.dart';
import 'package:translator_task/controllers/homepage.controller.dart';
import 'package:translator_task/features/homepage/widgets/languageCard.dart';
import 'package:translator_task/widgets/customText.dart';

import '../utils/languages.dart';

showModalBottom(context, languages, buttonType) {
  HomepageController homeController = Get.put(HomepageController());
  //Search language from array

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      )),
      backgroundColor: Color(0xff232527),
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: homeController.searchController,
                decoration: InputDecoration(
                    hintText: "Search language",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 211, 202, 202)),
                    )),
                onChanged: (val) {
                  homeController.searchLanguage(val);
                },
              ),
              Obx(() => Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Container(
                        height: 400,
                        child: homeController.searchQuery.isEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: languages.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        buttonType == "current"
                                            ? homeController.currentLanguage
                                                .value = languages[index]
                                            : homeController.translateLanguage
                                                .value = languages[index];
                                        Get.back();
                                        homeController.searchController.clear();
                                      },
                                      child: LanguageCard(
                                        text: languages[index]['name'],
                                      ));
                                },
                              )
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: homeController.searchQuery.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      buttonType == "current"
                                          ? homeController
                                                  .currentLanguage.value =
                                              homeController.searchQuery[index]
                                          : homeController
                                                  .translateLanguage.value =
                                              homeController.searchQuery[index];
                                      Get.back();
                                    },
                                    child: LanguageCard(
                                      text: homeController.searchQuery[index]
                                          ['name'],
                                    ),
                                  );
                                },
                              ),

                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: languages.map<Widget>((language) {
                        //     return Container(
                        //       margin: EdgeInsets.only(bottom: 10),
                        //       padding: EdgeInsets.all(10),
                        //       height: 40,
                        //       width: double.infinity,
                        //       decoration: BoxDecoration(
                        //         color: Colors.grey,
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       child: CustomText(
                        //         text: "${language} ",
                        //         color: Colors.black,
                        //         fontSize: 18,
                        //       ),
                        //     );
                        //   }).toList(),
                        // ),
                      ),
                    ),
                  ))
            ],
          ),
        );
      });
}
