// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers

import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/errors/error_message.dart';
import 'package:move_on/services/date_helpers.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/users/user_photo_helpers.dart';
import 'package:move_on/auth/users/save_user_data_usecase.dart';
import 'package:move_on/auth/users/save_user_data_usecase_parameter.dart';
import 'package:move_on/auth/sign_up/sign_up.dart';
import 'package:move_on/auth/sign_up/sign_up_repository.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';
import 'package:move_on/auth/sign_up/sign_up_entity.dart';
import 'package:move_on/auth/sign_up/sign_up_usecase_parameters.dart';
import 'package:move_on/auth/users/user_entity.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters params});
}

class DefaultSignUpUseCas extends SignUpUseCase {
  final SignUpRepository _signUpRepository;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCas(
      {SignUpRepository? signUpRepository,
      SaveUserDataUseCase? saveUserDataUseCase})
      : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters params}) {
    return _signUpRepository
        .signUp(
            parames: SignUpRepositoryParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: FailureMessages.unExpectedErrorMessage));
          }
          SignUpEntity entity = SignUpEntity.fromMap(result.value!.toMap());
          return saveUserdataInDataBase(params: params, entity: entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}

extension on DefaultSignUpUseCas {
  Future<Result<SignUpEntity, Failure>> saveUserdataInDataBase(
      {required SignUpUseCaseParameters params, required SignUpEntity entity}) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
        billingAddress: '',
        dateOfBirth: params.date,
        email: params.email,
        idToken: entity.idToken,
        localId: entity.localId,
        phone: params.phone,
        photo: UserPhotoHelpers.defaultUserPhoto,
        role: UserRole.user,
        shippingAddress: 'shippingAddress',
        startDate: DateHelpers.getStartDate(),
        username: params.username);

    return _saveUserDataUseCase.execute(parameters: _params).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
