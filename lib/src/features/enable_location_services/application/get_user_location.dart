import 'package:humblecompass/src/features/enable_location_services/data/user_location.dart';

UserLocation userLocation = UserLocation();

getPosition() async => await userLocation.determinePosition();

ensureUserHasLocationEnabled() async =>
    await userLocation.ensureLocationIsEnabled();
