// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostDetailsModelImpl _$$PostDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PostDetailsModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$$PostDetailsModelImplToJson(
        _$PostDetailsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };

_$ListPostDetailsModelImpl _$$ListPostDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListPostDetailsModelImpl(
      details: (json['details'] as List<dynamic>)
          .map((e) => PostDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListPostDetailsModelImplToJson(
        _$ListPostDetailsModelImpl instance) =>
    <String, dynamic>{
      'details': instance.details,
    };
