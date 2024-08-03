import 'package:move_on/services/local_key.dart';
import 'package:move_on/src/base/localstores/local_storage_usecase_parameters.dart';
import 'package:move_on/src/base/localstores/remove_local_storage_usecase.dart';

abstract class SignOutUseCase {
  Future<void> execute();
}

class DefaultSignOutUserCase extends SignOutUseCase {
  final RemoveLocalStorageUseCase _localStorageUseCase;
  DefaultSignOutUserCase({RemoveLocalStorageUseCase? localStorageUseCase})
      : _localStorageUseCase =
            localStorageUseCase ?? DefaultRemoveLocalStorageUseCase();

  @override
  Future<void> execute() async {
    return _localStorageUseCase.execute(
        parameters:
            RemoveLocalStorageParameters(key: LocalStorageKeys.idToken));
  }
}
