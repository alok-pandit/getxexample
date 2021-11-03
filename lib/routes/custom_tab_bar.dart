import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/components/custom_drawer.dart';
import 'package:getxexample/controllers/global_controller.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({Key? key}) : super(key: key);
  final LiquidController lc = LiquidController();

  final pages = [
    Container(
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.teal,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Directionality(
        textDirection: Get.find<GlobalController>().isArabic.value
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(title: const Text('Custom Tab Bar')),
          drawer: CustomDrawer(),
          body: Builder(
              builder: (context) => LiquidSwipe(
                    pages: pages,
                    enableLoop: false,
                    liquidController: lc,
                    initialPage: Get.find<GlobalController>().tabBarIndex.value,
                    onPageChangeCallback: (index) {
                      Get.find<GlobalController>().tabBarIndex.value = index;
                      DefaultTabController.of(context)?.animateTo(index,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease);
                    },
                  )),
          bottomNavigationBar: Obx(
            () => BottomNavyBar(
              selectedIndex: Get.find<GlobalController>().tabBarIndex.value,
              // showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index) {
                Get.find<GlobalController>().tabBarIndex.value = index;
                DefaultTabController.of(context)?.animateTo(index,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.ease);
                lc.animateToPage(duration: 300, page: index);
              },
              items: [
                BottomNavyBarItem(
                  icon: const Icon(Icons.apps),
                  title: const Text('Home'),
                  activeColor: Colors.red,
                ),
                BottomNavyBarItem(
                    icon: const Icon(Icons.people),
                    title: const Text('Users'),
                    activeColor: Colors.purpleAccent),
                BottomNavyBarItem(
                    icon: const Icon(Icons.message),
                    title: const Text('Messages'),
                    activeColor: Colors.pink),
                BottomNavyBarItem(
                    icon: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    activeColor: Colors.blue),
                BottomNavyBarItem(
                    icon: const Icon(Icons.account_balance_outlined),
                    title: const Text('Balance'),
                    activeColor: Colors.teal),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
