import 'package:art_list/core/utils/error/exception.dart';
import 'package:art_list/feature/article/data/client/rest_client.dart';
import 'package:art_list/feature/article/data/data_source/interface/remote_data_source.dart';
import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_details_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final RestClient _restClient;

  const RemoteDataSourceImpl(this._restClient);

  @override
  Future<ListCommentModel> getComments(int postId) async {
    try {
      final comments = await _restClient.getComments(postId);
      return comments;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<PostDetailsModel> getPostDetails(int postId) async {
    try {
      final details = await _restClient.getPostDetails(postId);
      return details;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ListPostModel> getPosts() async {
    try {
      final posts = await _restClient.getPosts();
      return posts;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
