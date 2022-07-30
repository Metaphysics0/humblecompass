import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/enable_location_services/domain/user_location_errors.dart';

class UserLocation {
  Future<Object?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    UserLocationErrors userLocationErrors = UserLocationErrors();

    serviceEnabled = await _isLocationEnabled();

    if (!serviceEnabled) return userLocationErrors.disabledPermissions;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return userLocationErrors.deniedPermissions;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return userLocationErrors.permanatelyDeniedPermissions;
    }

    return await Geolocator.getLastKnownPosition();
  }

  Future<bool> _isLocationEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }
}
