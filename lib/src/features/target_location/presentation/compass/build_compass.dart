import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

import 'package:humblecompass/src/features/target_location/application/target_location_provider.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';

Widget buildCompass(WidgetRef ref) {
  return StreamBuilder<CompassEvent>(
    stream: FlutterCompass.events,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Error reading heading: ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      double? direction = snapshot.data!.heading;

      if (direction == null) {
        return const Center(
          child: Text("Device does not have sensors !"),
        );
      }

      AsyncValue<List<TargetLocation?>?> targetLocations =
          ref.watch(futureTargetLocationsProvider);

      return targetLocations.when(
        loading: () => _defaultCompass(direction),
        error: ((error, stackTrace) => _defaultCompass(direction)),
        data: (targetLocations) => _compassWithTargetLocation(
          targetLocations,
          direction,
        ),
      );
    },
  );
}

_compassWithTargetLocation(
  List<TargetLocation?>? targetLocations,
  double? direction,
) {
  if (targetLocations!.isEmpty) {
    return _defaultCompass(direction);
  }
  TargetLocation? target = targetLocations.first;
  double? bearing = target?.bearing;

  return _defaultCompass(direction, bearing: bearing ?? 0.0);
}

SizedBox _defaultCompass(direction, {double bearing = 0.0}) => SizedBox(
      height: 400,
      child: Transform.rotate(
        angle: _calculateBearing(direction, bearing: bearing),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Image.asset('assets/carrot.png'),
            ),
          ],
        ),
      ),
    );

double _calculateBearing(double direction, {double bearing = 0.0}) {
  double defaultBearing = (direction * (math.pi / 180) * -1);
  if (bearing == 0.0) defaultBearing;

  return defaultBearing - bearing * (math.pi / 180) * -1;
}
