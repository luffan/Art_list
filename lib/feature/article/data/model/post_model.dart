import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'post_model.freezed.dart';

part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  @HiveType(typeId: 4)
  const factory PostModel({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required String body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, Object?> json) =>
      _$PostModelFromJson(json);
}

@freezed
class ListPostModel with _$ListPostModel {
  @HiveType(typeId: 5)
  const factory ListPostModel({
    @HiveField(0) required List<PostModel> posts,
  }) = _ListPostModel;

  factory ListPostModel.fromJson(Map<String, Object?> json) =>
      _$ListPostModelFromJson(json);
}
