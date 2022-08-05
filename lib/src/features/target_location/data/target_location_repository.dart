import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';
import 'package:humblecompass/config/env.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/data/target_location_dto.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/utils/future_helper.dart';

class GoogleApiService {
  static GooglePlace googlePlaceApi = GooglePlace(appEnv.googlePlacesApiKey);

  Future<List<TargetLocation?>?> fetchNearbyPlaces(
    Position? userPosition,
    Category targetCategory,
  ) async {
    try {
      if (userPosition == null) {
        futureHelper.throwError("Unable to get your current location");
        return null;
      }

      final response = await googlePlaceApi.search.getNearBySearch(
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
}

final GoogleApiService googleApiService = GoogleApiService();
