// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommentModelImplAdapter extends TypeAdapter<_$CommentModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$CommentModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CommentModelImpl(
      id: fields[0] as int,
      postId: fields[1] as int,
      name: fields[2] as String,
      email: fields[3] as String,
      body: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$CommentModelImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.postId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ListCommentModelImplAdapter extends TypeAdapter<_$ListCommentModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$ListCommentModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ListCommentModelImpl(
      comments: (fields[0] as List).cast<CommentModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$ListCommentModelImpl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListCommentModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
