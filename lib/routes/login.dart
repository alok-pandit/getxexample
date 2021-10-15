import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/routes/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login')
      ),
      body: Form(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
              padding: EdgeInsets.all(12),
              child: TextField()
          ),
          const Padding(
              padding: EdgeInsets.all(12),
              child: TextField()
          ),
          Padding(
              padding:const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () => {Get.to(const Home())},
                child: const Text('Login')
              )
          )
        ],
      ),
    )
    );
  }

}