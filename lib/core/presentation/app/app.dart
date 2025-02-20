import 'package:art_list/core/presentation/provider/theme_provider.dart';
import 'package:art_list/core/presentation/widget/app_lifecycle.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final RootStackRouter appRouter;

  const App({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Builder(
        builder: (context) {
          return AppLifecycle(
            child: MaterialApp.router(
              theme: ThemeData(
                useMaterial3: true,
                colorSchemeSeed: const Color.fromRGBO(86, 80, 14, 171),
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.dark,
                colorSchemeSeed: const Color.fromRGBO(86, 80, 14, 171),
              ),
              themeMode: context.watch<ThemeProvider>().theme,
              routerConfig: appRouter.config(),
            ),
          );
        },
      ),
    );
  }
}
