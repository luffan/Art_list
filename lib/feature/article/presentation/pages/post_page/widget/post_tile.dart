import 'package:art_list/core/presentation/animation/fade_animation.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/presentation/router/article_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final int index;
  final Post post;

  const PostTile({
    super.key,
    required this.post,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      duration: Duration(milliseconds: 100 + 500 * index),
      curve: Curves.easeIn,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListTile(
          onTap: () {
            context.pushRoute(
              PostDetailsRoute(postId: post.id),
            );
          },
          title: Text(
            post.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            post.body,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
