import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiCalls {
  final dio = Dio();
  final baseUrl =
      "https://google-translate1.p.rapidapi.com/language/translate/v2";
  final apiKey = "";
  //Get language list
  Future<dynamic> getAllLanguages() async {
    try {
      final response = await dio.get(
        "$baseUrl/languages",
        options: Options(
          headers: {
            'Accept-Encoding': 'application/gzip',
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
          },
        ),
      );
      // log("message: ${response.data}");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //Detect language
  Future<dynamic> postDetectLanguage(String text) async {
    log("Hello");
    try {
      final response = await dio.post(
        "$baseUrl/detect",
        data: {
          "q": text,
        },
        options: Options(
          headers: {
            'content-type': "application/x-www-form-urlencoded",
            'Accept-Encoding': "application/gzip",
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': "google-translate1.p.rapidapi.com",
          },
        ),
      );
      return response;
    } on DioError catch (e) {
      rethrow;
    }
  }

  //Translate language
  Future<dynamic> postTranslateLanguage(
      currentLanguage, translateLanguage, currentText) async {
    try {
      final response = await dio.post(
        "$baseUrl",
        data: {
          "q": "${currentText.toString()}",
          "target": translateLanguage.toString(),
          "source": currentLanguage.toString()
        },
        options: Options(
          headers: {
            'content-type': "application/x-www-form-urlencoded",
            'Accept-Encoding': "application/gzip",
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': "google-translate1.p.rapidapi.com",
          },
        ),
      );
      return response;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
