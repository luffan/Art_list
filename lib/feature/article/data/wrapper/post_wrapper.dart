import 'package:art_list/core/data/entity/converter.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';

/// A class that transforms data-level [PostModel] model into [Post] domain-level entity
///
class PostWrapper implements Converter<Post, PostModel> {
  const PostWrapper();

  @override
  Post convertToEntity(PostModel model) {
    return Post(
      id: model.id,
      title: model.title,
      body: model.body,
    );
  }
}

class ListPostWrapper implements Converter<ListPost, ListPostModel> {
  const ListPostWrapper();

  @override
  ListPost convertToEntity(ListPostModel model) {
    return ListPost(
      posts: model.posts
          .map(
            (post) => Post(
              id: post.id,
              title: post.title,
              body: post.body,
            ),
          )
          .toList(),
    );
  }
}
