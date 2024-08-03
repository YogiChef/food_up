import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/errors/error_message.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/users/user_auth_data_repository_body_parameters.dart';
import 'package:move_on/auth/users/user_auth_data_repository.dart';
import 'package:move_on/auth/users/user_auth_entity.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

abstract class UserAuthDataUseCase {
  Future<Result<UserAuthEntity, Failure>> execute(
      {required GetUserDataBodyParameters parameters});
}

class DefaultUserAuthDataUseCase extends UserAuthDataUseCase {
  final UserAuthDataRepository _authDataRepository;

  DefaultUserAuthDataUseCase({UserAuthDataRepository? authDataRepository})
      : _authDataRepository =
            authDataRepository ?? DefaultUserAuthDataRepository();
  @override
  Future<Result<UserAuthEntity, Failure>> execute(
      {required GetUserDataBodyParameters parameters}) {
    return _authDataRepository
        .getUserAuthData(
            parameters: GetUserDataBodyParameters(idToken: parameters.idToken))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: FailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserAuthEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
