import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:flashfeed/domain/repositories/news/news_repository.dart';

class GetNewsBasedSourceUseCase {
  final NewsRepository _newsRepository;

  GetNewsBasedSourceUseCase(this._newsRepository);

  Future<NewsModel> call({required String source}) {
    return _newsRepository.getNewsBasedSource(source: source);
  }
}
