import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/auth/users/user_auth_data_repository_body_parameters.dart';
import 'package:move_on/auth/users/user_auth_data_usecase.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';

abstract class ValidateUseCase {
  Future<bool> execute({required String idToken});
}

class DefaultValidateUseCase extends ValidateUseCase {
  final UserAuthDataUseCase _authDataUseCase;

  DefaultValidateUseCase({UserAuthDataUseCase? authDataUseCase})
      : _authDataUseCase = authDataUseCase ?? DefaultUserAuthDataUseCase();
  @override
  Future<bool> execute({required String idToken}) async {
    try {
      return _authDataUseCase
          .execute(parameters: GetUserDataBodyParameters(idToken: idToken))
          .then((resault) {
        switch (resault.status) {
          case ResultStatus.success:
            return true;
          case ResultStatus.error:
            return false;
        }
      });
    } on Failure {
      return false;
    }
  }
}
