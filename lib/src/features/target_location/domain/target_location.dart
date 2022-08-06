import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/domain/position.dart';
import 'package:humblecompass/src/utils/distance_helper.dart';

class TargetLocation extends GlobalPosition {
  final String name;
  final String address;
  final num? rating;
  final int? userRatingTotal;
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
    this.userRatingTotal,
    super.altitude,
  });

  String getPriceLevelDollarRepresentation() {
    if (priceLevel == null) return "";
    if (priceLevel == 0) return "Free";

    return "\$" * priceLevel!;
  }

  RatingBarIndicator getRatingStars(Category selectedCategory) =>
      RatingBarIndicator(
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          rating: rating?.toDouble() ?? 0.0,
          itemBuilder: (context, index) => selectedCategory.icon);

  double bearingTo(Position other) =>
      distanceHelper.bearingBetween(other, this);
}
