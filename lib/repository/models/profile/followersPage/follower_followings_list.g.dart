// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_followings_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowersFollowings _$FollowersFollowingsFromJson(Map<String, dynamic> json) =>
    FollowersFollowings(
      id: json['id'] as int?,
      followedUser: json['followedUser'] == null
          ? null
          : FollowersModel.fromJson(
              json['followedUser'] as Map<String, dynamic>),
      followingUser: json['followingUser'] == null
          ? null
          : FollowersModel.fromJson(
              json['followingUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowersFollowingsToJson(
        FollowersFollowings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'followedUser': instance.followedUser,
      'followingUser': instance.followingUser,
    };
