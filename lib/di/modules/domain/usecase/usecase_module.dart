import 'package:art_list/feature/article/domain/repository/comment_repository.dart';
import 'package:art_list/feature/article/domain/repository/post_repository.dart';
import 'package:art_list/feature/article/domain/usecase/get_comments.dart';
import 'package:art_list/feature/article/domain/usecase/get_post_details.dart';
import 'package:art_list/feature/article/domain/usecase/get_posts.dart';
import 'package:cherrypick/cherrypick.dart';

class UseCaseModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<GetPosts>()
        .toInstance(
          GetPosts(
            currentScope.resolve<PostRepository>(named: 'postRepo'),
          ),
        )
        .singleton();

    bind<GetPostDetails>()
        .toInstance(
          GetPostDetails(
            currentScope.resolve<PostRepository>(named: 'postRepo'),
          ),
        )
        .singleton();

    bind<GetComments>()
        .toInstance(
          GetComments(
            currentScope.resolve<CommentRepository>(),
          ),
        )
        .singleton();
  }
}
