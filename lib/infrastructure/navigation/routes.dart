class Routes {
  static Future<String> get initialRoute async {
    return SPLASH;
  }

  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const DETAIL_NEWS = '/detail_news';
  static const CATEGORY = '/category';
  static const LIST_SOURCE = '/list_source';
  static const SEARCH = '/search';
}
