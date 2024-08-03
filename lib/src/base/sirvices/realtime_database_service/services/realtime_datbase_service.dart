// ignore_for_file: unused_field

import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/api_service.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/interfaces.dart';

abstract class RealtimeDatabaseExceptions {
  static const String socketExceptionMessage = "No Internet connection 😑";
  static const String httpException = "Couldn't find the path 😱";
  static const String formatException = "Bad response format 👎";
}

class DefaultRealtimeDatabaseService extends RealtimeDatabaseService {
  final ApiService _apiService;

  DefaultRealtimeDatabaseService({ApiService? apiService})
      : _apiService = apiService ?? DefaultApiService();

  @override
  Future<Map<String, dynamic>> getData({required String path}) async {
    var endpoint = baseUrl + path + endUrl;

    try {
      final result = await _apiService.getDataFromGetRequest(url: endpoint);
      return result;
    } on Failure catch (e) {
      switch (e.message) {
        case RealtimeDatabaseExceptions.httpException:
          return Future.error(Failure.fromMessage(
              message: RealtimeDatabaseExceptions.httpException));
        case RealtimeDatabaseExceptions.formatException:
          return Future.error(Failure.fromMessage(
              message: RealtimeDatabaseExceptions.formatException));
        case RealtimeDatabaseExceptions.socketExceptionMessage:
          return Future.error(Failure.fromMessage(
              message: RealtimeDatabaseExceptions.socketExceptionMessage));
        default:
          return e.error;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> postData(
      {required Map<String, dynamic> bodyParameters,
      required String path}) async {
    var endpoint = baseUrl + path + endUrl;

    try {
      final result = await _apiService.getDataFromPostRequest(
          bodyParam: bodyParameters, url: endpoint);
      return result;
    } on Failure catch (e) {
      switch (e.message) {
        case RealtimeDatabaseExceptions.httpException:
          return Future.error(Failure.fromMessage(
              message: RealtimeDatabaseExceptions.httpException));
        case RealtimeDatabaseExceptions.formatException:
          return Future.error(Failure.fromMessage(
              message: RealtimeDatabaseExceptions.formatException));
        case RealtimeDatabaseExceptions.socketExceptionMessage:
          return Future.error(Failure.fromMessage(
              message: RealtimeDatabaseExceptions.socketExceptionMessage));
        default:
          return e.error;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> putData(
      {required Map<String, dynamic> bodyParameters,
      required String path}) async {
    var endpoint = baseUrl + path + endUrl;

    try {
      final result = await _apiService.getDataFromPutRequest(
          bodyParam: bodyParameters, url: endpoint);
      return result;
    } on Failure catch (e) {
      switch (e.message) {
        case RealtimeDatabaseExceptions.httpException:
          return Future.error(Failure.fromMessage(
              message: RealtimeDatabaseExceptions.httpException));
        case RealtimeDatabaseExceptions.formatException:
          return Future.error(Failure.fromMessage(
              message: RealtimeDatabaseExceptions.formatException));
        case RealtimeDatabaseExceptions.socketExceptionMessage:
          return Future.error(Failure.fromMessage(
              message: RealtimeDatabaseExceptions.socketExceptionMessage));
        default:
          return e.error;
      }
    }
  }
}
