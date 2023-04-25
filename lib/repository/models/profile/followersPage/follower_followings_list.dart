
import 'package:car_m/repository/models/profile/followers.dart';
import 'package:json_annotation/json_annotation.dart';
part 'follower_followings_list.g.dart';

@JsonSerializable()
class FollowersFollowings {
  final int? id;
  final FollowersModel? followedUser;
  final FollowersModel? followingUser;
  FollowersFollowings({
    required this.id,
    required this.followedUser,
    required this.followingUser,
});
  factory FollowersFollowings.fromJson(Map<String, dynamic> json) => _$FollowersFollowingsFromJson(json);
  Map<String, dynamic> toJson() => _$FollowersFollowingsToJson(this);
}