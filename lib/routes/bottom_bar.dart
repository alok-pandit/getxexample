import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getxexample/components/custom_drawer.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:getxexample/components/list_component.dart';
import 'package:getxexample/controllers/global_controller.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  final PageController bottomPageController = PageController(
      initialPage: Get.find<GlobalController>().tabBarIndex.value);
  late TabController _tabController;

  final List listings = [];

  @override
  void initState() {
    super.initState();

    for (int i = 1; i <= 15; i++) {
      listings.add(i.toString());
    }

    // List<Widget> getListings() {
    //   return _listings.map<Widget>((element) {
    //     return SizedBox.expand(
    //       child: Container(
    //           decoration: BoxDecoration(
    //               color: Colors.teal,
    //               borderRadius: BorderRadius.circular(8),
    //               border: Border.all()),
    //           child: Center(child: element)),
    //     );
    //   }).toList();
    // }

    _tabController = TabController(
        vsync: this,
        length: 5,
        initialIndex: Get.find<GlobalController>().tabBarIndex.value);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.find<GlobalController>().isArabic.value
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('BottomBar'),
            backgroundColor: Colors.indigo[900],
          ),
          drawer: CustomDrawer(),
          body: SizedBox.expand(
            child: PageView(
              pageSnapping: true,
              controller: bottomPageController,
              onPageChanged: (index) {
                Get.find<GlobalController>().tabBarIndex.value = index;
                _tabController.index = index;
              },
              children: [
                Container(
                  color: Colors.blueGrey,
                ),
                Container(
                    color: Colors.deepPurple,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 450,
                          height: 40,
                          // decoration: BoxDecoration(
                          //     color: Colors.teal, border: Border.all()),
                          child: Obx(
                            () => Slider(
                              value: Get.find<GlobalController>()
                                  .sliderIndex
                                  .value,
                              min: 0,
                              max: 100,
                              divisions: 20,
                              label: Get.find<GlobalController>()
                                  .sliderIndex
                                  .value
                                  .round()
                                  .toString(),
                              onChanged: (double value) {
                                Get.find<GlobalController>().sliderIndex.value =
                                    value;
                              },
                            ),
                          ),
                        ),
                      ),
                    )),
                Container(
                  color: Colors.indigoAccent,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.brown,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 150,
                            alignment: Alignment.topLeft,
                            decoration:
                                const BoxDecoration(color: Colors.amber),
                            child: ListComponent(listings)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
              controller: _tabController,
              backgroundColor: Colors.indigo,
              items: const [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.map, title: 'Slider'),
                TabItem(icon: Icons.add, title: 'Add'),
                TabItem(icon: Icons.message, title: 'Message'),
                TabItem(icon: Icons.people, title: 'List'),
              ],
              initialActiveIndex:
                  Get.find<GlobalController>().tabBarIndex.value,
              //optional, default as 0
              onTap: (int i) {
                Get.find<GlobalController>().tabBarIndex.value = i;
                bottomPageController.jumpToPage(i);
              })),
    );
  }

  box() {
    List<Widget> l = [];
    for (int i = 1; i < 6; i++) {
      l.add(LimitedBox(
        maxHeight: 200,
        maxWidth: 200,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.all(4.0),
            decoration:
                BoxDecoration(border: Border.all(), color: Colors.redAccent),
            child: const Center(
              child: Text(
                '1',
              ),
            ),
          ),
        ),
      ));
    }
    return l;
  }
}
