import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/user_location/data/user_location.dart';

UserLocation userLocation = UserLocation();

Future<Position?> getCurrentPosition() async =>
    await userLocation.getCurrentPosition();

Stream<Position> getPositionStream() => userLocation.getPositionStream();

final userPositionStreamProvider = StreamProvider<Position>((ref) async* {
  final stream = getPositionStream();

  await for (final position in stream) {
    yield position;
  }
});

listenToPosition() => userLocation.listenToPosition();

final lastKnownPositionProvider =
    StateNotifierProvider<LastKnownPositionNotifier, Position?>((ref) {
  return LastKnownPositionNotifier(ref);
});

class LastKnownPositionNotifier extends StateNotifier<Position?> {
  LastKnownPositionNotifier(this.ref) : super(null);
  Ref ref;

  setPosition(Position? pos) {
    state = pos;
  }
}
