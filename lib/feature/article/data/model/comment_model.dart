import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'comment_model.freezed.dart';

part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  @HiveType(typeId: 0)
  const factory CommentModel({
    @HiveField(0) required int id,
    @HiveField(1) required int postId,
    @HiveField(2) required String name,
    @HiveField(3) required String email,
    @HiveField(4) required String body,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, Object?> json) =>
      _$CommentModelFromJson(json);
}

@freezed
class ListCommentModel with _$ListCommentModel {
  @HiveType(typeId: 1)
  const factory ListCommentModel({
    @HiveField(0) required List<CommentModel> comments,
  }) = _ListCommentModel;

  factory ListCommentModel.fromJson(Map<String, Object?> json) =>
      _$ListCommentModelFromJson(json);
}
