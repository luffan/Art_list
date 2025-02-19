// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:art_list/feature/article/presentation/pages/post_details_page/post_detials_page.dart'
    as _i1;
import 'package:art_list/feature/article/presentation/pages/post_page/post_page.dart'
    as _i2;
import 'package:auto_route/auto_route.dart' as _i3;

/// generated route for
/// [_i1.PostDetailsPage]
class PostDetailsRoute extends _i3.PageRouteInfo<void> {
  const PostDetailsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          PostDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.PostDetailsPage();
    },
  );
}

/// generated route for
/// [_i2.PostPage]
class PostRoute extends _i3.PageRouteInfo<void> {
  const PostRoute({List<_i3.PageRouteInfo>? children})
      : super(
          PostRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.PostPage();
    },
  );
}
