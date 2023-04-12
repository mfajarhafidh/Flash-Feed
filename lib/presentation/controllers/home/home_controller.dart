import 'package:flashfeed/domain/core/constants/constants.dart';
import 'package:flashfeed/domain/core/utils/snackbar.util.dart';
import 'package:flashfeed/domain/entities/source_list_model.dart';
import 'package:flashfeed/domain/use%20cases/home/get_news_based_source_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/news/article_model.dart';

class HomeController extends GetxController {
  String source = Get.arguments;

  RxList<ArticleModel> news = <ArticleModel>[].obs;
  RxList<Source> sourceList = <Source>[].obs;

  ScrollController scrollController = ScrollController();
  RxBool notFound = false.obs;
  RxBool isLoading = false.obs;
  RxString findNews = ''.obs;

  final GetNewsBasedSourceUseCase _getNewsBasedSourceUseCase;

  HomeController(
    this._getNewsBasedSourceUseCase,
  );

  @override
  void onInit() {
    super.onInit();
    getNewsBasedSource(source: source);
  }

  Future<void> refreshListArticle() async {
    isLoading.value == true;
    news.clear();
    isLoading.value == false;
    await getNewsBasedSource(source: source);
  }

  Future<void> getNewsBasedSource({required String source}) async {
    try {
      final response = await _getNewsBasedSourceUseCase.call(source: source);
      news.addAll(response.articles);
    } catch (e) {
      SnackbarUtil.showError(message: SnackBarConstants.snackbarShowError);
    }
  }
}
