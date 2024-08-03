import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_entity.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_usecase.dart';
import 'package:move_on/src/views/base_view.dart';

abstract class ExploreTabViewModelInput {
  Future<Result<bool, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermission();
}

abstract class TabsPageViewModel extends ExploreTabViewModelInput
    with BaseViewModel {}

class DefaultTabsPageViewModel extends TabsPageViewModel {
  final GeolocationUseCase _useCase;
  DefaultTabsPageViewModel({GeolocationUseCase? useCase})
      : _useCase = useCase ?? DefaultGeolocationUseCase();

  @override
  void initState({required LoadingStateProvider loadingProvider}) {
    loadingState = loadingProvider;
  }

  @override
  Future<Result<bool, Failure>> getCurrentPosition() async {
    return await _useCase.getCurrentPosition().then((value) {
      switch (value.status) {
        case ResultStatus.success:
          return Result.success(true);
        case ResultStatus.error:
          return Result.failure(value.error);
      }
    });
  }

  @override
  Future<LocationPermissionStatus> getPermission() {
    return _useCase.getPermission();
  }
}
