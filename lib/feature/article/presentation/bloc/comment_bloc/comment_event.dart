part of 'comment_bloc.dart';

sealed class CommentEvent extends Equatable {
  const CommentEvent();
}

final class GetCommentPost extends CommentEvent {
  final int postId;

  const GetCommentPost(this.postId);

  @override
  List<Object> get props => [postId];
}
