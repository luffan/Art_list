import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_details_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';

/// Class describing behavior with an Api
///
/// [getPosts] method returning posts received from Api
///
/// [getComments] method returning comments received from Api based on post id
///
/// [getPostDetails] method returning post details received from Api based on post id
///
abstract class RemoteDataSource {
  Future<ListPostModel> getPosts();

  Future<ListCommentModel> getComments(int postId);

  Future<PostDetailsModel> getPostDetails(int postId);
}