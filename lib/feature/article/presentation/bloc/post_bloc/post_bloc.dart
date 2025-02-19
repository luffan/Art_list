import 'package:art_list/core/usecase/usecase.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/usecase/get_posts.dart';
import 'package:art_list/feature/article/presentation/util/failure_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import "package:meta/meta.dart";

part 'post_event.dart';

part 'post_state.dart';

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
          emit(Error(message: failure.toMessage()));
        },
        (posts) async {
          emit(Loaded(posts: posts.asList));
        },
      );
    });
  }
}
