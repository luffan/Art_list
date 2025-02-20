import 'package:art_list/core/data/network/interface/network_info.dart';
import 'package:art_list/core/utils/error/exception.dart';
import 'package:art_list/core/utils/error/failure.dart';
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
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  } else {
    try {
      return noConnection.call();
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on NullException catch (_) {
      return Left(NullFailure());
    }
  }
}
