import 'package:get/get.dart';
import 'package:getxexample/routes/bottom_bar.dart';
import 'package:getxexample/routes/custom_tab_bar.dart';
import 'package:getxexample/routes/home.dart';
import 'package:getxexample/routes/snack_bar.dart';

class DrwrController extends GetxController {
  List functionalityList = ['Home', 'SnackBar', 'CustomTabBar', 'BottomBar'];

  int itemClicked(item) {
    switch (item) {
      case 'Home':
        Get.off(() => const Home());
        break;
      case 'SnackBar':
        Get.off(() => SnackBar());
        break;
      case 'CustomTabBar':
        Get.off(() => CustomTabBar());
        break;
      case 'BottomBar':
        Get.off(() => const BottomBar());
        break;
      default:
        Get.off(() => const Home());
        break;
    }
    return functionalityList.indexWhere((i) => i == item);
  }
}
