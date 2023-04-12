import 'package:flashfeed/domain/entities/news/article_model.dart';
import 'package:flashfeed/domain/use%20cases/home/get_search_news_use_case.dart';
import 'package:flashfeed/presentation/controllers/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetSearchNewsUseCase extends Mock implements GetSearchNewsUseCase {}

void main() {
  late SearchController searchController;
  late MockGetSearchNewsUseCase mockGetSearchNewsUseCase;

  setUp(() {
    mockGetSearchNewsUseCase = MockGetSearchNewsUseCase();
    searchController = SearchController(mockGetSearchNewsUseCase);
  });

  group('emptyValidator', () {
    test('returns null for non-empty string', () {
      expect(searchController.emptyValidator('example'), isNull);
    });
  });
}
