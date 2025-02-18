import 'package:art_list/core/error/failures.dart';
import 'package:art_list/core/usecase/usecase.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetPosts implements UseCase<ListPost, NoParams> {
  final PostRepository _postRepository;

  const GetPosts(this._postRepository);

  @override
  Future<Either<Failure, ListPost>> call(NoParams params) async {
    return await _postRepository.getPosts();
  }
}
