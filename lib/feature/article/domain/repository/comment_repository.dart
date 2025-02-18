import 'package:art_list/core/error/failure.dart';
import 'package:art_list/feature/article/domain/entity/comment.dart';
import 'package:dartz/dartz.dart';

abstract class CommentRepository {
  Future<Either<Failure, ListComment>> getComments(int postId);
}