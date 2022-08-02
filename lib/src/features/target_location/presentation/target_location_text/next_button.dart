import 'package:flutter/material.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';

Widget nextButton(List<TargetLocation?>? targetLocations) {
  return RawMaterialButton(
    onPressed: () {
      print("I WAS PRESSED");
    },
    elevation: 2.0,
    // fillColor: Color.fromARGB(255, 238, 238, 238),
    shape: const CircleBorder(),
    child: const Icon(
      Icons.next_plan_outlined,
      size: 30.0,
      color: Color.fromARGB(255, 165, 165, 165),
    ),
  );
}
