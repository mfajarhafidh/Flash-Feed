import 'package:flashfeed/presentation/controllers/detail_news/detail_news_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MockWebViewController extends Mock implements WebViewController {}

void main() {
  late DetailNewsController controller;
  late MockWebViewController webViewController;

  setUp(() {
    controller = DetailNewsController();
    webViewController = MockWebViewController();
  });

  group('DetailNewsController', () {
    test('should load URL and toggle isLoading to false', () async {
      // arrange
      final url = 'https://example.com';
      when(() => webViewController.setJavaScriptMode(any()))
          .thenReturn(webViewController as Future<void>);
      when(() => webViewController.loadRequest(Uri.parse(url)))
          .thenAnswer((_) async => null);

      // act
      controller.loadUrl(url: url);

      // assert
      expect(controller.isLoading.value, true);

      await Future.delayed(
          Duration(milliseconds: 100)); // Wait for async code to complete

      verify(() =>
              webViewController.setJavaScriptMode(JavaScriptMode.unrestricted))
          .called(1);
      verify(() => webViewController.loadRequest(Uri.parse(url))).called(1);
      expect(controller.isLoading.value, false);
    });

    test('should throw error and toggle isLoading to false', () async {
      // arrange
      final url = 'invalid-url'; // an invalid URL that will throw an error
      when(() => webViewController.setJavaScriptMode(any()))
          .thenReturn(webViewController as Future<void>);
      when(() => webViewController.loadRequest(Uri.parse(url)))
          .thenThrow(Exception('Error loading URL'));

      // act & assert
      expect(() => controller.loadUrl(url: url), throwsException);

      expect(controller.isLoading.value, false);
    });
  });
}
