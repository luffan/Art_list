import 'package:art_list/core/data/entity/converter.dart';
import 'package:art_list/core/data/network/interface/network_info.dart';
import 'package:art_list/feature/article/data/data_source/interface/cache_data_source.dart';
import 'package:art_list/feature/article/data/data_source/interface/remote_data_source.dart';
import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_details_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';
import 'package:art_list/feature/article/data/repository/comment_repository_impl.dart';
import 'package:art_list/feature/article/data/repository/post_repository_impl.dart';
import 'package:art_list/feature/article/domain/entity/comment.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/entity/post_details.dart';
import 'package:art_list/feature/article/domain/repository/comment_repository.dart';
import 'package:art_list/feature/article/domain/repository/post_repository.dart';
import 'package:cherrypick/cherrypick.dart';

class RepositoryModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<PostRepository>().withName('postRepo')
        .toInstance(
          PostRepositoryImpl(
            currentScope.resolve<CacheDataSource>(),
            currentScope.resolve<RemoteDataSource>(),
            currentScope.resolve<NetworkInfo>(),
            currentScope.resolve<Converter<ListPost, ListPostModel>>(),
            currentScope.resolve<Converter<PostDetails, PostDetailsModel>>(),
          ),
        )
        .singleton();

    bind<CommentRepository>()
        .toInstance(
          CommentRepositoryImpl(
            currentScope.resolve<CacheDataSource>(),
            currentScope.resolve<RemoteDataSource>(),
            currentScope.resolve<Converter<ListComment, ListCommentModel>>(),
            currentScope.resolve<NetworkInfo>(),
          ),
        )
        .singleton();
  }
}
