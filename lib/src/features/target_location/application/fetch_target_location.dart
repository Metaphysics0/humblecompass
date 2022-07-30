import 'package:google_place/google_place.dart';
import 'package:humblecompass/src/features/target_location/data/google_api.dart';

Future fetchTargetLocation(String type, String keyword) async {
  try {
    final NearBySearchResponse? response =
        await googlePlace.search.getNearBySearch(
      Location(lat: -33.8670522, lng: 151.1957362),
      1500,
      type: type,
      keyword: keyword,
    );

    return response?.results;
  } catch (e) {
    print(e);
  }
}
