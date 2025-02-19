import 'package:art_list/core/mixin/cache_mixin.dart';
import 'package:art_list/feature/article/data/data_source/interface/cache_data_source.dart';
import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_details_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';
import 'package:hive/hive.dart';

const String _postKey = 'post';
const String _commentsKey = 'comments';

class CacheDataSourceImpl with CacheMixin implements CacheDataSource {
  final Box<ListPostModel> _postsBox;
  final Box<PostDetailsModel> _postDetailsBox;
  final Box<ListCommentModel> _commentsBox;

  const CacheDataSourceImpl(
    this._postsBox,
    this._postDetailsBox,
    this._commentsBox,
  );

  @override
  Future<ListCommentModel> getComments(int postId) async {
    return getData<ListCommentModel, ListCommentModel?>(
      () => _commentsBox.get('$_commentsKey$postId'),
    );
  }

  @override
  Future<PostDetailsModel> getPostDetails(int id) {
    return getData<PostDetailsModel, PostDetailsModel?>(
      () => _postDetailsBox.get(id),
    );
  }

  @override
  Future<ListPostModel> getPosts() {
    return getData<ListPostModel, ListPostModel?>(
      () => _postsBox.get(_postKey),
    );
  }

  @override
  Future<bool> hasCachedComments(int postId) {
    return hasData<ListCommentModel?>(
      () => _commentsBox.get('$_commentsKey$postId'),
    );
  }

  @override
  Future<bool> hasCachedDetails(int id) async {
    return hasData<PostDetailsModel?>(
      () => _postDetailsBox.get(id),
    );
  }

  @override
  Future<bool> hasCachedPosts() async {
    return hasData<ListPostModel?>(
      () => _postsBox.get(_postKey),
    );
  }

  @override
  Future<bool> saveComments(ListCommentModel com) async {
    return saveData(
      () => _commentsBox.put(
        '$_commentsKey${com.comments.first.id}',
        com,
      ),
    );
  }

  @override
  Future<bool> savePostDetails(PostDetailsModel details) async {
    return saveData(
      () => _postDetailsBox.put(details.id, details),
    );
  }

  @override
  Future<bool> savePosts(ListPostModel posts) async {
    return saveData(
      () => _postsBox.put(_postKey, posts),
    );
  }
}
