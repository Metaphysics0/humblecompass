class FutureHelper {
  Future<Error> throwError(String text) => Future.error(text);
}

final FutureHelper futureHelper = FutureHelper();
