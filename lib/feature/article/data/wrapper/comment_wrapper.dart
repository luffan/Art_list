import 'package:art_list/core/entity/converter.dart';
import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/domain/entity/comment.dart';

class CommentWrapper implements Converter<Comment, CommentModel> {
  const CommentWrapper();

  @override
  Comment convertToEntity(CommentModel model) {
    return Comment(
      id: model.id,
      postId: model.postId,
      body: model.body,
      name: model.name,
      email: model.email,
    );
  }
}

class ListCommentWrapper implements Converter<ListComment, ListCommentModel> {
  const ListCommentWrapper();

  @override
  ListComment convertToEntity(ListCommentModel model) {
    return ListComment(
      comments: model.comments
          .map(
            (comment) =>
            Comment(
              id: comment.id,
              postId: comment.postId,
              body: comment.body,
              name: comment.name,
              email: comment.email,
            ),
      )
          .toList(),
    );
  }
}
