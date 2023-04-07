import 'package:country_codes/country_codes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get/get.dart';
import 'package:translator_task/features/homepage/homepage.dart';
import 'package:translator_task/routes/routes.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Translator Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        LocaleNamesLocalizationsDelegate(),
      ],
      // home: const HomePage(),
      initialRoute: '/home',
      getPages: appRoutes(),
    );
  }
}
