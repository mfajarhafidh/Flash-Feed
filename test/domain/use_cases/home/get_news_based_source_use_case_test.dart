import 'package:flashfeed/domain/entities/news/article_model.dart';
import 'package:flashfeed/domain/use%20cases/home/get_news_based_source_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flashfeed/domain/entities/news/news_model.dart';
import 'package:flashfeed/domain/repositories/news/news_repository.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late NewsRepository newsRepository;
  late GetNewsBasedSourceUseCase getNewsBasedSourceUseCase;

  setUp(() {
    newsRepository = MockNewsRepository();
    getNewsBasedSourceUseCase = GetNewsBasedSourceUseCase(newsRepository);
  });

  group('GetNewsBasedSourceUseCase', () {
    const source = 'CNN';

    test('should get news based on source from repository', () async {
      final expectedNews = NewsModel();
      when(() => newsRepository.getNewsBasedSource(source: source))
          .thenAnswer((_) async => expectedNews);

      final result = await getNewsBasedSourceUseCase.call(source: source);

      expect(result, expectedNews);
      verify(() => newsRepository.getNewsBasedSource(source: source)).called(1);
      verifyNoMoreInteractions(newsRepository);
    });

    test('should throw an exception when repository throws an exception', () {
      const errorMessage = 'An error occurred';
      when(() => newsRepository.getNewsBasedSource(source: source))
          .thenThrow(Exception(errorMessage));

      expect(() => getNewsBasedSourceUseCase.call(source: source),
          throwsA(isA<Exception>()));
      verify(() => newsRepository.getNewsBasedSource(source: source)).called(1);
      verifyNoMoreInteractions(newsRepository);
    });
  });
}
