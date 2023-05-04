import 'package:flashfeed/domain/use%20cases/home/get_news_based_source_use_case.dart';
import 'package:get/get.dart';

import '../../../domain/entities/news/article_model.dart';

class HomeController extends GetxController {
  late String source;

  RxList<ArticleModel> news = <ArticleModel>[].obs;

  RxBool isLoading = false.obs;

  final GetNewsBasedSourceUseCase _getNewsBasedSourceUseCase;

  HomeController(
    this._getNewsBasedSourceUseCase,
  );

  @override
  void onInit() {
    super.onInit();
    source = Get.arguments;
    getNewsBasedSource(source: source);
  }

  Future<void> refreshListArticle({required String source}) async {
    isLoading.toggle();
    news.clear();
    await getNewsBasedSource(source: source);
    isLoading.toggle();
  }

  Future<void> getNewsBasedSource({required String source}) async {
    isLoading.toggle();
    try {
      final response = await _getNewsBasedSourceUseCase.call(source: source);
      news.addAll(response.articles!);
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
    }
  }
}
