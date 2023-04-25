// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      followers: json['followers'] as List<dynamic>,
      clubs: json['clubs'] as List<dynamic>,
      likes: json['likes'] as List<dynamic>,
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: json['events'] as List<dynamic>,
      following: (json['following'] as List<dynamic>)
          .map((e) => FollowersFollowings.fromJson(e as Map<String, dynamic>))
          .toList(),
      saves: (json['saves'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'followers': instance.followers,
      'saves': instance.saves,
      'following': instance.following,
      'clubs': instance.clubs,
      'user': instance.user,
      'posts': instance.posts,
      'events': instance.events,
      'likes': instance.likes,
    };