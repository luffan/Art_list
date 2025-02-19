import 'package:art_list/core/data/entity/converter.dart';
import 'package:art_list/feature/article/data/model/post_details_model.dart';
import 'package:art_list/feature/article/domain/entity/post_details.dart';

class PostDetailsWrapper implements Converter<PostDetails, PostDetailsModel> {
  const PostDetailsWrapper();

  @override
  PostDetails convertToEntity(PostDetailsModel model) {
    return PostDetails(
      id: model.id,
      title: model.title,
      body: model.body,
    );
  }
}

class ListPostDetailsWrapper
    implements Converter<ListPostDetails, ListPostDetailsModel> {
  const ListPostDetailsWrapper();

  @override
  ListPostDetails convertToEntity(ListPostDetailsModel model) {
    return ListPostDetails(
      details: model.details
          .map(
            (post) => PostDetails(
              id: post.id,
              title: post.title,
              body: post.body,
            ),
          )
          .toList(),
    );
  }
}
