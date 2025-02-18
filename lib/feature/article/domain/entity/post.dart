import 'package:art_list/core/entity/list_entity.dart';

class Post {
  final int id;
  final String title;
  final String body;

  const Post({
    required this.id,
    required this.title,
    required this.body,
  });
}

class ListPost implements ListEntity<Post> {
  final List<Post> _posts;

  const ListPost({required List<Post> posts}) : _posts = posts;

  @override
  List<Post> get asList => _posts;
}
