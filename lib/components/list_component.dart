import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/controllers/global_controller.dart';
import 'package:getxexample/utils/sine_curve.dart';

class ListComponent extends StatelessWidget {
  List listings = [];
  ListComponent(lst, {Key? key}) : super(key: key) {
    listings = lst;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: listings.length,
        addAutomaticKeepAlives: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.find<GlobalController>().animated.value = index + 1;
              Timer(const Duration(milliseconds: 500), () {
                Get.find<GlobalController>().animated.value = 0;
              });
            },
            child: Obx(
              () => LimitedBox(
                maxHeight: 125,
                maxWidth: 125,
                child: Stack(children: [
                  AnimatedContainer(
                      height: Get.find<GlobalController>().animated.value ==
                              index + 1
                          ? 118
                          : 125,
                      width: 125,
                      margin: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          // gradient: RadialGradient(colors: const [
                          //   Colors.purple,
                          //   Colors.teal
                          // ], stops: [
                          //   Get.find<GlobalController>()
                          //               .animated
                          //               .value ==
                          //           index + 1
                          //       ? 0.2
                          //       : 0.5,
                          //   1.0
                          // ]),
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width:
                                  Get.find<GlobalController>().animated.value ==
                                          index + 1
                                      ? 5
                                      : 1,
                              color:
                                  Get.find<GlobalController>().animated.value ==
                                          index + 1
                                      ? Colors.indigoAccent
                                      : Colors.black)),
                      duration: const Duration(seconds: 1),
                      // curve: const SineCurve(),
                      curve: Curves.easeOutQuart,
                      child: Center(
                          child: Text(
                        listings[index].toString(),
                        style: TextStyle(
                          fontSize:
                              Get.find<GlobalController>().animated.value ==
                                      index + 1
                                  ? 22
                                  : 16,
                        ),
                      ))),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
