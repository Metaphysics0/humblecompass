import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/data/google_api.dart';
import 'package:humblecompass/src/utils/future_helper.dart';

class GoogleApi {
  Future<SearchResult?> fetchTargetLocation(
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

      return response?.results![0];
    } catch (e) {
      futureHelper.throwError(e.toString());
      return null;
    }
  }
}
