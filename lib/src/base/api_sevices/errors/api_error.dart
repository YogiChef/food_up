// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:move_on/src/base/api_sevices/errors/error_message.dart';
import 'package:move_on/src/base/api_sevices/errors/error_decodable.dart';

class Failure {
  String? message;
  Map<String, dynamic> error = {};

  @override
  String toString() => message ?? 'Hi un error inesperado';

  Failure.fromMessage({this.message});

  Failure.fromBody({required String body}) {
    var jsonData = jsonDecode(body);
    error = jsonData;
  }

  static Failure getFirebaseAuthErrorMessage(
      {required Map<String, dynamic> error}) {
    ErrorDecodable _error = ErrorDecodable.fromMap(error);

    var message = "";
    _error.error.errors.forEach((error) {
      message = error.message;
    });

    if (message == "EMAIL_NOT_FOUND") {
      return Failure.fromMessage(
          message: FBFailureMessages.emailNotFoundMessage);
    } else if (message == "INVALID_PASSWORD") {
      return Failure.fromMessage(
          message: FBFailureMessages.invalidPasswordMessage);
    } else if (message == "EMAIL_EXISTS") {
      return Failure.fromMessage(message: FBFailureMessages.emailExisMessage);
    } else if (message == "TOO_MANY_ATTEMPTS_TRY_LATER") {
      return Failure.fromMessage(
          message: FBFailureMessages.tooManyAttemptsMessage);
    } else if (message == "INVALID_ID_TOKEN") {
      return Failure.fromMessage(
          message: FBFailureMessages.invalidIdTokenMessage);
    } else if (message == "USER_NOT_FOUND") {
      return Failure.fromMessage(
          message: FBFailureMessages.userNotFoundMessage);
    } else {
      return Failure.fromMessage(message: message);
    }
  }
}
