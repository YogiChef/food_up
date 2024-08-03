import 'package:move_on/src/base/localstores/local_storage_usecase_parameters.dart';
import 'package:move_on/src/base/localstores/remove_local_storage_repository.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

abstract class RemoveLocalStorageUseCase {
  Future<void> execute({required RemoveLocalStorageParameters parameters});
}

class DefaultRemoveLocalStorageUseCase extends RemoveLocalStorageUseCase {
  final RemoveLocalStorageRepository _removeLocalStorageRepository;
  DefaultRemoveLocalStorageUseCase(
      {RemoveLocalStorageRepository? removeLocalStorageRepository})
      : _removeLocalStorageRepository = removeLocalStorageRepository ??
            DefaultRemoveLocalStorageRepository();
  @override
  Future<void> execute(
      {required RemoveLocalStorageParameters parameters}) async {
    return await _removeLocalStorageRepository.removeInLocalStorage(
        key: parameters.key);
  }
}
