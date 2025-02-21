import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_details_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

/// Client that describes requests in Api
///
/// [getPosts] a request that returns a list of posts
///
/// [getPostDetails] a request that returns post details
/// based on the passed post id
///
/// [getComments] a request that returns post comments
/// based on the passed post id
///
@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/posts')
  Future<ListPostModel> getPosts();

  @GET('/posts/{id}')
  Future<PostDetailsModel> getPostDetails(@Path('id') int id);

  @GET('/posts/{id}/comments')
  Future<ListCommentModel> getComments(@Path('id') int id);
}