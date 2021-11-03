import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/controllers/drawer_controller.dart';

import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  final DrwrController dc = Get.put(DrwrController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ExpansionTile(
              expandedAlignment: Alignment.center,
              initiallyExpanded: true,
              title: const Text("Expansion Title"),
              children: dc.functionalityList
                  .map((item) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: DrawerItem(item)))
                  .toList()),
          const ExpansionTile(
            title: Text("Expansion Title2"),
            children: [Text("children 12"), Text("children 22")],
          )
        ],
      ),
    );
  }
}
