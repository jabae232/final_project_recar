// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postmedia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostMediaModel _$PostMediaModelFromJson(Map<String, dynamic> json) =>
    PostMediaModel(
      id: json['id'] as int,
      mediaFile: json['mediaFile'] as String?,
      position: json['position'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$PostMediaModelToJson(PostMediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaFile': instance.mediaFile,
      'position': instance.position,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
