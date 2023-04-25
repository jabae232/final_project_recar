// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      login: json['login'] as String?,
      email: json['email'] as String?,
      id: json['id'] as int,
      avatar: json['avatar'] == null
          ? null
          : AvatarModel.fromJson(json['avatar'] as Map<String, dynamic>),
      accountNonExpired: json['accountNonExpired'] as bool?,
      accountNonLocked: json['accountNonLocked'] as bool?,
      authorities: (json['authorities'] as List<dynamic>?)
          ?.map((e) => AuthoritiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      credentialsNonExpired: json['credentialsNonExpired'] as bool?,
      enabled: json['enabled'] as bool?,
      userAuto: json['userAuto'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'email': instance.email,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
      'userAuto': instance.userAuto,
      'enabled': instance.enabled,
      'username': instance.username,
      'authorities': instance.authorities,
      'accountNonExpired': instance.accountNonExpired,
      'accountNonLocked': instance.accountNonLocked,
      'credentialsNonExpired': instance.credentialsNonExpired,
    };
