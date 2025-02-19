import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_details_model.freezed.dart';

part 'post_details_model.g.dart';

@freezed
class PostDetailsModel with _$PostDetailsModel {
  const factory PostDetailsModel({
    required int id,
    required String title,
    required String body,
  }) = _PostDetailsModel;

  factory PostDetailsModel.fromJson(Map<String, Object?> json) =>
      _$PostDetailsModelFromJson(json);
}

@freezed
class ListPostDetailsModel with _$ListPostDetailsModel {
  const factory ListPostDetailsModel({
    required List<PostDetailsModel> details,
  }) = _ListPostDetailsModel;

  factory ListPostDetailsModel.fromJson(Map<String, Object?> json) =>
      _$ListPostDetailsModelFromJson(json);
}
