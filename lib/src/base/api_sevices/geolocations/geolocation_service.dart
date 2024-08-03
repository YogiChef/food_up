import 'package:geolocator/geolocator.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_failure_messages_service.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_map_service.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_entity.dart';

abstract class GeolocationService {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermission();
}

abstract class GeolocationHelperService {
  double getDistanceBetweenInMetters(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  );
  double getDistanceBetweenInKilometters(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  );
}

class DefaultGeolocationServiceHelper extends GeolocationHelperService {
  @override
  double getDistanceBetweenInKilometters(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude) {
    return Geolocator.distanceBetween(startLatitude, startLongitude,
            destinationLatitude, destinationLongitude) /
        1000;
  }

  @override
  double getDistanceBetweenInMetters(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude) {
    return Geolocator.distanceBetween(startLatitude, startLongitude,
        destinationLatitude, destinationLongitude);
  }
}

class MockGeolocationService extends GeolocationService {
  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() async {
    final permisionStatus = await getPermission();
    if (permisionStatus == LocationPermissionStatus.allowed) {
      var fakePosition = Position(
        longitude: 102.817612,
        latitude: 17.426045,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        altitudeAccuracy: 1,
        heading: 0.0,
        headingAccuracy: 1,
        speed: 0.0,
        speedAccuracy: 0.0,
      );
      return Result.success(GeolocationMapService.mapPosition(fakePosition));
    } else {
      return Future.error(GeolocationFailureMessages.locationPermissionsDenied);
    }
  }

  @override
  Future<LocationPermissionStatus> getPermission() async {
    return LocationPermissionStatus.allowed;
  }
}
