import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/data/google_api.dart';
import 'package:humblecompass/src/utils/future_helper.dart';

Future<NearBySearchResponse?> fetchTargetLocation(
  Position? userPosition,
  Category category,
) async {
  if (userPosition == null) return null;

  try {
    final NearBySearchResponse? response =
        await googlePlace.search.getNearBySearch(
      Location(
        lat: userPosition.latitude,
        lng: userPosition.longitude,
      ),
      500, // radius
      type: category.searchType,
      keyword: category.searchText,
      rankby: RankBy.Distance,
      opennow: true,
    );

    return response;
  } catch (e) {
    futureHelper.throwError(e.toString());
    return null;
  }
}
