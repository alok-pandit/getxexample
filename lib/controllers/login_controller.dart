import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = '';
  var pass = '';
  updateEmail(i) => email = i;
  updatePass(i) => pass = i;
}
