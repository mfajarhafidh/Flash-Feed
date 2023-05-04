import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:flashfeed/domain/entities/news/source_list_model.dart';
import 'package:flashfeed/infrastructure/data/data%20sources/remote/news/remote_news_data_source.dart';
import 'package:flashfeed/infrastructure/data/data%20sources/repositories/news/news_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteNewsDataSource extends Mock implements RemoteNewsDataSource {}

void main() {
  late NewsRepositoryImpl newsRepository;
  late RemoteNewsDataSource remoteNewsDataSource;

  setUp(() {
    remoteNewsDataSource = MockRemoteNewsDataSource();
    newsRepository = NewsRepositoryImpl(remoteNewsDataSource);
  });

  group('getListSourceBasedCategory', () {
    test('returns source list model when successful', () async {
      final category = 'business';
      final sourceListModel = SourceListModel(sources: []);
      when(() => remoteNewsDataSource.getListSourceBasedCategory(
          category: category)).thenAnswer((_) async => sourceListModel);

      final result =
          await newsRepository.getListSourceBasedCategory(category: category);

      expect(result, equals(sourceListModel));
    });

    test('throws an exception when unsuccessful', () {
      final category = 'unknown';
      final exception = Exception('Failed to get source list model');
      when(() => remoteNewsDataSource.getListSourceBasedCategory(
          category: category)).thenThrow(exception);

      expect(
          () => newsRepository.getListSourceBasedCategory(category: category),
          throwsException);
    });
  });

  group('getNewsBasedSource', () {
    test('returns news model when successful', () async {
      final source = 'cnn';
      final newsModel = NewsModel();
      when(() => remoteNewsDataSource.getNewsBasedSource(source: source))
          .thenAnswer((_) async => newsModel);

      final result = await newsRepository.getNewsBasedSource(source: source);

      expect(result, equals(newsModel));
    });

    test('throws an exception when unsuccessful', () {
      final source = 'unknown';
      final exception = Exception('Failed to get news model');
      when(() => remoteNewsDataSource.getNewsBasedSource(source: source))
          .thenThrow(exception);

      expect(() => newsRepository.getNewsBasedSource(source: source),
          throwsException);
    });
  });

  group('getSearchNews', () {
    test('returns news model when successful', () async {
      final searchParams = 'apple';
      final newsModel = NewsModel();
      when(() => remoteNewsDataSource.getSearchNews(searchParams: searchParams))
          .thenAnswer((_) async => newsModel);

      final result =
          await newsRepository.getSearchNews(searchParams: searchParams);

      expect(result, equals(newsModel));
    });

    test('throws an exception when unsuccessful', () {
      final searchParams = 'unknown';
      final exception = Exception('Failed to get news model');
      when(() => remoteNewsDataSource.getSearchNews(searchParams: searchParams))
          .thenThrow(exception);

      expect(() => newsRepository.getSearchNews(searchParams: searchParams),
          throwsException);
    });
  });
}
