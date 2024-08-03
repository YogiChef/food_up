import 'package:move_on/services/local_key.dart';
import 'package:move_on/src/base/localstores/local_storage_usecase_parameters.dart';
import 'package:move_on/src/base/localstores/save_local_storage_repository.dart';
import 'package:move_on/src/base/localstores/fetch_local_storage_usecase.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

abstract class SaveLocalStorageUseCase {
  Future<void> execute({required SaveLocalStorageParameters parameters});
  Future<void> saveRecentSearchInLocalStorage({required String placeId});
  Future<void> clearRecentSearchInLocalStorage();
}

class DefaultSaveLocalStorageUseCase extends SaveLocalStorageUseCase {
  final SaveLocalStorageRepository _localStorageRepository;
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;

  DefaultSaveLocalStorageUseCase(
      {SaveLocalStorageRepository? localStorageRepository,
      FetchLocalStorageUseCase? fetchLocalStorageUseCase})
      : _localStorageRepository =
            localStorageRepository ?? DefaultSaveLocalStorageRepository(),
        _fetchLocalStorageUseCase =
            fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase();
  @override
  Future<void> execute({required SaveLocalStorageParameters parameters}) async {
    _localStorageRepository.saveInLocalStorage(
        key: parameters.key, value: parameters.value);
  }

  @override
  Future<void> clearRecentSearchInLocalStorage() {
    return _localStorageRepository.saveRecentSearcInLocalStorage(
        key: LocalStorageKeys.recentSearches, value: []);
  }

  @override
  Future<void> saveRecentSearchInLocalStorage({required String placeId}) async {
    final placeIds = await _fetchLocalStorageUseCase.fetchRecentSearches();
    if (!placeIds.contains(placeId)) {
      placeIds.add(placeId);
      return _localStorageRepository.saveRecentSearcInLocalStorage(
          key: LocalStorageKeys.recentSearches, value: placeIds);
    }
  }
}
