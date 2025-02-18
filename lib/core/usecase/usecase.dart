import 'package:art_list/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}

class IdParams {
  final int id;

  const IdParams({required this.id});
}
