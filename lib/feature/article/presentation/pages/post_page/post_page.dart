import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          'Post page',
        ),
      ),
    );
  }
}
