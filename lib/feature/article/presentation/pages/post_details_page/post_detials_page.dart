import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key});

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
