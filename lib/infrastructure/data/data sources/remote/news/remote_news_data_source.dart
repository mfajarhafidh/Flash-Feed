import 'package:flashfeed/domain/core/constants/constants.dart';
import 'package:flashfeed/domain/core/utils/snackbar.util.dart';
import 'package:flashfeed/domain/entities/source_list_model.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/news/news_model.dart';

class RemoteNewsDataSource {
  final _connect = Get.find<GetConnect>();

  Future<NewsModel> getSearchNews({required String searchParams}) async {
    final response = await _connect.get(
      'everything?q=$searchParams&apiKey=${StorageConstants.apiKey}',
      decoder: (data) => NewsModel.fromJson(data),
    );
    if (response.statusCode == 200) {
      return response.body!;
    } else {
      throw SnackbarUtil.showError(
          message: SnackBarConstants.snackbarShowError);
    }
  }

  Future<SourceListModel> getListSourceBasedCategory(
      {required String category}) async {
    final response = await _connect.get(
      'top-headlines/sources?category=$category&apiKey=${StorageConstants.apiKey}',
      decoder: (data) => SourceListModel.fromJson(data),
    );
    if (response.statusCode == 200) {
      return response.body!;
    } else {
      throw SnackbarUtil.showError(
          message: SnackBarConstants.snackbarShowError);
    }
  }

  Future<NewsModel> getNewsBasedSource({required String source}) async {
    final response = await _connect.get(
      'everything?sources=$source&apiKey=${StorageConstants.apiKey}',
      decoder: (data) => NewsModel.fromJson(data),
    );
    if (response.statusCode == 200) {
      return response.body!;
    } else {
      throw SnackbarUtil.showError(
          message: SnackBarConstants.snackbarShowError);
    }
  }
}
