import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';
import 'package:humblecompass/config/env.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/utils/future_helper.dart';

class GoogleApiService {
  final GooglePlace googlePlace = GooglePlace(appEnv.googlePlacesApiKey);

  Future<TargetLocation?> fetchTargetLocation(
    Position userPosition,
    Category targetCategory,
  ) async {
    try {
      final response = await googlePlace.search.getNearBySearch(
        Location(
          lat: userPosition.latitude,
          lng: userPosition.longitude,
        ),
        500, // radius
        type: targetCategory.searchType,
        keyword: targetCategory.searchText,
        rankby: RankBy.Distance,
        opennow: true,
      );
      return processNearbySearchResponse(response);
    } catch (e) {
      futureHelper.throwError(e.toString());
      return null;
    }
  }

  TargetLocation processNearbySearchResponse(NearBySearchResponse? response) {
    final result = response?.results!.first;

    return TargetLocation(
      longitude: result?.geometry?.location?.lng,
      latitude: result?.geometry?.location?.lat,
      name: result?.name,
      address: result?.formattedAddress,
      priceLevel: result?.priceLevel,
      rating: result?.userRatingsTotal,
    );
  }
}

final GoogleApiService googleApiService = GoogleApiService();
