import 'package:flashfeed/presentation/controllers/detail_news/detail_news_controller.dart';
import 'package:get/get.dart';

class DetailNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNewsController>(() => DetailNewsController());
  }
}
