import 'package:art_list/feature/article/domain/usecase/get_comments.dart';
import 'package:art_list/feature/article/domain/usecase/get_post_details.dart';
import 'package:art_list/feature/article/domain/usecase/get_posts.dart';
import 'package:art_list/feature/article/presentation/bloc/comment_bloc/comment_bloc.dart';
import 'package:art_list/feature/article/presentation/bloc/post_bloc/post_bloc.dart';
import 'package:art_list/feature/article/presentation/bloc/post_details_bloc/post_details_bloc.dart';
import 'package:cherrypick/cherrypick.dart';

class BlocModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<PostBloc>().toProvide(
      () => PostBloc(
        posts: currentScope.resolve<GetPosts>(),
      ),
    );

    bind<PostDetailsBloc>().toProvide(
      () => PostDetailsBloc(
        details: currentScope.resolve<GetPostDetails>(),
      ),
    );

    bind<CommentBloc>().toProvide(
      () => CommentBloc(
        comments: currentScope.resolve<GetComments>(),
      ),
    );
  }
}
