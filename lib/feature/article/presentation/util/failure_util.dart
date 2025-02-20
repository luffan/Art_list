import 'package:art_list/core/utils/error/failure.dart';

extension FailureExtension on Failure {
  String get title {
    switch (runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      case NullFailure:
        return 'Null Failure';
      default:
        return 'Unexpected failure';
    }
  }

  String get message {
    switch (runtimeType) {
      case ServerFailure f:
        return f.message;
      case CacheFailure:
        return 'Cache Failure';
      case NullFailure:
        return 'Null Failure';
      default:
        return 'Unexpected failure';
    }
  }
}
