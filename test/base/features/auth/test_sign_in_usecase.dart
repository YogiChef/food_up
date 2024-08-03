// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_test/flutter_test.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/errors/error_message.dart';
import 'package:move_on/src/base/api_sevices/errors/error_decodable.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/login/sign_in_entity.dart';
import 'package:move_on/auth/login/sign_in_usecase.dart';
import 'package:move_on/auth/login/sign_in_usecase_body_parameters.dart';

abstract class _Constants {
  static String correctEmail = 'nep_ppssrt@gmail.com';
  static String correctPass = '252614059';
  static String wrongEmail = 'ppsstr@gmail.com';
  static String wrongPass = '284738473';
}

void main() {
  final SignInUseCase sut = DefaultSignInUseCase();

  group('Test success response to SignInUseCase', () {
    test('Text success signIn feature with correct email and password',
        () async {
      final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(
          email: _Constants.correctEmail, password: _Constants.correctPass);

      var result = await sut.execute(params: _params);
      switch (result.status) {
        case ResultStatus.success:
          expect(result.value, isA<SignInEntity>());
          break;
        case ResultStatus.error:
          expect(result.error, Failure);
          break;
      }
    });
  });

  group('Test success response to SignInUseCase', () {
    test('Test success response to SignInUseCase', () async {
      final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(
          email: _Constants.wrongEmail, password: _Constants.wrongPass);

      try {
        final _ = await sut.execute(params: _params);
      } on Failure catch (e) {
        ErrorDecodable _error = e as ErrorDecodable;
        expect(_error.error.message, FBFailureMessages.emailNotFoundMessage);
      }
    });

    test('Test success response to SignInUseCase with wrong password',
        () async {
      final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(
          email: _Constants.correctEmail, password: _Constants.wrongPass);

      try {
        final _ = await sut.execute(params: _params);
      } on Failure catch (e) {
        ErrorDecodable _error = e as ErrorDecodable;
        expect(_error.error.message, FBFailureMessages.invalidPasswordMessage);
      }
    });
  });
}
