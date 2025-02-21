import 'package:art_list/core/domain/usecase/usecase.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/usecase/get_posts.dart';
import 'package:art_list/feature/article/presentation/util/failure_util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';

part 'post_state.dart';

/// Class of the [Bloc] type that implements the logic
/// for obtaining [ListPost] from [GetPosts] use case
///
class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;

  PostBloc({
    required GetPosts posts,
  })  : getPosts = posts,
        super(Empty()) {
    on<GetListPost>((event, emit) async {
      emit(Loading());
      final postEither = await getPosts(NoParams());

      postEither.fold(
        (failure) {
          emit(Error(title: failure.title, message: failure.message));
        },
        (posts) {
          emit(Loaded(posts: posts.asList));
        },
      );
    });
  }
}
