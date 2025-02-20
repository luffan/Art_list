import 'package:art_list/core/utils/error/failure.dart';

extension FailureExtension on Failure {
  String get title {
    switch (runtimeType) {
      case ServerFailure _:
        return 'Server Failure';
      case CacheFailure _:
        return 'Cache Failure';
      case NullFailure _:
        return 'Null Failure';
      default:
        return 'Unexpected failure';
    }
  }

  String get message {
    switch (runtimeType) {
      case ServerFailure f:
        return f.message;
      case CacheFailure f:
        return f.message;
      case NullFailure _:
        return 'Null Failure message';
      default:
        return 'Unexpected failure message';
    }
  }
}
