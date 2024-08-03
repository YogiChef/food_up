import 'package:geolocator/geolocator.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_entity.dart';

class GeolocationMapService {
  static PositionEntity mapPosition(Position position) {
    print('Geolocation => longitude ${position.longitude}');
    print('Geolocation => latitude ${position.latitude}');

    return PositionEntity(
        longitude: position.longitude,
        latitude: position.latitude,
        timestamp: position.timestamp,
        altitude: position.altitude,
        accuracy: position.accuracy,
        heading: position.heading,
        speed: position.speed,
        speedAccuracy: position.speedAccuracy);
  }
}
