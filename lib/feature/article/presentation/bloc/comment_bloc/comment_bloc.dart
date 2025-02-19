import 'package:art_list/core/domain/usecase/usecase.dart';
import 'package:art_list/feature/article/domain/entity/comment.dart';
import 'package:art_list/feature/article/domain/usecase/get_comments.dart';
import 'package:art_list/feature/article/presentation/util/failure_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comment_event.dart';

part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetComments _getComments;

  CommentBloc({
    required GetComments comments,
  })  : _getComments = comments,
        super(Empty()) {
    on<GetCommentPost>((event, emit) async {
      emit(Loading());
      final commentEither = await _getComments(IdParams(id: event.postId));

      commentEither.fold(
        (failure) {
          emit(Error(message: failure.toMessage()));
        },
        (comments) async {
          emit(Loaded(comments: comments.asList));
        },
      );
    });
  }
}
