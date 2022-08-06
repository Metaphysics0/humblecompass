import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/target_location/domain/position.dart';
import 'package:humblecompass/src/utils/distance_helper.dart';

class TargetLocation extends GlobalPosition {
  final String name;
  final String address;
  final int? rating;
  final String? phone;
  final int? priceLevel;
  double? bearing = 0.0;

  TargetLocation({
    required super.longitude,
    required super.latitude,
    required this.name,
    required this.address,
    this.bearing,
    this.priceLevel,
    this.phone,
    this.rating,
    super.altitude,
  });

  double bearingTo(Position other) {
    return distanceHelper.bearingBetween(other, this);
  }
}
