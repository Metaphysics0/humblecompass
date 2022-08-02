import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/styles/text_styles.dart';
import 'package:humblecompass/src/utils/distance_helper.dart';

Text foundText(TargetLocation target, AsyncValue<Position> userPositionStream,
    Position? lastKnownPosition) {
  final Position? userPosition =
      userPositionStream.whenData((pos) => pos).asData?.value;

  final double distance = _getDistanceFromTarget(
    target,
    userPosition,
    lastKnownPosition,
  );

  return Text(
    "${target.name} ${distanceHelper.prettyPrint(distance)} away!",
    style: textStyles.search,
  );
}

double _getDistanceFromTarget(
  TargetLocation target,
  Position? userPosition,
  Position? lastKnownPosition,
) {
  if (userPosition is Position) {
    return distanceHelper.distanceInMeters(userPosition, target);
  }
  if (lastKnownPosition is Position) {
    return distanceHelper.distanceInMeters(lastKnownPosition, target) / 1000;
  }
  return 0.0;
}
