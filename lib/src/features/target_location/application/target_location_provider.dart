import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/category_picker/application/selected_category_provider.dart';
import 'package:humblecompass/src/features/target_location/application/fetch_target_location.dart';
import 'package:humblecompass/src/features/target_location/data/target_location_repository.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/features/user_location/application/user_location_provider.dart';
import 'package:humblecompass/src/features/user_location/domain/user_position.dart';

final targetLocationProvider =
    StateNotifierProvider<TargetLocationNotifier, List<TargetLocation?>?>(
        (ref) => TargetLocationNotifier(ref));

class TargetLocationNotifier extends StateNotifier<List<TargetLocation?>?> {
  TargetLocationNotifier(this.ref) : super([]);
  Ref ref;

  setTargetLocations(List<TargetLocation?>? locations) {
    state = locations;
  }
}

final futureTargetLocationsProvider =
    FutureProvider<List<TargetLocation?>?>((ref) async {
  final selectedCategory = ref.watch(categoryProvider);
  final Position? userPosition = await getCurrentPosition();
  return await fetchNearbyPlaces(userPosition, selectedCategory);
});
