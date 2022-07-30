import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/data/target_location.dart';
import 'package:humblecompass/src/features/target_location/domain/google_api.dart';

Future<TargetLocation?> fetchTargetLocation(
  Position userPosition,
  Category targetCategory,
) async {
  final targetLocation = await GoogleApi().fetchTargetLocation(
    userPosition,
    targetCategory,
  );

  return _formatTargetLocation(targetLocation);
}

TargetLocation? _formatTargetLocation(SearchResult? result) {
  if (result == null) return null;

  return TargetLocation(
    longitude: result.geometry?.location?.lng,
    latitude: result.geometry?.location?.lat,
    name: result.name,
    address: result.formattedAddress,
    priceLevel: result.priceLevel,
    rating: result.userRatingsTotal,
  );
}
