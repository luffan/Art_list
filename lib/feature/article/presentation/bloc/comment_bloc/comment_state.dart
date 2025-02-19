part of 'comment_bloc.dart';

sealed class CommentState extends Equatable {
  const CommentState();
}

final class Empty extends CommentState {
  @override
  List<Object> get props => [];
}

final class Loading extends CommentState {
  @override
  List<Object> get props => [];
}

final class Loaded extends CommentState {
  final List<Comment> comments;

  const Loaded({required this.comments});

  @override
  List<Object> get props => [comments];
}

class Error extends CommentState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
