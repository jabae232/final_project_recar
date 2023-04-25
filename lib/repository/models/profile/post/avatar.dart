
import 'package:json_annotation/json_annotation.dart';
part 'avatar.g.dart';
@JsonSerializable()
class AvatarModel {
  final int? id;
  final String? path;
  final String? createdAt;
  AvatarModel({
    required this.path,
    required this.id,
    required this.createdAt
});
  factory AvatarModel.fromJson(Map<String, dynamic> json) => _$AvatarModelFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarModelToJson(this);
}