import 'package:humblecompass/src/features/user_location/application/user_location_provider.dart';

ensureUserHasLocationEnabled() async =>
    await userLocation.ensureLocationIsEnabled();
