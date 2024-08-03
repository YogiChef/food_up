// ignore_for_file: prefer_final_fields

import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/errors/error_message.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/login/sign_in_body_parameters.dart';
import 'package:move_on/auth/login/sign_in_repository.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';
import 'package:move_on/auth/login/sign_in_entity.dart';
import 'package:move_on/auth/login/sign_in_usecase_body_parameters.dart';

abstract class SignInUseCase {
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseBodyParameters params});
}

class DefaultSignInUseCase extends SignInUseCase {
  SignInRepository _signInRepository;

  DefaultSignInUseCase({SignInRepository? signInRepository})
      : _signInRepository = signInRepository ?? DefaultSignInRepository();
  @override
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseBodyParameters params}) {
    return _signInRepository
        .signIn(
            params: SignInBodyParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: FailureMessages.unExpectedErrorMessage));
          }
          var entity = SignInEntity.fromMap(result.value!.toMap());
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
