import '../../entities/news/news_model.dart';
import '../../entities/news/source_list_model.dart';

abstract class NewsRepository {
  Future<NewsModel> getNewsBasedSource({required String source});
  Future<SourceListModel> getListSourceBasedCategory(
      {required String category});
  Future<NewsModel> getSearchNews({required String searchParams});
}
