import 'package:flashfeed/domain/entities/news/article_model.dart';
import 'package:flashfeed/domain/use%20cases/search/get_search_news_use_case.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxList<ArticleModel> news = <ArticleModel>[].obs;

  RxBool isLoading = false.obs;

  final GetSearchNewsUseCase _getSearchNewsUseCase;

  SearchController(this._getSearchNewsUseCase);

  Future<void> getSearchNews({required String searchParams}) async {
    isLoading.toggle();
    news.clear();
    try {
      final resp = await _getSearchNewsUseCase.call(searchParams: searchParams);
      news.addAll(resp.articles!);
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
    }
  }
}
