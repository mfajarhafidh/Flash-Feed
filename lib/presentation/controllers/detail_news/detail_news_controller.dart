import 'package:flashfeed/domain/core/constants/constants.dart';
import 'package:flashfeed/domain/core/utils/snackbar.util.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNewsController extends GetxController {
  String url = Get.arguments;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUrl(url: url);
  }

  WebViewController loadUrl({required String url}) {
    isLoading.toggle();
    try {
      isLoading.toggle();
      return WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(url));
    } catch (e) {
      isLoading.toggle();
      throw SnackbarUtil.showError(
          message: SnackBarConstants.snackbarShowError);
    }
  }
}
