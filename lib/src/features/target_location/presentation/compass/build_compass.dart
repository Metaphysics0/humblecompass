import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/features/target_location/application/bearing_provider.dart';
import 'dart:math' as math;

import 'package:humblecompass/src/features/target_location/application/target_location_provider.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/utils/distance_helper.dart';
import 'package:sensors_plus/sensors_plus.dart';

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

      late final double bearing;
      late final double orientation;

      gyroscopeEvents.listen((GyroscopeEvent event) {
        // print('gyroscope event: $event.x');
        // if (orientation != event.x) {
        //   orientation = event.x;
        // }
      });

      targetLocations.when(
        data: (data) {
          // bearing = ref.watch(bearingProvider);
        },
        error: ((error, stackTrace) => print("Error: $error")),
        loading: () => print("LOADING"),
      );

      return Container(
        height: 400,
        child: Transform.rotate(
          angle: (direction * (math.pi / 180) * -1),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Image.asset('assets/carrot.png'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
