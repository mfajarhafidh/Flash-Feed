import 'package:flashfeed/domain/entities/news/article_model.dart';
import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:flashfeed/domain/entities/news/source_list_model.dart';
import 'package:flashfeed/domain/repositories/news/news_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  group('NewsRepository', () {
    late NewsRepository newsRepository;
    final source = 'cnn';
    final category = 'business';
    final searchParams = 'covid';
    final totalResults = 3;
    final articles = <ArticleModel>[];

    setUp(() {
      newsRepository = MockNewsRepository();
    });

    test('returns NewsModel for a valid source', () async {
      final newsModel = NewsModel();
      when(() => newsRepository.getNewsBasedSource(source: source))
          .thenAnswer((_) async => newsModel);

      final result = await newsRepository.getNewsBasedSource(source: source);

      expect(result, equals(newsModel));
    });

    test('returns SourceListModel for a valid category', () async {
      final sourceListModel = SourceListModel(/* ... */);
      when(() => newsRepository.getListSourceBasedCategory(category: category))
          .thenAnswer((_) async => sourceListModel);

      final result =
          await newsRepository.getListSourceBasedCategory(category: category);

      expect(result, equals(sourceListModel));
    });

    test('returns NewsModel for a valid searchParams', () async {
      final newsModel = NewsModel();
      when(() => newsRepository.getSearchNews(searchParams: searchParams))
          .thenAnswer((_) async => newsModel);

      final result =
          await newsRepository.getSearchNews(searchParams: searchParams);

      expect(result, equals(newsModel));
    });

    test('throws exception when source is invalid', () async {
      final exception = Exception('Failed to get news based on invalid source');
      when(() =>
              newsRepository.getNewsBasedSource(source: any(named: 'source')))
          .thenThrow(exception);

      expect(() => newsRepository.getNewsBasedSource(source: 'invalid_source'),
          throwsException);
    });

    test('throws exception when category is invalid', () async {
      final exception =
          Exception('Failed to get source list based on invalid category');
      when(() => newsRepository.getListSourceBasedCategory(
          category: any(named: 'category'))).thenThrow(exception);

      expect(
          () => newsRepository.getListSourceBasedCategory(
              category: 'invalid_category'),
          throwsException);
    });

    test('throws exception when searchParams is invalid', () async {
      final exception =
          Exception('Failed to get news based on invalid searchParams');
      when(() => newsRepository.getSearchNews(
          searchParams: any(named: 'searchParams'))).thenThrow(exception);

      expect(() => newsRepository.getSearchNews(searchParams: ''),
          throwsException);
    });
  });
}
