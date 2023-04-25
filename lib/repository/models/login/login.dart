import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name : "username")
  final String username;
  @JsonKey(name : "password")
  final String password;
  LoginModel({
    required this.password,
    required this.username,
});
  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}