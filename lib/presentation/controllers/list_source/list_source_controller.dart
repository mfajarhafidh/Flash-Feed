import 'package:flashfeed/domain/core/constants/constants.dart';
import 'package:flashfeed/domain/core/utils/snackbar.util.dart';
import 'package:flashfeed/domain/entities/source_list_model.dart';
import 'package:flashfeed/domain/use%20cases/list_source/get_list_source_based_category_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSourceController extends GetxController {
  String category = Get.arguments;
  RxList<Source> sourceList = <Source>[].obs;
  RxBool isLoading = false.obs;

  final listSourceKey = GlobalKey<FormState>();

  final GetListSourceBasedCategoryUseCase _getListSourceBasedCategoryUseCase;

  ListSourceController(this._getListSourceBasedCategoryUseCase);

  @override
  void onInit() {
    super.onInit();
    getListSourceBasedCategory(category: category);
  }

  Future<void> getListSourceBasedCategory({required String category}) async {
    isLoading.toggle();
    try {
      final response =
          await _getListSourceBasedCategoryUseCase.call(category: category);
      sourceList.addAll(response.sources!);
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      SnackbarUtil.showError(message: SnackBarConstants.snackbarShowError);
    }
  }

  void searchForItem({required String searchParam}) {
    try {
      sourceList.retainWhere((item) =>
          item.name!.toLowerCase().contains(searchParam.toLowerCase()));
      if (searchParam.isEmpty) {
        sourceList.clear();
        getListSourceBasedCategory(category: category);
      }
    } catch (e) {
      SnackbarUtil.showError(message: SnackBarConstants.snackbarShowError);
    }
  }
}
