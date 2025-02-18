import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';

abstract class RemoteDataSource {
  Future<ListPostModel> getPost();

  Future<PostModel> getPostDetails(int postId);

  Future<CommentModel> getComments(int postId);
}