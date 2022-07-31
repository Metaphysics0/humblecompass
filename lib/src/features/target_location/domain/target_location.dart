import 'package:humblecompass/src/features/target_location/domain/position.dart';

class TargetLocation extends GlobalPosition {
  final String? name;
  final String? address;
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
