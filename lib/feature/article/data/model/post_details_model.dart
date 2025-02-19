import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'post_details_model.freezed.dart';

part 'post_details_model.g.dart';

@freezed
class PostDetailsModel with _$PostDetailsModel {
  @HiveType(typeId: 2)
  const factory PostDetailsModel({
    @HiveField(0) required int id,
    @HiveField(1)required String title,
    @HiveField(2) required String body,
  }) = _PostDetailsModel;

  factory PostDetailsModel.fromJson(Map<String, Object?> json) =>
      _$PostDetailsModelFromJson(json);
}

@freezed
class ListPostDetailsModel with _$ListPostDetailsModel {
  @HiveType(typeId: 3)
  const factory ListPostDetailsModel({
    @HiveField(0) required List<PostDetailsModel> details,
  }) = _ListPostDetailsModel;

  factory ListPostDetailsModel.fromJson(Map<String, Object?> json) =>
      _$ListPostDetailsModelFromJson(json);
}
