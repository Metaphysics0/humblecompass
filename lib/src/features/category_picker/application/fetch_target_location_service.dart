import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/application/fetch_target_location.dart';
import 'package:humblecompass/src/features/user_location/application/user_location_provider.dart';

fetchTargetLocation(Category selectedCategory) async {
  final Position? userPosition = await getCurrentPosition();
  return await fetchNearbyPlaces(userPosition!, selectedCategory);
}
