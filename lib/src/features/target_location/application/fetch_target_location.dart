import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/features/target_location/data/target_location_repository.dart';

Future<List<TargetLocation?>?> fetchNearbyPlaces(
  Position? userPosition,
  Category targetCategory,
) async {
  final targetLocationResponse = await googleApiService.fetchNearbyPlaces(
    userPosition,
    targetCategory,
  );

  return targetLocationResponse;
}
