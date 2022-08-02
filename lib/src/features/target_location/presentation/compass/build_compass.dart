import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

Widget buildCompass() {
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

      return Material(
        child: Container(
          width: 100,
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: (direction * (math.pi / 180) * -1),
            child: Image.asset('assets/carrot.png'),
          ),
        ),
      );
    },
  );
}
