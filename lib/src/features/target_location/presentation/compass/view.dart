import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/features/target_location/presentation/compass/build_compass.dart';

class Compass extends ConsumerWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return buildCompass();
  }
}
