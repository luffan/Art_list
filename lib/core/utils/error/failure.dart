/// Failures generated in the application
abstract class Failure {
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
