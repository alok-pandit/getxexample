import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/controllers/login_controller.dart';
import 'package:getxexample/routes/home.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  // final TextEditingController email = TextEditingController();
  // final TextEditingController pass = TextEditingController();
  final LoginController loginController = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(height: 135, width: 135, child: FlutterLogo()),
              ),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Email'),
                      // controller: email,
                      onChanged: (val) {
                        loginController.updateEmail(val);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (!GetUtils.isEmail(value!)) {
                          return "Email is not valid";
                        } else {
                          return null;
                        }
                      })),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Password'),
                      // controller: pass,
                      onChanged: (val) {
                        loginController.updatePass(val);
                      },
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (!GetUtils.isLengthGreaterThan(value!, 5)) {
                          return "Password is not valid";
                        } else {
                          return null;
                        }
                      })),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: ElevatedButton(
                      onPressed: () => {
                            if (formKey.currentState!.validate())
                              {
                                // pass.text = '',
                                // email.text = '',
                                Get.off(() => Home())
                              }
                            else
                              {
                                Get.snackbar(
                                    "Unable to Login", "Check Email / Password",
                                    icon: const Icon(Icons.email,
                                        color: Colors.white),
                                    snackPosition: SnackPosition.BOTTOM,
                                    shouldIconPulse: true,
                                    duration: const Duration(
                                        hours: 0, minutes: 0, seconds: 10))
                              }
                          },
                      child: const Text('Login')))
            ],
          ),
        ));
  }
}
