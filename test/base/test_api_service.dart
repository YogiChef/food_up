// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_test/flutter_test.dart';
import 'package:move_on/src/base/api_sevices/api_service.dart';

import 'api_service/mocks/test_api_mock.dart';

abstract class _Constants {
  static Map<String, String> defaultHeaders = {
    'Content-type': 'application/json; charset=UTF-8'
  };
  static String postEnpoint = 'https://jsonplaceholder.typicode.com/posts';
  static String getEnpoint = 'https://jsonplaceholder.typicode.com/posts/1';
  static String putEnpoint = 'https://jsonplaceholder.typicode.com/posts/1';
}

void main() {
  final ApiService _testApiService = DefaultApiService();
  group('Test Correct Connection of Api Service', () {
    test('Test Correct Post Connection to jsonplaceholder', () async {
      final bodyParams =
          CorrectPostBodyParams(title: 'title', body: 'body', userId: 1234);
      final result = await _testApiService.getDataFromPostRequest(
          bodyParam: bodyParams.toMap(),
          url: _Constants.postEnpoint,
          headers: _Constants.defaultHeaders);

      expect(result, Map.from(result));
    });

    test('Test Correct get Connection to json Placeholder', () async {
      final result = await _testApiService.getDataFromGetRequest(
          url: _Constants.getEnpoint);

      expect(result, Map.from(result));
    });

    test('Test Correct Put Connection to jsonPlaceholder', () async {
      final body = CorrectPutBodyParams(
          id: 12, title: 'title', body: 'body', userId: 1234);
      final result = await _testApiService.getDataFromPutRequest(
          bodyParam: body.toMap(),
          url: _Constants.putEnpoint,
          headers: _Constants.defaultHeaders);

      expect(result, Map.from(result));
    });
  });
}
