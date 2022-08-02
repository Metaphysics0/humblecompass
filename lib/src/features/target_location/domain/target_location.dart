import 'package:humblecompass/src/features/target_location/domain/position.dart';

class TargetLocation extends GlobalPosition {
  final String name;
  final String address;
  final int? rating;
  final String? phone;
  final int? priceLevel;

  TargetLocation({
    required super.longitude,
    required super.latitude,
    required this.name,
    required this.address,
    this.priceLevel,
    this.phone,
    this.rating,
    super.altitude,
  });
}

class TargetLocationWithoutCoordinates extends TargetLocation {
  TargetLocationWithoutCoordinates({
    required super.name,
    required super.address,
    super.priceLevel,
    super.phone,
    super.rating,
  }) : super(latitude: 0.0, longitude: 0.0);
}
