import 'package:art_list/core/data/entity/list_entity.dart';

class PostDetails {
  final int id;
  final String title;
  final String body;

  const PostDetails({
    required this.id,
    required this.title,
    required this.body,
  });
}

class ListPostDetails implements ListEntity<PostDetails> {
  final List<PostDetails> _details;

  const ListPostDetails({
    required List<PostDetails> details,
  }) : _details = details;

  @override
  List<PostDetails> get asList => _details;
}
