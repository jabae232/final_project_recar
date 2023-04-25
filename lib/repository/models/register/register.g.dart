// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      login: json['login'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'login': instance.login,
      'password': instance.password,
      'fullName': instance.fullName,
    };
