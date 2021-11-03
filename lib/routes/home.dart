import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxexample/components/custom_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: CustomDrawer(),
    );
  }
}
