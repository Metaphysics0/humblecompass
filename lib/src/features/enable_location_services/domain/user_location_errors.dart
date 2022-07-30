class UserLocationErrors {
  final deniedPermissions = _logError('Location permissions are denied');
  final disabledPermissions = _logError('Location services are disabled.');
  final permanatelyDeniedPermissions = _logError(
      'Location permissions are permanently denied, we cannot request permissions.');
}

Future<Error?> _logError(String text) => Future.error(text);
