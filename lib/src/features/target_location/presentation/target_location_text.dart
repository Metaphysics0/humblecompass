import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:humblecompass/src/features/target_location/application/fetch_target_location.dart';
import 'package:humblecompass/src/features/target_location/application/fetch_target_location.dart';
import 'package:humblecompass/src/features/target_location/data/google_api.dart';

class TargetLocationText extends StatefulWidget {
  const TargetLocationText({Key? key}) : super(key: key);

  @override
  State<TargetLocationText> createState() => _TargetLocationTextState();
}

class _TargetLocationTextState extends State<TargetLocationText> {
  @override
  Widget build(BuildContext context) {
    Future onPressed() async {
      var location = await fetchTargetLocation("restaurant", "restaurant");

      print("LOCATION $location");
    }

    ;

    return Text("Searching for nearby...");
  }
}
