import 'package:geolocator/geolocator.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_map_service.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_service.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_entity.dart';

abstract class GeolocationFailureMessages {
  static String locationServicesDisabled = "Location Services are disabled.";
  static String locationPermissionsDenied = "Location Permissions are denied.";
  static String locationPermissionsDeniedForever =
      'Location permissions are permanently denied, we cannot request permissions.';
}

class DefaultGeolocationService extends GeolocationService {
  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() async {
    return await _determinePosition().then((position) {
      return Result.success(GeolocationMapService.mapPosition(position));
    }, onError: (e) {
      return Result.failure(Failure.fromMessage(message: e.toString()));
    });
  }

  @override
  Future<LocationPermissionStatus> getPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.denied:
        return LocationPermissionStatus.denied;
      case LocationPermission.deniedForever:
        return LocationPermissionStatus.deniedForever;
      case LocationPermission.whileInUse:
        return LocationPermissionStatus.allowed;
      case LocationPermission.always:
        return LocationPermissionStatus.allowed;
      case LocationPermission.unableToDetermine:
        return LocationPermissionStatus.denied;
    }
  }
}

extension PrivateMethods on DefaultGeolocationService {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(GeolocationFailureMessages.locationServicesDisabled);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
            GeolocationFailureMessages.locationPermissionsDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          GeolocationFailureMessages.locationPermissionsDeniedForever);
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
