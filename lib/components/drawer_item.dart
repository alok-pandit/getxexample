import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/controllers/drawer_controller.dart';
import 'package:getxexample/controllers/global_controller.dart';

class DrawerItem extends StatelessWidget {
  final String item;

  const DrawerItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            onTap: () {
              Get.find<GlobalController>().activeItem.value = item;
              Get.find<DrwrController>().itemClicked(item);
            },
            child: Obx(() => Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.amberAccent, width: 2),
                    color: Get.find<GlobalController>().activeItem.value == item
                        ? Colors.amberAccent
                        : Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child:
                    SizedBox(height: 20, child: Center(child: Text(item)))))));
  }
}
