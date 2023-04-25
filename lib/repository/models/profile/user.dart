
import 'package:car_m/repository/models/profile/authorities.dart';
import 'package:car_m/repository/models/profile/post/avatar.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class UserModel {
  final int id;
  final String? login;
  final String? email;
  final String? fullName;
  final AvatarModel? avatar;
  final List<dynamic>? userAuto;
  final bool? enabled;
  final String? username;
  final List<AuthoritiesModel>? authorities;
  final bool? accountNonExpired;
  final bool? accountNonLocked;
  final bool? credentialsNonExpired;
  UserModel({
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
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}