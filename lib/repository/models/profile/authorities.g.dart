// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthoritiesModel _$AuthoritiesModelFromJson(Map<String, dynamic> json) =>
    AuthoritiesModel(
      id: json['id'] as int,
      name: json['name'] as String,
      authority: json['authority'] as String,
    );

Map<String, dynamic> _$AuthoritiesModelToJson(AuthoritiesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'authority': instance.authority,
    };
