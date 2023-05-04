import 'package:flashfeed/domain/entities/news/source_list_model.dart';
import 'package:flashfeed/domain/use%20cases/list_source/get_list_source_based_category_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSourceController extends GetxController {
  late String category;
  RxList<Source> sourceList = <Source>[].obs;
  RxBool isLoading = false.obs;

  final listSourceKey = GlobalKey<FormState>();

  final GetListSourceBasedCategoryUseCase _getListSourceBasedCategoryUseCase;

  ListSourceController(this._getListSourceBasedCategoryUseCase);

  @override
  void onInit() {
    super.onInit();
    category = Get.arguments;
    getListSourceBasedCategory();
  }

  Future<void> getListSourceBasedCategory() async {
    isLoading.toggle();
    try {
      final response =
          await _getListSourceBasedCategoryUseCase.call(category: category);
      sourceList.addAll(response.sources!);
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
    }
  }

  void searchForItem({required String searchParam}) {
    try {
      sourceList.retainWhere((item) =>
          item.name!.toLowerCase().contains(searchParam.toLowerCase()));
      if (searchParam.isEmpty) {
        sourceList.clear();
        getListSourceBasedCategory();
      }
    } catch (e) {
      Exception('Error');
    }
  }
}
