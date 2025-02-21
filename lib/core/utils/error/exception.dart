/// Errors generated in the application
///
/// [ServerException] an error that occurs when executing
/// requests to the Api
///
/// [CacheException] an error that occurs when executing queries
/// to a local database
///
/// [NullException] an error that occurs when accessing a value
/// that is null
///
class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class NullException implements Exception {}