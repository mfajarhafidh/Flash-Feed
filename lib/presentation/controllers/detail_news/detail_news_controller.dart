import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNewsController extends GetxController {
  String url = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    loadUrl(url: url);
  }

  WebViewController loadUrl({required String url}) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }
}
