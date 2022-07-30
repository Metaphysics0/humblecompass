import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/enable_location_services/data/user_location.dart';

UserLocation userLocation = UserLocation();

getPosition() async => await userLocation.getLastKnownPosition();

final userPositionProvider =
    StateNotifierProvider<UserPosition, Position?>((ref) {
  return UserPosition();
});

class UserPosition extends StateNotifier<Position?> {
  UserPosition() : super(null);

  setPosition(Position position) {
    print("Current user position: $position");
    state = position;
  }
}
