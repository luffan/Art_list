// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      id: (json['id'] as num).toInt(),
      postId: (json['postId'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };

_$ListCommentModelImpl _$$ListCommentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListCommentModelImpl(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListCommentModelImplToJson(
        _$ListCommentModelImpl instance) =>
    <String, dynamic>{
      'comments': instance.comments,
    };
