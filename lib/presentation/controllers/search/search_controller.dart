import 'package:flashfeed/domain/use%20cases/home/get_search_news_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/constants/snackbar_constants.dart';
import '../../../domain/core/utils/snackbar.util.dart';
import '../../../domain/entities/news/article_model.dart';

class SearchController extends GetxController {
  RxList<ArticleModel> news = <ArticleModel>[].obs;

  ScrollController scrollController = ScrollController();
  RxBool notFound = false.obs;
  RxBool isLoading = false.obs;
  RxString findNews = ''.obs;

  final GetSearchNewsUseCase _getSearchNewsUseCase;

  SearchController(this._getSearchNewsUseCase);

  Future<void> getSearchNews({required String searchParams}) async {
    try {
      final resp = await _getSearchNewsUseCase.call(searchParams: searchParams);
      isLoading.value = false;
      news.clear();
      news.addAll(resp!.articles);
      if (scrollController.hasClients) scrollController.jumpTo(0.0);
      update();
    } catch (e) {
      SnackbarUtil.showError(message: SnackBarConstants.snackbarShowError);
    }
  }
}
