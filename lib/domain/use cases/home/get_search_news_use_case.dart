import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:flashfeed/domain/repositories/news/news_repository.dart';

class GetSearchNewsUseCase {
  final NewsRepository _newsRepository;

  GetSearchNewsUseCase(this._newsRepository);

  Future<NewsModel?> call({required String searchParams}) {
    return _newsRepository.getSearchNews(searchParams: searchParams);
  }
}
