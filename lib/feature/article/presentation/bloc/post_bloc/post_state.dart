part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();
}

final class Empty extends PostState {
  @override
  List<Object> get props => [];
}

final class Loading extends PostState {
  @override
  List<Object> get props => [];
}

final class Loaded extends PostState {
  final List<Post> posts;

  const Loaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

class Error extends PostState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
