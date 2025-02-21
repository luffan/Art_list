import 'package:art_list/core/presentation/provider/theme_provider.dart';
import 'package:art_list/core/presentation/widget/app_bar.dart';
import 'package:art_list/core/presentation/widget/empty_info.dart';
import 'package:art_list/core/presentation/widget/error_info.dart';
import 'package:art_list/core/presentation/widget/loader.dart';
import 'package:art_list/core/presentation/widget/smart_refresh_indicator.dart';
import 'package:art_list/di/modules/configure_dependencies.dart';
import 'package:art_list/feature/article/presentation/bloc/post_bloc/post_bloc.dart';
import 'package:art_list/feature/article/presentation/pages/post_page/widget/post_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late final PostBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = Injector.locator.resolve<PostBloc>()..add(GetListPost());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArtAppBar(
        title: 'List Post',
        actions: [
          IconButton(
            onPressed: context.read<ThemeProvider>().switchingTheme,
            icon: Icon(
              Icons.dark_mode_outlined,
            ),
          )
        ],
      ),
      body: SmartRefreshIndicator(
        onRefresh: () async {
          _bloc.add(GetListPost());
        },
        child: BlocBuilder<PostBloc, PostState>(
          bloc: _bloc,
          builder: (_, state) {
            if (state is Error) {
              return ErrorInfo(
                title: state.title,
                message: state.message,
              );
            } else if (state is Loaded) {
              return PostList(posts: state.posts);
            } else if (state is Empty) {
              return EmptyInfo();
            } else {
              return Loader();
            }
          },
        ),
      ),
    );
  }
}
