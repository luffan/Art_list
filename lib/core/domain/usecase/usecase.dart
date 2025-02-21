import 'package:art_list/core/utils/error/failure.dart';
import 'package:dartz/dartz.dart';

/// Base class for Use Cases in app
/// [Type] is name of Use case
///
/// [Params] is parameters passed to the method
///
/// [call] is method that implements the task of Use case
///
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}

class IdParams {
  final int id;

  const IdParams({required this.id});
}
