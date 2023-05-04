import 'package:flashfeed/domain/entities/news/source_list_model.dart';
import 'package:flashfeed/domain/use cases/list_source/get_list_source_based_category_use_case.dart';
import 'package:flashfeed/presentation/controllers/list_source/list_source_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetListSourceBasedCategoryUseCase extends Mock
    implements GetListSourceBasedCategoryUseCase {}

void main() {
  late ListSourceController controller;
  late GetListSourceBasedCategoryUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetListSourceBasedCategoryUseCase();
    controller = ListSourceController(mockUseCase);
  });

  test('getListSourceBasedCategory returns sources when successful', () async {
    final sources = [
      Source(name: 'Source 1', id: 'satu'),
      Source(name: 'Source 2', id: 'dua'),
    ];

    controller.sourceList.addAll(sources);

    when(() => mockUseCase.call(category: any(named: 'category')))
        .thenAnswer((_) async => SourceListModel(sources: sources));

    await controller.getListSourceBasedCategory();

    expect(controller.sourceList, equals(sources));
    expect(controller.isLoading.value, isFalse);
  });

  test('getListSourceBasedCategory handles errors', () async {
    when(() => mockUseCase.call(category: any(named: 'category')))
        .thenThrow(Exception('An error occurred'));

    await controller.getListSourceBasedCategory();

    expect(controller.sourceList, isEmpty);
    expect(controller.isLoading.value, isFalse);
  });

  test('searchForItem filters sourceList based on searchParam', () {
    final sources = [
      Source(name: 'Source 1', id: '1'),
      Source(name: 'Source 2', id: '2'),
      Source(name: 'test', id: '3'),
    ];

    controller.sourceList.addAll(sources);
    controller.searchForItem(searchParam: 'source');

    expect(controller.sourceList.length, equals(2));
    expect(controller.sourceList[0].name, equals('Source 1'));
    expect(controller.sourceList[1].name, equals('Source 2'));
  });
}
