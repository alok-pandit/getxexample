import 'package:get/get.dart';

class TranslationStrings extends Translations {
  static Map values = {
    'en': {
      'login': 'Login',
      'logout': 'Logout',
      'emailPH': 'Enter Email',
      'pwdPH': 'Enter Password'
    },
    'ar': {
      'login': 'تسجيل الدخول',
      'logout': 'Logout_ar',
      'emailPH': 'Enter Email Ar',
      'pwdPH': 'Enter Password Ar'
    }
  };

  static final Map<String, String> _englishMap = Map.from(values['en']);

  static final Map<String, String> _arabicMap = Map.from(values['ar']);

  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': _englishMap, 'ar_AE': _arabicMap};
}
