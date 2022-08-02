import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';

final targetLocationProvider =
    StateNotifierProvider<TargetLocationNotifier, List<TargetLocation?>?>(
        (ref) {
  return TargetLocationNotifier(ref);
});

class TargetLocationNotifier extends StateNotifier<List<TargetLocation?>?> {
  TargetLocationNotifier(this.ref) : super([]);
  Ref ref;

  setTargetLocations(List<TargetLocation?>? locations) {
    state = locations;
  }
}
