import 'package:art_list/core/error/failure.dart';
import 'package:art_list/core/usecase/usecase.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetPostDetails implements UseCase<Post, IdParams> {
  final PostRepository _postRepository;

  const GetPostDetails(this._postRepository);

  @override
  Future<Either<Failure, Post>> call(IdParams params) async {
    return await _postRepository.getDetails(params.id);
  }
}
