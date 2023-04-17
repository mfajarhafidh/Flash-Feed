import 'package:flashfeed/presentation/bindings/category/category_binding.dart';
import 'package:flashfeed/presentation/bindings/detail_news/detail_news_binding.dart';
import 'package:flashfeed/presentation/bindings/list_source/list_source_binding.dart';
import 'package:flashfeed/presentation/bindings/search/search_binding.dart';
import 'package:flashfeed/presentation/pages/category/category_page.dart';
import 'package:flashfeed/presentation/pages/detail_news/detail_news_page.dart';
import 'package:flashfeed/presentation/pages/list_source/list_source_page.dart';
import 'package:flashfeed/presentation/pages/search/search_page.dart';
import 'package:flashfeed/presentation/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import '../../presentation/bindings/home/home_binding.dart';
import 'routes.dart';
import '../../presentation/pages.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_NEWS,
      page: () => DetailNewsPage(),
      binding: DetailNewsBinding(),
    ),
    GetPage(
      name: Routes.CATEGORY,
      page: () => CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.LIST_SOURCE,
      page: () => ListSourcePage(),
      binding: ListSourceBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
  ];
}
