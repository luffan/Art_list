import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';

abstract class CacheDataSource {
  Future<ListPostModel> getPosts();

  Future<bool> savePosts(ListPostModel posts);

  Future<ListCommentModel> getComments();

  Future<bool> saveComments(ListCommentModel comments);
}