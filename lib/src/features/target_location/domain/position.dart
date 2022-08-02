// an interface to communicate between the user's location and google API

import 'package:geolocator/geolocator.dart';

abstract class GlobalPosition {
  double latitude = 0.0;
  double longitude = 0.0;
  final double? altitude;

  GlobalPosition({
    required this.latitude,
    required this.longitude,
    this.altitude,
  });

  double distanceBetween(Position target) {
    return Geolocator.distanceBetween(
      latitude,
      longitude,
      target.latitude,
      target.longitude,
    );
  }
}
