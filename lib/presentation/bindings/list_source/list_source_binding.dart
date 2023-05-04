import 'package:flashfeed/domain/use%20cases/list_source/get_list_source_based_category_use_case.dart';
import 'package:flashfeed/presentation/controllers/list_source/list_source_controller.dart';
import 'package:get/get.dart';

import '../../../domain/repositories/news/news_repository.dart';
import '../../../infrastructure/data/data sources/remote/news/remote_news_data_source.dart';
import '../../../infrastructure/data/data sources/repositories/news/news_repository_impl.dart';

class ListSourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteNewsDataSource>(
        () => RemoteNewsDataSource(httpClient: Get.find<GetConnect>()));
    Get.lazyPut<NewsRepository>(
        () => NewsRepositoryImpl(Get.find<RemoteNewsDataSource>()));

    Get.lazyPut<GetListSourceBasedCategoryUseCase>(
        () => GetListSourceBasedCategoryUseCase(Get.find<NewsRepository>()));

    Get.lazyPut<ListSourceController>(() => ListSourceController(
          Get.find<GetListSourceBasedCategoryUseCase>(),
        ));
  }
}
