import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PostDetailsPage extends StatelessWidget {
  final int postId;
  const PostDetailsPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          'Post details page',
        ),
      ),
    );
  }
}
