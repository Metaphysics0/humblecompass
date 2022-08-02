import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/styles/text_styles.dart';
import 'package:humblecompass/src/utils/distance_formatter.dart';

Text foundText(TargetLocation target, AsyncValue<Position> userPositionStream,
    Position? lastKnownPosition) {
  final Position? currentPosition =
      userPositionStream.whenData((pos) => pos).asData?.value;

  double distance = 0.0;
  if (currentPosition is Position) {
    distance = distanceHelper.distanceInMeters(currentPosition, target);
  } else if (lastKnownPosition is Position) {
    distance =
        distanceHelper.distanceInMeters(lastKnownPosition, target) / 1000;
  }
  return Text(
    "${target.name} ${distanceHelper.prettyPrint(distance)} away!",
    style: textStyles.search,
  );
}
