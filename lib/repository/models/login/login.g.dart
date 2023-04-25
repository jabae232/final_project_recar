// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      password: json['password'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
