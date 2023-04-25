
import 'package:car_m/repository/models/profile/followersPage/follower_followings_list.dart';
import 'package:car_m/repository/models/profile/post/post.dart';
import 'package:car_m/repository/models/profile/user.dart';
import 'package:json_annotation/json_annotation.dart';

import 'followers.dart';

part 'profile.g.dart';
@JsonSerializable()
class ProfileModel {
  final List<dynamic> followers;
  final List<PostModel> saves;
  final List<FollowersFollowings> following;
  final List<dynamic> clubs;
  final UserModel user;
  final List<PostModel> posts;
  final List<dynamic> events;
  final List<dynamic> likes;
  ProfileModel({
    required this.followers,
    required this.clubs,
    required this.likes,
  required this.posts,
  required this.events,
  required this.following,
  required this.saves,
  required this.user,
});
  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
