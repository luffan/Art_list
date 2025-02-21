import 'package:art_list/core/domain/usecase/usecase.dart';
import 'package:art_list/core/utils/error/failure.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';

/// A class that accesses the [PostRepository] and returns [ListPost] or a [Failure]
///
/// There can be three types of failure [ServerFailure], [CacheFailure], [NullFailure]
///
class GetPosts implements UseCase<ListPost, NoParams> {
  final PostRepository _postRepository;

  const GetPosts(this._postRepository);

  @override
  Future<Either<Failure, ListPost>> call(NoParams params) async {
    return await _postRepository.getPosts();
  }
}
