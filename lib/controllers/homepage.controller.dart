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
    try {
      final response = await apiCalls.getAllLanguages();
      languages.value = response["data"]["languages"];
      for (int i = 0; i < languages.length; i++) {
        getLanguageName(languages[i]['language']);
      }

      return response;
    } on DioError catch (e) {
      // log("Error message: ${e.response!.data['message']}");
      Get.snackbar(
        "Error",
        e.response!.data['message'],
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      rethrow;
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
  String? getLanguageName(code) {
    for (var entry in isoLangs.entries) {
      if (entry.key == code) {
        String? name = entry.value['name'];
        // log("message: $name");
        if (name != null) {
          arry_languages.add({"name": name, "code": code});
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
