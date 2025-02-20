import 'package:art_list/core/presentation/animation/slide_animation.dart';
import 'package:art_list/feature/article/domain/entity/comment.dart';
import 'package:flutter/material.dart';

class CommentTile extends StatelessWidget {
  final Comment comment;
  final int index;

  const CommentTile({super.key, required this.comment, required this.index});

  @override
  Widget build(BuildContext context) {
    return ArtSlideAnimation(
      duration: Duration(milliseconds: 2000 + 100 * index),
      curve: Curves.elasticIn,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  comment.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                comment.email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          subtitle: Text(
            comment.body,
          ),
        ),
      ),
    );
  }
}