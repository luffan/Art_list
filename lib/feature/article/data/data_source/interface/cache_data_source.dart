import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_details_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';

/// Class describing behavior with a local database
///
/// [getPosts] method returning cached posts
///
/// [savePosts] method that caches posts
///
/// [hasCachedPosts] a method that will check whether cached posts exist
///
/// [getComments] method returning cached comments based on the passed post id
///
/// [saveComments] method that caches comments based on the passed post id
///
/// [hasCachedComments] a method that will check whether cached comments exist based on the passed post id
///
/// [getPostDetails] method returning cached post details based on the passed post id
///
/// [savePostDetails] method that caches post details based on the passed post id
///
/// [hasCachedDetails] a method that will check whether cached post details exist based on the passed post id
///
abstract class CacheDataSource {
  Future<ListPostModel> getPosts();

  Future<bool> savePosts(ListPostModel posts);

  Future<ListCommentModel> getComments(int postId);

  Future<bool> saveComments(ListCommentModel comments);

  Future<PostDetailsModel> getPostDetails(int postId);

  Future<bool> savePostDetails(PostDetailsModel details);

  Future<bool> hasCachedPosts();

  Future<bool> hasCachedComments(int postId);

  Future<bool> hasCachedDetails(int postId);
}
