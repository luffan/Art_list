import 'package:art_list/core/domain/usecase/usecase.dart';
import 'package:art_list/feature/article/domain/entity/post_details.dart';
import 'package:art_list/feature/article/domain/usecase/get_post_details.dart';
import 'package:art_list/feature/article/presentation/util/failure_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_details_event.dart';

part 'post_details_state.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  final GetPostDetails _getPostDetails;

  PostDetailsBloc({
    required GetPostDetails details,
  })  : _getPostDetails = details,
        super(Empty()) {
    on<GetDetailsPost>((event, emit) async {
      emit(Loading());
      final detailsEither = await _getPostDetails(IdParams(id: event.id));

      detailsEither.fold(
        (failure) {
          emit(Error(message: failure.toMessage()));
        },
        (details) async {
          emit(Loaded(details: details));
        },
      );
    });
  }
}
