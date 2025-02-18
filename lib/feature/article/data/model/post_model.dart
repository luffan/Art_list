import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required int id,
    required String title,
    required String body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, Object?> json) =>
      _$PostModelFromJson(json);
}

@freezed
class ListPostModel with _$ListPostModel {
  const factory ListPostModel({required List<PostModel> posts}) = _ListPostModel;

  factory ListPostModel.fromJson(Map<String, Object?> json) =>
      _$ListPostModelFromJson(json);
}
