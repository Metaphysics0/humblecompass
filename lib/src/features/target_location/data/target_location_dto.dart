import 'package:google_place/google_place.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/utils/future_helper.dart';

List<TargetLocation?> processNearbySearchResponse(
  NearBySearchResponse? response,
) {
  final nearByPlaces = response?.results;

  if (nearByPlaces == null) {
    futureHelper.throwError('No places found');
    return [];
  }

  return nearByPlaces
      .map((place) => TargetLocation(
            longitude: place.geometry?.location?.lng ?? 0.0,
            latitude: place.geometry?.location?.lat ?? 0.0,
            name: place.name ?? "Name not found",
            address: place.formattedAddress ?? "Address not found",
            priceLevel: place.priceLevel,
            rating: place.userRatingsTotal,
          ))
      .toList();
}
