import 'package:art_list/core/domain/usecase/usecase.dart';
import 'package:art_list/core/utils/error/failure.dart';
import 'package:art_list/feature/article/domain/entity/comment.dart';
import 'package:art_list/feature/article/domain/repository/comment_repository.dart';
import 'package:dartz/dartz.dart';

class GetComments implements UseCase<ListComment, IdParams> {
  final CommentRepository _commentRepository;

  const GetComments(this._commentRepository);

  @override
  Future<Either<Failure, ListComment>> call(IdParams params) async {
    return await _commentRepository.getComments(params.id);
  }
}
