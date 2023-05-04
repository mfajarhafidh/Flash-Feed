import 'package:flashfeed/domain/use%20cases/search/get_search_news_use_case.dart';
import 'package:flashfeed/presentation/controllers/search/search_controller.dart';
import 'package:get/get.dart';

import '../../../domain/repositories/news/news_repository.dart';
import '../../../infrastructure/data/data sources/remote/news/remote_news_data_source.dart';
import '../../../infrastructure/data/data sources/repositories/news/news_repository_impl.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteNewsDataSource>(
        () => RemoteNewsDataSource(httpClient: Get.find<GetConnect>()));
    Get.lazyPut<NewsRepository>(
        () => NewsRepositoryImpl(Get.find<RemoteNewsDataSource>()));

    Get.lazyPut<GetSearchNewsUseCase>(
        () => GetSearchNewsUseCase(Get.find<NewsRepository>()));

    Get.lazyPut<SearchController>(() => SearchController(
          Get.find<GetSearchNewsUseCase>(),
        ));
  }
}
