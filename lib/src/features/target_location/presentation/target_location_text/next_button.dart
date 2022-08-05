import 'package:flutter/material.dart';
import 'package:humblecompass/src/features/target_location/domain/target_location.dart';
import 'package:humblecompass/src/styles/text_styles.dart';

Widget nextButton(List<TargetLocation?>? targetLocations) {
  final button = SizedBox(
    width: 25.0,
    child: RawMaterialButton(
      onPressed: () {
        print("I WAS PRESSED");
      },
      elevation: 2.0,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.skip_next_rounded,
        size: 30.0,
        color: Color.fromARGB(218, 165, 165, 165),
      ),
    ),
  );

  final remainingLocations = Text(
    "(${targetLocations!.length})",
    style: TextStyles().skip,
  );

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [button, remainingLocations],
  );
}
