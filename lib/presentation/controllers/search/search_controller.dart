import 'package:flashfeed/domain/use%20cases/home/get_search_news_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/constants/snackbar_constants.dart';
import '../../../domain/core/constants/validation_constants.dart';
import '../../../domain/core/utils/snackbar.util.dart';
import '../../../domain/entities/news/article_model.dart';

class SearchController extends GetxController {
  RxList<ArticleModel> news = <ArticleModel>[].obs;
  final searchKey = GlobalKey<FormState>();

  RxBool notFound = false.obs;
  RxBool isLoading = false.obs;
  RxString findNews = ''.obs;

  final GetSearchNewsUseCase _getSearchNewsUseCase;

  SearchController(this._getSearchNewsUseCase);

  Future<void> getSearchNews({required String searchParams}) async {
    isLoading.toggle();
    try {
      if (searchKey.currentState!.validate()) {
        final resp =
            await _getSearchNewsUseCase.call(searchParams: searchParams);
        news.clear();
        news.addAll(resp!.articles);
        isLoading.toggle();
      }
    } catch (e) {
      isLoading.toggle();
      SnackbarUtil.showError(message: SnackBarConstants.snackbarShowError);
    }
  }

  String? emptyValidator(String v) {
    if (v.isEmpty) {
      return ValidationConstants.cantEmpty;
    } else {
      return null;
    }
  }
}
