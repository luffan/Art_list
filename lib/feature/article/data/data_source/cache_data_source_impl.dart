import 'package:art_list/core/utils/mixin/cache_mixin.dart';
import 'package:art_list/feature/article/data/data_source/interface/cache_data_source.dart';
import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_details_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String _postKey = 'post';
const String _commentsKey = 'comments';

class CacheDataSourceImpl with CacheMixin implements CacheDataSource {
  static late Box<ListPostModel> _postsBox;
  static late Box<PostDetailsModel> _postDetailsBox;
  static late Box<ListCommentModel> _commentsBox;

  static Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PostModelImplAdapter());
    Hive.registerAdapter(ListPostModelImplAdapter());
    Hive.registerAdapter(PostDetailsModelImplAdapter());
    Hive.registerAdapter(ListPostDetailsModelImplAdapter());
    Hive.registerAdapter(CommentModelImplAdapter());
    Hive.registerAdapter(ListCommentModelImplAdapter());

    /// Creating boxes
    _postsBox = await Hive.openBox<ListPostModel>('posts');
    _postDetailsBox = await Hive.openBox<PostDetailsModel>('postDetails');
    _commentsBox = await Hive.openBox<ListCommentModel>('comments');
  }

  const CacheDataSourceImpl();

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
