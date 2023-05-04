import 'package:flashfeed/domain/use%20cases/search/get_search_news_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:flashfeed/domain/repositories/news/news_repository.dart';

// create a mock repository for the news
class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late GetSearchNewsUseCase usecase;
  late NewsRepository mockRepository;

  setUp(() {
    mockRepository = MockNewsRepository();
    usecase = GetSearchNewsUseCase(mockRepository);
  });

  final tSearchParams = 'covid'; // test search params

  group('GetSearchNewsUseCase tests -', () {
    test('should get news from the repository', () async {
      // arrange
      final tNewsModel = NewsModel();
      when(() => mockRepository.getSearchNews(
              searchParams: any(named: 'searchParams')))
          .thenAnswer((_) async => tNewsModel);

      // act
      final result = await usecase(searchParams: tSearchParams);

      // assert
      expect(result, equals(tNewsModel));
      verify(() => mockRepository.getSearchNews(searchParams: tSearchParams))
          .called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test(
        'should throw an exception when there is an error getting news from the repository',
        () async {
      // arrange
      final tException = Exception('Failed to get news');
      when(() => mockRepository.getSearchNews(
          searchParams: any(named: 'searchParams'))).thenThrow(tException);

      // assert
      expect(
          () => usecase.call(searchParams: tSearchParams), throwsA(tException));
      verify(() => mockRepository.getSearchNews(searchParams: tSearchParams))
          .called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
