import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/features/target_location/presentation/target_location_text/next_button.dart';
import 'package:humblecompass/src/styles/text_styles.dart';
import 'package:humblecompass/src/utils/distance_helper.dart';

Widget foundText(
  List<TargetLocation?>? targetLocations,
  AsyncValue<Position> userPositionStream,
  Position? lastKnownPosition,
) {
  final Position? userPosition =
      userPositionStream.whenData((pos) => pos).asData?.value;

  print("TARGET LOCATIONS: $targetLocations");
  if (targetLocations == []) {
    return const Text("No target location found");
  }

  TargetLocation? target =
      targetLocations!.length > 0 ? targetLocations.first : null;

  final double distance = _getDistanceFromTarget(
    target,
    userPosition,
    lastKnownPosition,
  );

  final searchText = Text(
    "${target?.name} ${distanceHelper.prettyPrint(distance)} away!",
    style: textStyles.search,
  );

  final containerChildren = [
    searchText,
    nextButton(targetLocations),
  ];

  return Flex(
    direction: Axis.horizontal,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: containerChildren,
  );
}

double _getDistanceFromTarget(
  TargetLocation? target,
  Position? userPosition,
  Position? lastKnownPosition,
) {
  if (target == null || userPosition == null) {
    return 0.0;
  }
  if (lastKnownPosition is Position) {
    return target.distanceBetween(lastKnownPosition);
  }

  if (userPosition is Position) {
    return target.distanceBetween(userPosition);
  }

  return 0.0;
}
