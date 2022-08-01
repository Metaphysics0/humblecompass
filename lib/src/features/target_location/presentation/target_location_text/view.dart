import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/target_location/application/target_location_provider.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/features/target_location/presentation/target_location_text/found_text.dart';
import 'package:humblecompass/src/features/target_location/presentation/target_location_text/search_text.dart';
import 'package:humblecompass/src/features/user_location/application/user_location_provider.dart';

class TargetLocationText extends ConsumerWidget {
  const TargetLocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Position> userPositionStream =
        ref.watch(userPositionStreamProvider);
    final TargetLocation? targetLocation = ref.watch(targetLocationProvider);
    final Position? lastKnownPosition = ref.watch(lastKnownPositionProvider);

    return (targetLocation == null)
        ? searchText(ref)
        : foundText(targetLocation, userPositionStream, lastKnownPosition);
  }
}
