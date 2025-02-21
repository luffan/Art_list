import 'package:art_list/core/utils/error/failure.dart';
import 'package:art_list/feature/article/domain/entity/comment.dart';
import 'package:dartz/dartz.dart';


abstract class CommentRepository {
  /// Returns [ListComment] received from the Api or from the cache
  ///
  /// Returns [ServerFailure] when a request fails in the Api
  ///
  /// Returns [CacheFailure] there is no data in the cache
  ///
  /// Returns [NullFailure] when null is accessed in the local source
  Future<Either<Failure, ListComment>> getComments(int postId);
}
