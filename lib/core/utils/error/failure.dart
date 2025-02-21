/// Failures generated in the application
///
/// [ServerFailure] an failure that occurs when executing
/// requests to the Api
///
/// [CacheFailure] an failure that occurs when executing queries
/// to a local database
///
/// [NullFailure] an failure that occurs when accessing a value
/// that is null
sealed class Failure {
  final List<dynamic> properties;

  const Failure([this.properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super([message]);
}

class CacheFailure extends Failure {
  CacheFailure({required String message}) : super([message]);
}

class NullFailure extends Failure {}
