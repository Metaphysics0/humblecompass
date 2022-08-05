import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/target_location/application/target_location_provider.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/features/target_location/presentation/target_location_text/target_location_text_controller.dart';
import 'package:humblecompass/src/features/user_location/application/user_location_provider.dart';

class TargetLocationText extends ConsumerWidget {
  const TargetLocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<TargetLocation?>?> targetLocations =
        ref.watch(futureTargetLocationsProvider);

    return targetLocations.when(
        loading: () => getIsSearchingText(ref),
        error: ((error, stackTrace) => Text("Error: $error")),
        data: (targetLocations) => getFoundText(targetLocations, ref));
  }
}
