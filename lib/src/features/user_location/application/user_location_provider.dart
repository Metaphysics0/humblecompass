import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/user_location/data/user_location.dart';
import 'package:humblecompass/src/utils/future_helper.dart';

UserLocation userLocation = UserLocation();

Future<Position?> getCurrentPosition() async =>
    await userLocation.getCurrentPosition();

Stream<Position> getPositionStream() => userLocation.getPositionStream();

final userPositionProvider = StreamProvider<String?>((ref) async* {
  final stream = getPositionStream();
  await for (final position in stream) {
    yield position.toString();
  }
});

listenToPosition() => userLocation.listenToPosition();
