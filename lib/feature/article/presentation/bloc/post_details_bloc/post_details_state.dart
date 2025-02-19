part of 'post_details_bloc.dart';

sealed class PostDetailsState extends Equatable {
  const PostDetailsState();
}

final class Empty extends PostDetailsState {
  @override
  List<Object> get props => [];
}

final class Loading extends PostDetailsState {
  @override
  List<Object> get props => [];
}

final class Loaded extends PostDetailsState {
  final PostDetails details;

  const Loaded({required this.details});

  @override
  List<Object> get props => [details];
}

class Error extends PostDetailsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
