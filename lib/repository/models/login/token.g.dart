// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      token: json['token'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'token': instance.token,
    };
