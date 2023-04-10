import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
