import 'package:art_list/core/presentation/provider/theme_provider.dart';
import 'package:art_list/di/modules/configure_dependencies.dart';
import 'package:art_list/feature/article/presentation/bloc/post_bloc/post_bloc.dart';
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
  @override
  void initState() {
    super.initState();
    Injector.locator.resolve<PostBloc>().add(GetListPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List posts'),
        actions: [
          IconButton(
            onPressed: () => context.read<ThemeProvider>().switchingTheme(),
            icon: Icon(
              Icons.dark_mode_outlined,
            ),
          )
        ],
      ),
      body: BlocBuilder<PostBloc, PostState>(
        bloc: Injector.locator.resolve<PostBloc>(),
        builder: (context, state) {
          if (state is Error) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is Loaded) {
            return Center(
              child: Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(
                        post.body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
