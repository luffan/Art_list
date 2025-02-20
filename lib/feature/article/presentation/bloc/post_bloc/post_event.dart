part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

final class GetListPost extends PostEvent {
  const GetListPost();

  @override
  List<Object> get props => [];
}
