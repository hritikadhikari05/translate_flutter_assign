import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:translator_task/api/api.calls.dart';

import '../utils/languages.dart';

class HomepageController extends GetxController {
  RxList languages = [].obs;
  RxMap currentLanguage = {}.obs;
  RxMap translateLanguage = {}.obs;
  RxBool loading = false.obs;

  TextEditingController translatedTextController = TextEditingController();

  //Search controller
  TextEditingController searchController = TextEditingController();

  //Search query
  RxList searchQuery = [].obs;

  @override
  void onClose() {
    // TODO: implement onClose
    searchController.dispose();
    super.onClose();
  }

  //Api calls
  ApiCalls apiCalls = ApiCalls();

  //Array of languages
  RxList arry_languages = [].obs;

  //Get all languages list from api
  Future<dynamic> getAllLanguages() async {
    loading.value = true;
    try {
      final response = await apiCalls.getAllLanguages();
      languages.value = response["data"]["languages"];
      for (int i = 0; i < languages.length; i++) {
        getLanguageName(languages[i]['language'], "langList");
      }
      loading.value = false;

      return response;
    } on DioError catch (e) {
      // log("Error message: ${e.response!.data['message']}");
      Get.snackbar(
        "Error",
        e.response!.data['message'],
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      loading.value = false;

      rethrow;
    }
  }

  //Detect language function through api calls
  Future<dynamic> postDetectLanguage(String text) async {
    log("message con: $text");
    try {
      final response = await apiCalls.postDetectLanguage(text);
      // currentLanguage.value = response.data["data"]["detections"][0][0];
      getLanguageName(
          response.data["data"]["detections"][0][0]['language'], "detect");
      // log("message api: ${response.data["data"]["detections"][0][0]['language']}");
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //Translate language function through api calls
  Future<dynamic> postTranslateLanguage(
      currentLanguage, translateLanguage, currentText) async {
    try {
      final response = await apiCalls.postTranslateLanguage(
          currentLanguage, translateLanguage, currentText);
      translatedTextController.text =
          response.data["data"]["translations"][0]["translatedText"];
      // translatedText.value =
      //     response.data["data"]["translations"][0]["translatedText"];
      log("message: ${response}");
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //Get language name from the fetched data
  String? getLanguageName(code, type) {
    for (var entry in isoLangs.entries) {
      if (entry.key == code) {
        String? name = entry.value['name'];
        // log("message: $name");
        if (name != null) {
          if (type == "detect") {
            currentLanguage.value = {"name": name, "code": code};
          } else if (type == "langList") {
            // translateLanguage.value = {"name": name, "code": code};
            arry_languages.add({"name": name, "code": code});
          }
        }
        // print(name);
        return name;
      }
    }
    // }
    return null;
  }

  //Search language function
  String searchLanguage(String language) {
    String lang = "";
    searchQuery.clear();
    for (var i = 0; i < arry_languages.length; i++) {
      lang = arry_languages[i]['name'].toString().toLowerCase();
      if (lang.contains(language.toLowerCase())) {
        searchQuery.add({
          "name": arry_languages[i]['name'],
          "code": arry_languages[i]['code']
        });

        // } else {}

        print(searchQuery);
      }
    }
    return lang;
  }
}
