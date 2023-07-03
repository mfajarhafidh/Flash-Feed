import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:flashfeed/presentation/controllers/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flashfeed/domain/entities/news/article_model.dart';
import 'package:flashfeed/domain/use%20cases/home/get_news_based_source_use_case.dart';

class MockGetNewsBasedSourceUseCase extends Mock
    implements GetNewsBasedSourceUseCase {}

void main() {
  late HomeController controller;
  late MockGetNewsBasedSourceUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetNewsBasedSourceUseCase();
    controller = HomeController(mockUseCase);
    controller.news.addAll([
      ArticleModel(
        title: 'Article 1',
        description: 'Description 1',
        urlToImage: 'image_url_1',
      ),
      ArticleModel(
        title: 'Article 2',
        description: 'Description 2',
        urlToImage: 'image_url_2',
      ),
    ]);
  });

  test('should get news based on source', () async {
    // arrange
    final source = 'cnn';
    final articles = [
      ArticleModel(
        title: 'Article 3',
        description: 'Description 3',
        urlToImage: 'image_url_3',
      ),
      ArticleModel(
        title: 'Article 4',
        description: 'Description 4',
        urlToImage: 'image_url_4',
      ),
    ];
    when(() => mockUseCase.call(source: source))
        .thenAnswer((_) async => NewsModel(articles: articles));

    // act
    await controller.getNewsBasedSource(source: source);

    // assert
    expect(controller.news.length, 4);
    expect(controller.news[2].title, 'Article 3');
    expect(controller.news[3].title, 'Article 4');
    expect(controller.isLoading.value, false);
  });

  test('should show error message if failed to get news', () async {
    // arrange
    final source = 'cnn';
    final error = 'Failed to get news';
    when(() => mockUseCase.call(source: source)).thenThrow(error);

    // act
    await controller.getNewsBasedSource(source: source);

    // assert
    expect(controller.news.length, 2);
    expect(controller.isLoading.value, false);
  });

  test('should refresh news based on source', () async {
    // arrange
    final source = 'bbc';
    final articles = [
      ArticleModel(
        title: 'Article 5',
        description: 'Description 5',
        urlToImage: 'image_url_5',
      ),
    ];
    when(() => mockUseCase.call(source: source))
        .thenAnswer((_) async => NewsModel(articles: articles));

    // act
    await controller.refreshListArticle(source: source);

    // assert
    expect(controller.news.length, 1);
    expect(controller.news[0].title, 'Article 5');
    expect(controller.isLoading.value, false);
  });
}
