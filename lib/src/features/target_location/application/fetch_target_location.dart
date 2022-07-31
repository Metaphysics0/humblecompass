import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/category_picker/domain/category.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/features/target_location/domain/google_api_service.dart';

Future<TargetLocation?> fetchTargetLocation(
  Position userPosition,
  Category targetCategory,
) async {
  final targetLocationResponse = await googleApiService.fetchTargetLocation(
    userPosition,
    targetCategory,
  );

  return targetLocationResponse;
}
