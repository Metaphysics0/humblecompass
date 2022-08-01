import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/user_location/domain/user_location_errors.dart';
import 'package:humblecompass/src/utils/future_helper.dart';

class UserLocation {
  UserLocationErrors errors = UserLocationErrors();

  Future<Position?> getLastKnownPosition() async {
    try {
      return await Geolocator.getLastKnownPosition();
    } catch (e) {
      futureHelper.throwError(e.toString());
      return null;
    }
  }

  Future<Position?> getCurrentPosition() async {
    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      futureHelper.throwError(e.toString());
      return null;
    }
  }

  Stream<Position> getPositionStream() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  Position? listenToPosition() {
    getPositionStream().listen((Position? pos) => print("position: $pos"));
  }

  void printPositionText(Position? position) {
    print(position == null
        ? 'Unknown'
        : '${position.latitude.toString()}, ${position.longitude.toString()}');
  }

  Future<bool> ensureLocationIsEnabled() async {
    await _checkIfLocationIsEnabled();
    await _askForLocationPermissionsIfNeeded();

    return true;
  }
}

// ignore: body_might_complete_normally_nullable
Future<bool?> _checkIfLocationIsEnabled() async {
  final isEnabled = await Geolocator.isLocationServiceEnabled();
  if (!isEnabled) {
    futureHelper.throwError(userLocationErrors.disabled);
  }
}

// ignore: body_might_complete_normally_nullable
Future<bool?> _askForLocationPermissionsIfNeeded() async {
  var permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      futureHelper.throwError(userLocationErrors.denied);
    }
  }

  if (permission == LocationPermission.deniedForever) {
    futureHelper.throwError(userLocationErrors.permanatelyDenied);
  }
}
