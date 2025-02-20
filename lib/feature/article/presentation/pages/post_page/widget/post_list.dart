import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:flutter/material.dart';

import 'post_tile.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;

  const PostList({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (_, index) {
          final post = posts[index];
          return PostTile(post: post);
        },
        separatorBuilder: (_, __) => const SizedBox(height: 12),
      ),
    );
  }
}
