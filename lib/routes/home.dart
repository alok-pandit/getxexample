import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/controllers/login_controller.dart';
import 'package:getxexample/routes/login.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final LoginController lc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home: Welcome ' + lc.email.toString()),
        actions: [
          ElevatedButton(
              onPressed: () => Get.off(() => Login()),
              child: const Text('Logout'))
        ],
      ),
    );
  }
}
