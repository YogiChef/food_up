import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_failure_messages_service.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_service.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_parameter.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_entity.dart';

abstract class GeolocationUseCase {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermission();
  Future<double> getDistanceBetweenYourCurrentPositionAnd(
      Destination destination);
}

class DefaultGeolocationUseCase extends GeolocationUseCase {
  final GeolocationService _geolocationService;
  final GeolocationHelperService _geolocationServiceHelper;

  DefaultGeolocationUseCase(
      {GeolocationService? geolocationService,
      GeolocationHelperService? geolocationServiceHelper})
      : _geolocationService = geolocationService ?? DefaultGeolocationService(),
        _geolocationServiceHelper =
            geolocationServiceHelper ?? DefaultGeolocationServiceHelper();

  @override
  Future<double> getDistanceBetweenYourCurrentPositionAnd(
      Destination destination) async {
    final userPosition = await _geolocationService.getCurrentPosition();
    return _geolocationServiceHelper.getDistanceBetweenInKilometters(
      userPosition.value?.latitude ?? 0.0, // 17.426196,
      userPosition.value?.longitude ?? 0.0, // 102.817850,
      destination.destinationLatitude,
      destination.destinationLongitude,
    );
  }

  @override
  Future<LocationPermissionStatus> getPermission() {
    return _geolocationService.getPermission();
  }

  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() {
    return _geolocationService.getCurrentPosition();
  }
}
