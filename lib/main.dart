import 'package:art_list/core/presentation/app/app.dart';
import 'package:art_list/di/modules/configure_dependencies.dart';
import 'package:art_list/feature/article/data/data_source/cache_data_source_impl.dart';
import 'package:art_list/feature/article/presentation/router/article_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheDataSourceImpl.initHive();
  Injector.configureDependencies();
  final appRouter = ArticleRouter();
  runApp(
    App(
      appRouter: appRouter,
    ),
  );
}
