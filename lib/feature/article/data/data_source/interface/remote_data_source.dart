import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';

abstract class RemoteDataSource {
  Future<ListPostModel> getPosts();

  Future<ListCommentModel> getComments(int postId);
}