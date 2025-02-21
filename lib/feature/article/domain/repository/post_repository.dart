import 'package:art_list/core/utils/error/failure.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/entity/post_details.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  /// Returns [ListPost] received from the Api or from the cache
  ///
  /// Returns [ServerFailure] when a request fails in the Api
  ///
  /// Returns [CacheFailure] there is no data in the cache
  ///
  /// Returns [NullFailure] when null is accessed in the local source
  Future<Either<Failure, ListPost>> getPosts();

  /// Returns [PostDetails] received from the Api or from the cache
  ///
  /// Returns [ServerFailure] when a request fails in the Api
  ///
  /// Returns [CacheFailure] there is no data in the cache
  ///
  /// Returns [NullFailure] when null is accessed in the local source
  Future<Either<Failure, PostDetails>> getDetails(int postId);
}
