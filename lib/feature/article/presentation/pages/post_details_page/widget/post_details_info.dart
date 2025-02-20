import 'package:art_list/core/presentation/animation/rotate_and_scale_animation.dart';
import 'package:art_list/feature/article/domain/entity/post_details.dart';
import 'package:flutter/material.dart';

class PostDetailsInfo extends StatelessWidget {
  final PostDetails details;

  const PostDetailsInfo({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return RotateAndScaleAnimation(
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              details.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(
              details.body,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
