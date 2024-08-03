class PositionEntity {
  double longitude;
  double latitude;
  DateTime timestamp;
  double altitude;
  double accuracy;
  double heading;
  int? floor;
  double speed;
  double speedAccuracy;
  bool isMocked;

  PositionEntity({
    required this.longitude,
    required this.latitude,
    required this.timestamp,
    required this.altitude,
    required this.accuracy,
    required this.heading,
    this.floor,
    required this.speed,
    required this.speedAccuracy,
    this.isMocked = false,
  });
}

enum LocationPermissionStatus { denied, deniedForever, allowed }
