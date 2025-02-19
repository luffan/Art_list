import 'package:art_list/core/data/entity/list_entity.dart';

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
}

class ListComment implements ListEntity<Comment> {
  final List<Comment> _comments;

  const ListComment({required List<Comment> comments}) : _comments = comments;

  @override
  List<Comment> get asList => _comments;
}
