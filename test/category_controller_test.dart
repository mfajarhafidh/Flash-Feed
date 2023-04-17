import 'package:flashfeed/presentation/controllers/category/category_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoryController', () {
    late CategoryController controller;

    setUp(() {
      controller = CategoryController();
    });

    test('should update the category value', () {
      const categoryValue = 'Books';

      controller.category.value = categoryValue;

      expect(controller.category.value, equals(categoryValue));
    });
  });
}
