import 'package:flutter_dotenv/flutter_dotenv.dart';

mixin IAppEnv {
  late String googlePlacesApiKey;
}

class AppEnv implements IAppEnv {
  @override
  final String googlePlacesApiKey = dotenv.get('GOOGLE_PLACES_API_KEY');

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

final appEnv = AppEnv();
