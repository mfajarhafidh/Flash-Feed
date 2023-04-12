import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonWidget extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
    );
  }
}
