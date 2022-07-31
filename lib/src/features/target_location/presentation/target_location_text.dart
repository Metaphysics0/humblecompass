import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/category_picker/application/selected_category_provider.dart';
import 'package:humblecompass/src/features/target_location/application/target_location_provider.dart';
import 'package:humblecompass/src/features/target_location/data/target_location.dart';
import 'package:humblecompass/src/features/user_location/application/user_location_provider.dart';
import 'package:humblecompass/src/styles/text_styles.dart';

class TargetLocationText extends ConsumerWidget {
  const TargetLocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Position> userPosition = ref.watch(userPositionStreamProvider);
    final TargetLocation? targetLocation = ref.watch(targetLocationProvider);

    return (targetLocation == null)
        ? _searchText(ref)
        : _foundText(targetLocation, userPosition);
  }
}

AnimatedTextKit _searchText(WidgetRef ref) {
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

Text _foundText(TargetLocation target, AsyncValue<Position> userPosition) {
  userPosition.when(
    data: (pos) => Text(pos.toString()),
    error: (err, stack) => Text('Error: $err'),
    loading: () => const Text("loading..."),
  );
  // if (userPosition == null) return _enableLocationServicesText(ref);

  double distanceInMeters =
      Geolocator.distanceBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838);
  return Text(
    "Found ${target.name}!",
    style: textStyles.search,
  );
}

Text _enableLocationServicesText(WidgetRef ref) => Text(
      "Enable location services to find nearby ${ref.watch(categoryProvider).searchText.toLowerCase()}!",
      style: textStyles.search,
    );
