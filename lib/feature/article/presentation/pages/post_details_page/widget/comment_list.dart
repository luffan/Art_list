import 'package:art_list/feature/article/domain/entity/comment.dart';
import 'package:art_list/feature/article/presentation/pages/post_details_page/widget/comment_tile.dart';
import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  final List<Comment> comments;

  const CommentList({
    super.key,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: comments.length,
        itemBuilder: (_, index) {
          final comment = comments[index];
          return CommentTile(
            comment: comment,
            index: index,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 12),
      ),
    );
  }
}
