import 'package:art_list/core/error/failure.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/entity/post_details.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, ListPost>> getPosts();

  Future<Either<Failure, PostDetails>> getDetails(int postId);
}