import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/enable_location_services/domain/user_location_errors.dart';
import 'package:humblecompass/src/utils/future_helper.dart';

class UserLocation {
  UserLocationErrors errors = UserLocationErrors();
  FutureHelper futureHelper = FutureHelper();

  Future<Position?> determinePosition() async {
    return await Geolocator.getLastKnownPosition();
  }

  Future<Future<Error?>?> ensureLocationIsEnabled() async {
    await _checkIfLocationIsEnabled();
    await _askForLocationPermissionsIfNeeded();

    return null;
  }

  // ignore: body_might_complete_normally_nullable
  Future<bool?> _checkIfLocationIsEnabled() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) {
      futureHelper.throwError(errors.disabledPermissions);
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<bool?> _askForLocationPermissionsIfNeeded() async {
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        futureHelper.throwError(errors.deniedPermissions);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      futureHelper.throwError(errors.permanatelyDeniedPermissions);
    }
  }
}
