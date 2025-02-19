import 'package:art_list/core/error/exception.dart';
import 'package:art_list/core/error/failure.dart';
import 'package:art_list/core/network/interface/network_info.dart';
import 'package:dartz/dartz.dart';

typedef NetworkConnection<T> = Future<Either<Failure, T>> Function();

Future<Either<Failure, T>> getData<T>({
  required NetworkConnection<T> hasConnection,
  required NetworkConnection<T> noConnection,
  required NetworkInfo networkInfo,
}) async {
  final hasInternetConnection = await networkInfo.isConnected;
  if (hasInternetConnection) {
    try {
      return hasConnection.call();
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  } else {
    try {
      return noConnection.call();
    } on CacheException {
      return Left(CacheFailure());
    } on NullException {
      return Left(NullFailure());
    }
  }
}
