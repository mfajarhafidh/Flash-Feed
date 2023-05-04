import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:flashfeed/domain/entities/news/source_list_model.dart';
import 'package:flashfeed/domain/repositories/news/news_repository.dart';
import 'package:flashfeed/infrastructure/data/data%20sources/remote/news/remote_news_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final RemoteNewsDataSource _remoteNewsDataSource;

  NewsRepositoryImpl(this._remoteNewsDataSource);

  @override
  Future<SourceListModel> getListSourceBasedCategory(
      {required String category}) {
    return _remoteNewsDataSource.getListSourceBasedCategory(category: category);
  }

  @override
  Future<NewsModel> getNewsBasedSource({required String source}) {
    return _remoteNewsDataSource.getNewsBasedSource(source: source);
  }

  @override
  Future<NewsModel> getSearchNews({required String searchParams}) {
    return _remoteNewsDataSource.getSearchNews(searchParams: searchParams);
  }
}
