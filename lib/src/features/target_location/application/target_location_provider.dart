import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';

final targetLocationProvider =
    StateNotifierProvider<TargetLocationNotifier, TargetLocation?>((ref) {
  return TargetLocationNotifier(ref);
});

class TargetLocationNotifier extends StateNotifier<TargetLocation?> {
  TargetLocationNotifier(this.ref) : super(null);
  Ref ref;

  setTargetLocation(TargetLocation? location) {
    state = location;
  }
}
