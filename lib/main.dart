import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/controllers/global_controller.dart';
import 'package:getxexample/routes/login.dart';
import 'package:getxexample/utils/translation_strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GlobalController gc = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        enableLog: true,
        translations: TranslationStrings(),
        locale: const Locale('en', 'US'),
        defaultTransition: Transition.rightToLeftWithFade,
        home: Login());
  }
}
