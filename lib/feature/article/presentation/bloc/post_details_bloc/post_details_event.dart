part of 'post_details_bloc.dart';

sealed class PostDetailsEvent extends Equatable {
  const PostDetailsEvent();
}

final class GetDetailsPost extends PostDetailsEvent {
  final int id;

  const GetDetailsPost(this.id);

  @override
  List<Object> get props => [id];
}
