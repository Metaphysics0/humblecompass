import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:humblecompass/src/features/category_picker/presentation/picker.dart';
import 'package:humblecompass/src/features/category_picker/presentation/picker_label.dart';
import 'package:humblecompass/src/features/enable_location_services/application/get_user_location.dart';
import 'package:humblecompass/src/features/enable_location_services/data/user_location.dart';
import 'package:humblecompass/src/features/target_location/presentation/target_location_text.dart';
import 'package:location/location.dart';

Future main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserLocation userLocation = UserLocation();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ensureUserHasLocationEnabled();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TargetLocationText(),
                Picker(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
