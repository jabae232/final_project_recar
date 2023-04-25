import 'package:car_m/repository/models/profile/authorities.dart';
import 'package:car_m/repository/models/profile/post/avatar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'followers.g.dart';
@JsonSerializable()
class FollowersModel {
  final int id;
  final String? login;
  final String? email;
  final AvatarModel? avatar;
  final String? fullName;
  final List<String>? userAuto;
  final bool? enabled;
  final String? username;
  final List<AuthoritiesModel>? authorities;
  final bool? accountNonExpired;
  final bool? accountNonLocked;
  final bool? credentialsNonExpired;
  FollowersModel({
    required this.fullName,
    required this.username,
    required this.login,
    required this.email,
    required this.id,
    required this.avatar,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.authorities,
    required this.credentialsNonExpired,
    required this.enabled,
    required this.userAuto
});
  factory FollowersModel.fromJson(Map<String, dynamic> json) => _$FollowersModelFromJson(json);
  Map<String, dynamic> toJson() => _$FollowersModelToJson(this);
}
