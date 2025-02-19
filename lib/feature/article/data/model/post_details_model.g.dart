// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostDetailsModelImplAdapter extends TypeAdapter<_$PostDetailsModelImpl> {
  @override
  final int typeId = 2;

  @override
  _$PostDetailsModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PostDetailsModelImpl(
      id: fields[0] as int,
      title: fields[1] as String,
      body: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$PostDetailsModelImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostDetailsModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ListPostDetailsModelImplAdapter
    extends TypeAdapter<_$ListPostDetailsModelImpl> {
  @override
  final int typeId = 3;

  @override
  _$ListPostDetailsModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ListPostDetailsModelImpl(
      details: (fields[0] as List).cast<PostDetailsModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$ListPostDetailsModelImpl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListPostDetailsModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
