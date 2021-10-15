import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/routes/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        enableLog: true, defaultTransition: Transition.fade, home: Login());
  }
}
