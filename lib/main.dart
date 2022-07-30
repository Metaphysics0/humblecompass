import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:humblecompass/src/features/category_picker/application/handle_selected_category.dart';
import 'package:humblecompass/src/features/category_picker/presentation/picker.dart';
import 'package:humblecompass/src/features/enable_location_services/application/get_user_location.dart';
import 'package:humblecompass/src/features/enable_location_services/data/user_location.dart';
import 'package:humblecompass/src/features/target_location/presentation/target_location_text.dart';

Future main() async {
  await dotenv.load();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePageState());
  }
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
