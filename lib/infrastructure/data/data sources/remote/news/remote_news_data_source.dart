import 'package:flashfeed/domain/core/constants/constants.dart';
import 'package:flashfeed/domain/entities/news/source_list_model.dart';
import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:get/get_connect/connect.dart';

abstract class NewsDataSource {
  Future<NewsModel> getSearchNews({required String searchParams});
  Future<SourceListModel> getListSourceBasedCategory(
      {required String category});
  Future<NewsModel> getNewsBasedSource({required String source});
}

class RemoteNewsDataSource implements NewsDataSource {
  final GetConnect httpClient;

  RemoteNewsDataSource({required this.httpClient});

  @override
  Future<NewsModel> getSearchNews({required String searchParams}) async {
    try {
      final response = await httpClient.get(
        'everything?q=$searchParams&apiKey=${StorageConstants.apiKey}',
        decoder: (data) => NewsModel.fromJson(data),
      );
      if (response.statusCode == 200) {
        return response.body!;
      } else {
        throw DataSourceException('Error');
      }
    } catch (e) {
      throw DataSourceException('Error');
    }
  }

  @override
  Future<SourceListModel> getListSourceBasedCategory(
      {required String category}) async {
    try {
      final response = await httpClient.get(
        'top-headlines/sources?category=$category&apiKey=${StorageConstants.apiKey}',
        decoder: (data) => SourceListModel.fromJson(data),
      );
      if (response.statusCode == 200) {
        return response.body!;
      } else {
        throw DataSourceException('Error');
      }
    } catch (e) {
      throw DataSourceException('Error');
    }
  }

  @override
  Future<NewsModel> getNewsBasedSource({required String source}) async {
    try {
      final response = await httpClient.get(
        'everything?sources=$source&apiKey=${StorageConstants.apiKey}',
        decoder: (data) => NewsModel.fromJson(data),
      );
      if (response.statusCode == 200) {
        return response.body!;
      } else {
        throw DataSourceException('Error');
      }
    } catch (e) {
      throw DataSourceException('Error');
    }
  }
}

class DataSourceException implements Exception {
  final String message;

  DataSourceException(this.message);
}
