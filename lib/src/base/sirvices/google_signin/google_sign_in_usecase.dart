import 'package:move_on/services/local_key.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/sirvices/google_signin/google_service.dart';
import 'package:move_on/src/base/sirvices/google_signin/google_signin_user_entity.dart';
import 'package:move_on/services/date_helpers.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/users/save_user_data_usecase_parameter.dart';
import 'package:move_on/src/base/localstores/local_storage_usecase_parameters.dart';
import 'package:move_on/auth/users/user_entity.dart';
import 'package:move_on/src/base/localstores/save_local_storage_usecase.dart';
import 'package:move_on/auth/users/save_user_data_usecase.dart';

abstract class GoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> execute();
}

class DefaultGoogleSignInUseCase extends GoogleSignInUseCase {
  final GoogleSignInService _signInService;
  final SaveLocalStorageUseCase _storageUseCase;
  final SaveUserDataUseCase _dataUseCase;

  DefaultGoogleSignInUseCase(
      {GoogleSignInService? signInService,
      SaveLocalStorageUseCase? storageUseCase,
      SaveUserDataUseCase? dataUseCase})
      : _signInService = signInService ?? DefaultGoogleSignInService(),
        _storageUseCase = storageUseCase ?? DefaultSaveLocalStorageUseCase(),
        _dataUseCase = dataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<UserEntity, Failure>> execute() async {
    final user = await _signInService.signInWithGoogle();
    _storageUseCase.execute(
        parameters: SaveLocalStorageParameters(
            key: LocalStorageKeys.idToken, value: user.idToken ?? ''));

    final isUserInDataBase =
        await _signInService.isUserInDatabase(uid: user.uid ?? '');

    if (isUserInDataBase) {
      return Result.success(_mapUserEntity(user: user));
    } else {
      return _saveUserInDataBase(user: user);
    }
  }
}

extension Mapper on DefaultGoogleSignInUseCase {
  UserEntity _mapUserEntity({required GoogleSignInUserEntity user}) {
    return UserEntity(
      billingAddress: '',
      dateOfBirth: '',
      email: user.email,
      idToken: user.idToken,
      localId: user.uid!,
      phone: user.phoneNumber,
      photo: user.photoUrl,
      role: UserRole.user.toshortString(),
      shippingAddress: '',
      startDate: DateHelpers.getStartDate(),
      username: user.displayName,
    );
  }
}

extension PrivateMethods on DefaultGoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> _saveUserInDataBase(
      {required GoogleSignInUserEntity user}) {
    final SaveUserDataUseCaseParameters params = SaveUserDataUseCaseParameters(
      billingAddress: '',
      dateOfBirth: '',
      email: user.email,
      idToken: user.idToken,
      localId: user.uid!,
      phone: user.phoneNumber,
      photo: user.photoUrl,
      role: UserRole.user,
      shippingAddress: '',
      startDate: DateHelpers.getStartDate(),
      username: user.displayName,
    );
    return _dataUseCase.execute(parameters: params);
  }
}
