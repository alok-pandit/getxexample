import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/components/custom_drawer.dart';
import 'package:getxexample/controllers/global_controller.dart';
import 'package:getxexample/controllers/snack_bar_controller.dart';
import 'package:getxexample/controllers/login_controller.dart';
import 'package:getxexample/routes/login.dart';

class SnackBar extends StatelessWidget {
  SnackBar({Key? key}) : super(key: key);

  final LoginController lc = Get.find();
  final HomeController hc = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.find<GlobalController>().isArabic.value
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
          appBar: AppBar(
            title: Obx(() => Text('${hc.counter.value} : ${lc.email}')),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => Login());
                    Get.find<GlobalController>().activeItem.value = 'Home';
                  },
                  child: const Text('Logout'))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Counter'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.green),
                  child: Obx(
                    () => Directionality(
                      textDirection: Get.find<GlobalController>().isArabic.value
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: expenses
                              .map((expense) => Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Stack(
                                      // height: 75,
                                      // width: 75,
                                      // decoration: BoxDecoration(
                                      //   color: Colors.brown,
                                      //   borderRadius: BorderRadius.circular(12),
                                      // ),
                                      children: [
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () => Get.snackbar(
                                                      'Click',
                                                      expense['value']
                                                          .toString(),
                                                      icon: const Icon(
                                                          Icons.email,
                                                          color: Colors.purple),
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                      shouldIconPulse: true,
                                                      duration: const Duration(
                                                          hours: 0,
                                                          minutes: 0,
                                                          seconds: 10)),
                                                  child: Text(expense['name']
                                                      .toString()
                                                      .toUpperCase()))
                                            ])
                                      ])))
                              .toList()),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(25),
                      child: FloatingActionButton(
                          heroTag: "1",
                          child: const Icon(Icons.add),
                          onPressed: hc.increment)),
                  Padding(
                      padding: const EdgeInsets.all(25),
                      child: FloatingActionButton(
                          heroTag: "2",
                          child: const Icon(CupertinoIcons.minus),
                          onPressed: hc.decrement))
                ],
              )
            ],
          ),
          drawer: CustomDrawer()),
    );
  }
}

List expenses = [
  {'name': 'a', 'value': 1},
  {'name': 'b', 'value': 2},
  {'name': 'c', 'value': 3},
  {'name': 'd', 'value': 4},
];
