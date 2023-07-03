import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:flashfeed/presentation/controllers/search/search_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flashfeed/domain/entities/news/article_model.dart';
import 'package:flashfeed/domain/use%20cases/search/get_search_news_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockGetSearchNewsUseCase extends Mock implements GetSearchNewsUseCase {}

void main() {
  late SearchPageController searchController;
  late GetSearchNewsUseCase mockGetSearchNewsUseCase;

  final testArticleModel = ArticleModel(
    title: 'Test Article Title',
    description: 'Test Article Description',
    urlToImage: 'https://test.com/image.jpg',
    url: 'https://test.com/article',
  );

  setUp(() {
    mockGetSearchNewsUseCase = MockGetSearchNewsUseCase();
    searchController = SearchPageController(mockGetSearchNewsUseCase);
  });

  group('SearchController', () {
    test('should update news list when GetSearchNewsUseCase returns data',
        () async {
      final testSearchParams = 'test';
      final testArticlesList = <ArticleModel>[testArticleModel];

      when(() => mockGetSearchNewsUseCase.call(
              searchParams: any(named: 'searchParams')))
          .thenAnswer((_) async =>
              NewsModel(status: testSearchParams, articles: testArticlesList));

      expect(searchController.news.length, 0);

      await searchController.getSearchNews(searchParams: testSearchParams);

      expect(searchController.news.length, testArticlesList.length);
      expect(searchController.news.first.title, testArticleModel.title);
      expect(searchController.news.first.description,
          testArticleModel.description);
      expect(
          searchController.news.first.urlToImage, testArticleModel.urlToImage);
      expect(searchController.news.first.url, testArticleModel.url);
    });

    test('should not update news list when GetSearchNewsUseCase returns null',
        () async {
      final testSearchParams = 'test';

      when(() => mockGetSearchNewsUseCase.call(
              searchParams: any(named: 'searchParams')))
          .thenAnswer((_) async => NewsModel());

      expect(searchController.news.length, 0);

      await searchController.getSearchNews(searchParams: testSearchParams);

      expect(searchController.news.length, 0);
    });

    test('should toggle isLoading state on success or error', () async {
      final testSearchParams = 'test';

      when(() => mockGetSearchNewsUseCase.call(
              searchParams: any(named: 'searchParams')))
          .thenAnswer((_) async => NewsModel());

      expect(searchController.isLoading.value, false);

      await searchController.getSearchNews(searchParams: testSearchParams);

      expect(searchController.isLoading.value, false);

      when(() => mockGetSearchNewsUseCase.call(
          searchParams: any(named: 'searchParams'))).thenThrow(Exception());

      expect(searchController.isLoading.value, false);

      await searchController.getSearchNews(searchParams: testSearchParams);

      expect(searchController.isLoading.value, false);
    });
  });
}
