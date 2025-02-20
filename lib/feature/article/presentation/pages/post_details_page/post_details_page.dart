import 'package:art_list/core/presentation/widget/app_bar.dart';
import 'package:art_list/core/presentation/widget/empty_info.dart';
import 'package:art_list/core/presentation/widget/error_info.dart';
import 'package:art_list/core/presentation/widget/loader.dart';
import 'package:art_list/di/modules/configure_dependencies.dart';
import 'package:art_list/feature/article/presentation/bloc/comment_bloc/comment_bloc.dart'
    as com;
import 'package:art_list/feature/article/presentation/bloc/post_details_bloc/post_details_bloc.dart';
import 'package:art_list/feature/article/presentation/pages/post_details_page/widget/comment_list.dart';
import 'package:art_list/feature/article/presentation/pages/post_details_page/widget/post_details_info.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PostDetailsPage extends StatefulWidget {
  final int postId;

  const PostDetailsPage({super.key, required this.postId});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  late final PostDetailsBloc _blocDetails;
  late final com.CommentBloc _commentBloc;

  @override
  void initState() {
    super.initState();
    _blocDetails = Injector.locator.resolve<PostDetailsBloc>()
      ..add(
        GetDetailsPost(widget.postId),
      );
    _commentBloc = Injector.locator.resolve<com.CommentBloc>()
      ..add(
        com.GetCommentPost(widget.postId),
      );
  }

  @override
  void dispose() {
    _commentBloc.close();
    _blocDetails.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArtAppBar(title: 'Details'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<PostDetailsBloc, PostDetailsState>(
              bloc: _blocDetails,
              builder: (context, state) {
                if (state is Error) {
                  return ErrorInfo(
                    title: state.title,
                    message: state.message,
                  );
                } else if (state is Loaded) {
                  return PostDetailsInfo(
                    details: state.details,
                  );
                } else if (state is Empty) {
                  return EmptyInfo();
                } else {
                  return Loader();
                }
              },
            ),
            const SizedBox(height: 12),
            Text(
              'Comments',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 8),
            BlocBuilder<com.CommentBloc, com.CommentState>(
              bloc: _commentBloc,
              builder: (context, state) {
                if (state is com.Error) {
                  return ErrorInfo(
                    title: state.title,
                    message: state.message,
                  );
                } else if (state is com.Loaded) {
                  return Expanded(
                    child: CommentList(
                      comments: state.comments,
                    ),
                  );
                } else if (state is com.Empty) {
                  return EmptyInfo();
                } else {
                  return Loader();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
