import 'package:flashfeed/presentation/controllers/detail_news/detail_news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNewsPage extends GetView<DetailNewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Flash Feed",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child:
            WebViewWidget(controller: controller.loadUrl(url: controller.url)),
      ),
    );
  }
}
