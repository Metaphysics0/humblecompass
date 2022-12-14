import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';

class DistanceHelper {
  double format(double distance) => (distance < 1) ? distance * 1000 : distance;

  String prettyPrint(double distance) => (distance < 1)
      ? '${(distance * 1000).toStringAsFixed(0)}m'
      : '${distance.toStringAsFixed(2)}km';

  double distanceInMeters(Position currentPosition, TargetLocation target) {
    return Geolocator.distanceBetween(
      currentPosition.latitude,
      currentPosition.longitude,
      target.latitude,
      target.longitude,
    );
  }
}

final DistanceHelper distanceHelper = DistanceHelper();
