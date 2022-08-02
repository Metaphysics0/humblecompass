import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humblecompass/src/features/category_picker/presentation/picker.dart';
import 'package:humblecompass/src/features/target_location/presentation/compass/view.dart';
import 'package:humblecompass/src/features/target_location/presentation/target_location_text/view.dart';
import 'package:humblecompass/src/features/user_location/application/ensure_user_has_location_enabled.dart';
import 'package:humblecompass/src/features/user_location/application/user_location_provider.dart';
import 'package:humblecompass/src/features/user_location/data/user_location.dart';

Future main() async {
  await dotenv.load();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(home: HomePageState());
}

class HomePageState extends ConsumerStatefulWidget {
  const HomePageState({Key? key}) : super(key: key);
  @override
  HomePage createState() => HomePage();
}

class HomePage extends ConsumerState<HomePageState> {
  UserLocation userLocation = UserLocation();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final hasLocationEnabled = await ensureUserHasLocationEnabled();

      if (hasLocationEnabled) {
        final Position? currentPosition = await getCurrentPosition();

        if (currentPosition is Position) {
          ref
              .read(lastKnownPositionProvider.notifier)
              .setPosition(currentPosition);
        }
      }
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
              children: const [
                Compass(),
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
