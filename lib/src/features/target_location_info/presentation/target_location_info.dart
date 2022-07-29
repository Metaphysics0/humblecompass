import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TargetLocationInfo extends StatefulWidget {
  const TargetLocationInfo({Key? key}) : super(key: key);

  @override
  State<TargetLocationInfo> createState() => _TargetLocationInfoState();
}

class _TargetLocationInfoState extends State<TargetLocationInfo> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '5km from Cafe Buke',
    );
  }
}
