import 'package:flashfeed/domain/use%20cases/list_source/get_list_source_based_category_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flashfeed/domain/entities/news/source_list_model.dart';
import 'package:flashfeed/domain/repositories/news/news_repository.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late GetListSourceBasedCategoryUseCase getListSourceBasedCategoryUseCase;
  late NewsRepository newsRepository;

  setUp(() {
    newsRepository = MockNewsRepository();
    getListSourceBasedCategoryUseCase =
        GetListSourceBasedCategoryUseCase(newsRepository);
  });

  group('Get list of news sources based on category', () {
    final tCategory = 'business';
    final tSourceList = SourceListModel(sources: []);

    test(
        'should return a list of sources when the call to the repository is successful',
        () async {
      // arrange
      when(() => newsRepository.getListSourceBasedCategory(category: tCategory))
          .thenAnswer((_) async => tSourceList);

      // act
      final result =
          await getListSourceBasedCategoryUseCase.call(category: tCategory);

      // assert
      expect(result, tSourceList);
      verify(() =>
              newsRepository.getListSourceBasedCategory(category: tCategory))
          .called(1);
      verifyNoMoreInteractions(newsRepository);
    });

    test(
        'should throw an exception when the call to the repository is unsuccessful',
        () async {
      // arrange
      const errorMessage = 'An error occurred';
      when(() => newsRepository.getListSourceBasedCategory(category: tCategory))
          .thenThrow(Exception(errorMessage));

      // assert
      expect(() => getListSourceBasedCategoryUseCase.call(category: tCategory),
          throwsA(isA<Exception>()));
      verify(() =>
              newsRepository.getListSourceBasedCategory(category: tCategory))
          .called(1);
      verifyNoMoreInteractions(newsRepository);
    });
  });
}
