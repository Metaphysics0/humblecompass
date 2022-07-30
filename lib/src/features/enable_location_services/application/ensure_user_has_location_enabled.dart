import 'package:humblecompass/src/features/enable_location_services/application/get_user_location.dart';

ensureUserHasLocationEnabled() async =>
    await userLocation.ensureLocationIsEnabled();
