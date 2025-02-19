import 'package:art_list/core/domain/usecase/usecase.dart';
import 'package:art_list/core/utils/error/failure.dart';
import 'package:art_list/feature/article/domain/entity/post_details.dart';
import 'package:art_list/feature/article/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetPostDetails implements UseCase<PostDetails, IdParams> {
  final PostRepository _postRepository;

  const GetPostDetails(this._postRepository);

  @override
  Future<Either<Failure, PostDetails>> call(IdParams params) async {
    return await _postRepository.getDetails(params.id);
  }
}
