import 'package:auto_route/auto_route.dart';

import 'article_router.gr.dart';

@AutoRouterConfig()
class ArticleRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: PostRoute.page, initial: true),
        AutoRoute(page: PostDetailsRoute.page),
      ];
}
