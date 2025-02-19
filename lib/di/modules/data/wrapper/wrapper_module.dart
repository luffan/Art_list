import 'package:art_list/core/entity/converter.dart';
import 'package:art_list/feature/article/data/model/comment_model.dart';
import 'package:art_list/feature/article/data/model/post_details_model.dart';
import 'package:art_list/feature/article/data/model/post_model.dart';
import 'package:art_list/feature/article/data/wrapper/comment_wrapper.dart';
import 'package:art_list/feature/article/data/wrapper/post_details_wrapper.dart';
import 'package:art_list/feature/article/data/wrapper/post_wrapper.dart';
import 'package:art_list/feature/article/domain/entity/comment.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/entity/post_details.dart';
import 'package:cherrypick/cherrypick.dart';

class WrapperModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<Converter<ListPost, ListPostModel>>()
        .toInstance(ListPostWrapper())
        .singleton();

    bind<Converter<PostDetails, PostDetailsModel>>()
        .toInstance(PostDetailsWrapper())
        .singleton();

    bind<Converter<ListComment, ListCommentModel>>()
        .toInstance(ListCommentWrapper())
        .singleton();
  }
}
