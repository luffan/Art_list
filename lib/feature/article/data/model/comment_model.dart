import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'comment_model.freezed.dart';

part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required int id,
    required String title,
    required String body,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, Object?> json) =>
      _$CommentModelFromJson(json);
}

@freezed
class ListCommentModel with _$ListCommentModel {
  const factory ListCommentModel({required List<CommentModel> posts}) =
      _ListCommentModel;

  factory ListCommentModel.fromJson(Map<String, Object?> json) =>
      _$ListCommentModelFromJson(json);
}
