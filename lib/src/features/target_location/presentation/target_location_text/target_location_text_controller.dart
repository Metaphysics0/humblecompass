import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/features/target_location/presentation/target_location_text/next_button.dart';
import 'package:humblecompass/src/features/category_picker/application/selected_category_provider.dart';
import 'package:humblecompass/src/styles/text_styles.dart';
import 'package:humblecompass/src/utils/distance_helper.dart';

Widget getFoundText(
  List<TargetLocation?>? targetLocations,
  AsyncValue<Position> userPositionStream,
  Position? lastKnownPosition,
) {
  final AsyncValue<Position?> userPosition = userPositionStream;

  if (targetLocations!.isEmpty) {
    return const Text("No target location found");
  }

  TargetLocation? target =
      targetLocations.isNotEmpty ? targetLocations.first : null;

  return userPosition.when(
    data: (userPosition) {
      final distance = _getDistanceFromTarget(
        target,
        userPosition,
        lastKnownPosition,
      );

      final searchText = Text(
        "${target?.name} $distance away!",
        style: textStyles.search,
      );

      final containerChildren = [
        searchText,
        nextButton(targetLocations),
      ];

      return createView(containerChildren);
    },
    error: ((error, stackTrace) => Text("Error: $error")),
    loading: () => const Text("Loading..."),
  );
}

Flex createView(List<Widget> containerChildren) => Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: containerChildren,
    );

AnimatedTextKit getIsSearchingText(WidgetRef ref) {
  return AnimatedTextKit(
    animatedTexts: [
      FadeAnimatedText(
        "Searching for nearby ${ref.watch(categoryProvider).searchText.toLowerCase()} ...",
        textStyle: textStyles.search,
        duration: const Duration(milliseconds: 2200),
      ),
    ],
    repeatForever: true,
  );
}

String _getDistanceFromTarget(
  TargetLocation? target,
  Position? userPosition,
  Position? lastKnownPosition,
) {
  try {
    if (target == null || userPosition == null) {
      return "0.0";
    }
    print("Target:  Lat ${target.latitude}, Long ${target.longitude}");
    final distance = target.distanceBetween(userPosition);
    print("target distance: $distance");

    return distanceHelper.prettyPrint(distance);
  } catch (e) {
    print("Error getting distance from target: $e");
    return "0.0";
  }
}