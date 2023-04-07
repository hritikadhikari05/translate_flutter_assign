import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiCalls extends GetConnect {
  final dio = Dio();
  //Get language list
  Future<dynamic> getAllLanguages() async {
    try {
      final response = await dio.get(
        "https://google-translate1.p.rapidapi.com/language/translate/v2/languages",
        options: Options(
          headers: {
            'Accept-Encoding': 'application/gzip',
            'X-RapidAPI-Key':
                'ff6a77be71msh534a03e2f445601p163bc5jsn5e8a2787e891',
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

  Future<dynamic> postTranslateLanguage(
      currentLanguage, translateLanguage, currentText) async {
    try {
      final response = await dio.post(
        "https://google-translate1.p.rapidapi.com/language/translate/v2",
        data: {
          "q": "${currentText.toString()}",
          "target": translateLanguage.toString(),
          "source": currentLanguage.toString()
        },
        options: Options(
          headers: {
            'content-type': "application/x-www-form-urlencoded",
            'Accept-Encoding': "application/gzip",
            'X-RapidAPI-Key':
                "ff6a77be71msh534a03e2f445601p163bc5jsn5e8a2787e891",
            'X-RapidAPI-Host': "google-translate1.p.rapidapi.com",
          },
        ),
      );

      log("message: ${response}");
      return response;
    } on DioError catch (e) {
      log("Error message: ${e.response!.data}");
      throw Exception(e);
    }
  }
  // Future<dynamic> postTranslateLanguage(
  //     currentLanguage, translateLanguage, currentText) async {
  //   try {
  //     var body =
  //         '{"from":"${currentLanguage ?? "en"}","to":"${translateLanguage ?? "en"}","e":"","q":["$currentText"]}';

  //     final response = await post(
  //       "https://rapid-translate-multi-traduction.p.rapidapi.com/t",
  //       body,
  //       contentType: 'application/x-www-form-urlencoded',
  //       headers: {
  //         'content-type': 'application/json',
  //         'X-RapidAPI-Key':
  //             '09c1578b7amshf535bc848e0172ap1afcd7jsn6ebddddb4229',
  //         'X-RapidAPI-Host': 'rapid-translate-multi-traduction.p.rapidapi.com'
  //       },
  //     );
  //     // log("message: ${response.body}");
  //     return response.body;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
