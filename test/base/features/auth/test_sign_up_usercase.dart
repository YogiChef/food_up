// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter_test/flutter_test.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/errors/error_message.dart';
import 'package:move_on/src/base/api_sevices/errors/error_decodable.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/sign_up/sign_up_entity.dart';
import 'package:move_on/auth/sign_up/sign_up_usecase.dart';
import 'package:move_on/auth/sign_up/sign_up_usecase_parameters.dart';

abstract class _Constants {
  static String correctEmail = 'nep_prodev@gmail.com';
  static String correctPass = '252614059';
  static String wrongEmail = 'ppsstr@gmail.com';
  static String wrongPass = '284738473';
}

void main() {
  SignUpUseCase sut = DefaultSignUpUseCas();
  group('Test success SignUp user in Firebase', () {
    test('Test success SignUp user in Firebase', () async {
      final SignUpUseCaseParameters params = SignUpUseCaseParameters(
          email: _Constants.correctEmail,
          password: _Constants.correctPass,
          date: '17/07/2024',
          username: 'Prasert',
          phone: '0925403189');

      final result = await sut.execute(params: params);
      switch (result.status) {
        case ResultStatus.success:
          expect(result.value, isA<SignUpEntity>());
          break;
        case ResultStatus.error:
          expect(result.error, Failure);
          break;
      }
    });
  });

  group('Test failure SignUP in Firebase', () {
    test('Test failure SignUP in Firebase', () async {
      try {
        final SignUpUseCaseParameters params = SignUpUseCaseParameters(
            username: 'username',
            email: _Constants.wrongEmail,
            password: _Constants.wrongPass,
            phone: '0925403189',
            date: '17/06/2024');
        final result = await sut.execute(params: params);
      } on Failure catch (e) {
        ErrorDecodable _error = e as ErrorDecodable;
        expect(_error.error.message, FBFailureMessages.emailExisMessage);
      }
    });
  });
}
