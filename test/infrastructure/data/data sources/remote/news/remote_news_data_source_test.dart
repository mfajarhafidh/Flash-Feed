import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:flashfeed/domain/entities/news/source_list_model.dart';
import 'package:flashfeed/domain/core/constants/constants.dart';
import 'package:flashfeed/infrastructure/data/data%20sources/remote/news/remote_news_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get/get_connect/connect.dart';
import 'package:test/test.dart';

class MockGetConnect extends Mock implements GetConnect {}

void main() {
  late RemoteNewsDataSource remoteDataSource;
  late GetConnect mockHttpClient;

  setUp(() {
    mockHttpClient = MockGetConnect();
    remoteDataSource = RemoteNewsDataSource(httpClient: mockHttpClient);
  });

  group('getSearchNews', () {
    final searchParams = 'Apple';
    // final responseModel =
    //     NewsModel.fromJson({'totalResults': 0, 'articles': []});
    final responseModel =
        NewsModel.fromJson({'status': 'ok', 'totalResults': 1, 'articles': []});

    test('should return NewsModel when the response code is 200 (success)',
        () async {
      // arrange
      when(() => mockHttpClient.get(
            'everything?q=$searchParams&apiKey=${StorageConstants.apiKey}',
            decoder: any(named: 'decoder'),
          )).thenAnswer((_) async => Response<NewsModel>(
            statusCode: 200,
            statusText: 'OK',
            headers: {},
          ));

      // act
      // final result =
      //     await remoteDataSource.getSearchNews(searchParams: searchParams);

      // assert
      expect(await remoteDataSource.getSearchNews(searchParams: searchParams),
          equals(responseModel));
    });

    test('should throw a DataSourceException when the response code is not 200',
        () async {
      // arrange
      when(() => mockHttpClient.get(
            'everything?q=$searchParams&apiKey=${StorageConstants.apiKey}',
            decoder: any(named: 'decoder'),
          )).thenAnswer((_) async => Response<NewsModel>(
            statusCode: 404,
            statusText: 'Not Found',
            headers: {},
          ));

      // act
      final call = remoteDataSource.getSearchNews;

      // assert
      expect(() => call(searchParams: searchParams),
          throwsA(isA<DataSourceException>()));
    });
  });

  group('getListSourceBasedCategory', () {
    final category = 'Business';
    final responseModel = SourceListModel.fromJson({'sources': []});

    test(
        'should return SourceListModel when the response code is 200 (success)',
        () async {
      // arrange
      when(() => mockHttpClient.get(
            'top-headlines/sources?category=$category&apiKey=${StorageConstants.apiKey}',
            decoder: any(named: 'decoder'),
          )).thenAnswer((_) async => Response<SourceListModel>(
            statusCode: 200,
            statusText: 'OK',
            headers: {},
          ));

      // act
      final result =
          await remoteDataSource.getListSourceBasedCategory(category: category);

      // assert
      expect(result, equals(responseModel));
    });

    test('should throw a DataSourceException when the response code is not 200',
        () async {
      // arrange
      when(() => mockHttpClient.get(
            'top-headlines/sources?category=$category&apiKey=${StorageConstants.apiKey}',
            decoder: any(named: 'decoder'),
          )).thenAnswer((_) async => Response<SourceListModel>(
            statusCode: 404,
            statusText: 'Not Found',
            headers: {},
          ));

      // act
      final call = remoteDataSource.getListSourceBasedCategory;

      // assert
      expect(
          () => call(category: category), throwsA(isA<DataSourceException>()));
    });
  });
}
