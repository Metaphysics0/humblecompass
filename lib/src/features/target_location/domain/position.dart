// an interface to communicate between the user's location and google API

class GlobalPosition {
  final double latitude;
  final double longitude;
  final double? altitude;

  GlobalPosition({
    required this.latitude,
    required this.longitude,
    this.altitude,
  });
}
