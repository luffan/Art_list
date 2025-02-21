import 'package:auto_route/auto_route.dart';

import 'animation/slide_transition.dart';
import 'article_router.gr.dart';

/// Class describing application routes
///
/// [PostRoute] route for [PostPage]
///
/// [PostDetailsRoute] route for [PostDetailsPage]
///
@AutoRouterConfig()
class ArticleRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: PostRoute.page,
          initial: true,
        ),
        CustomRoute(
          page: PostDetailsRoute.page,
          transitionsBuilder: slideAnimation,
        ),
      ];
}
