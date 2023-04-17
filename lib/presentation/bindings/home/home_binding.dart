import 'package:flashfeed/domain/repositories/news/news_repository.dart';
import 'package:flashfeed/domain/use%20cases/home/get_news_based_source_use_case.dart';
import 'package:flashfeed/infrastructure/data/data%20sources/remote/news/remote_news_data_source.dart';
import 'package:flashfeed/infrastructure/data/data%20sources/repositories/news/news_repository_impl.dart';
import 'package:flashfeed/presentation/controllers/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteNewsDataSource>(() => RemoteNewsDataSource());
    Get.lazyPut<NewsRepository>(
        () => NewsRepositoryImpl(Get.find<RemoteNewsDataSource>()));

    Get.lazyPut<GetNewsBasedSourceUseCase>(
        () => GetNewsBasedSourceUseCase(Get.find<NewsRepository>()));

    Get.lazyPut<HomeController>(() => HomeController(
          Get.find<GetNewsBasedSourceUseCase>(),
        ));
  }
}
