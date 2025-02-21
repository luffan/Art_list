import 'package:art_list/core/utils/error/failure.dart';

extension FailureExtension on Failure {
  String get title {
    return switch (this) {
      ServerFailure() => 'Server Failure',
      CacheFailure() => 'Cache Failure',
      NullFailure() => 'Null Failure',
      Type() => 'Unexpected Failure',
    };
  }

  String get message {
    return switch (this) {
      ServerFailure failure => failure.properties.first,
      CacheFailure failure => failure.properties.first,
      NullFailure() => 'Null Failure',
      Type() => 'Unexpected Failure',
    };
  }
}
