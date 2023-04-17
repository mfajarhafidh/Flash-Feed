import 'package:flashfeed/domain/entities/source_list_model.dart';
import 'package:flashfeed/domain/repositories/news/news_repository.dart';

class GetListSourceBasedCategoryUseCase {
  final NewsRepository _newsRepository;

  GetListSourceBasedCategoryUseCase(this._newsRepository);

  Future<SourceListModel> call({required String category}) {
    return _newsRepository.getListSourceBasedCategory(category: category);
  }
}
