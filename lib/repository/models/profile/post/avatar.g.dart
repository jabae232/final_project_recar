// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvatarModel _$AvatarModelFromJson(Map<String, dynamic> json) => AvatarModel(
      path: json['path'] as String?,
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$AvatarModelToJson(AvatarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'createdAt': instance.createdAt,
    };
