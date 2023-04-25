import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class TokenModel {
  final String username;
  final String token;
  TokenModel({
    required this.token,
    required this.username,
  });
  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}