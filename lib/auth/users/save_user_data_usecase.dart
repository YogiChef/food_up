// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/errors/error_message.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/users/save_user_data_repository.dart';
import 'package:move_on/auth/users/save_user_data_usecase_parameter.dart';
import 'package:move_on/auth/users/user_body_parameters.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';
import 'package:move_on/auth/users/user_entity.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute(
      {required SaveUserDataUseCaseParameters parameters});
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {
  final SaveUserDataRepository _dataRepository;

  DefaultSaveUserDataUseCase({SaveUserDataRepository? dataRepository})
      : _dataRepository = dataRepository ?? DefaultSaveUserDataRepository();
  @override
  Future<Result<UserEntity, Failure>> execute(
      {required SaveUserDataUseCaseParameters parameters}) {
    UserBodyParameters _parameters = UserBodyParameters(
      billingAddress: parameters.billingAddress,
      doteOfBirth: parameters.dateOfBirth,
      email: parameters.email,
      idToken: parameters.idToken,
      localId: parameters.localId,
      phone: parameters.phone,
      photo: parameters.photo,
      role: parameters.role?.toshortString(),
      shippingAddress: parameters.shippingAddress,
      startDate: parameters.startDate,
      username: parameters.username,
    );
    return _dataRepository.saveUserData(parameters: _parameters).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: FailureMessages.unExpectedErrorMessage));
          }
          var _entity = UserEntity.fromMap(result.value!.toMap());
          return Result.success(_entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
