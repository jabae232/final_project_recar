
import 'package:json_annotation/json_annotation.dart';
part 'authorities.g.dart';
@JsonSerializable()
class AuthoritiesModel {
  final int id;
  final String name;
  final String authority;
  AuthoritiesModel({
    required this.id,
    required this.name,
    required this.authority,
});
  factory AuthoritiesModel.fromJson(Map<String, dynamic> json) => _$AuthoritiesModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthoritiesModelToJson(this);
}