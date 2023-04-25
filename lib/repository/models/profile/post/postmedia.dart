
import 'package:json_annotation/json_annotation.dart';
part 'postmedia.g.dart';
@JsonSerializable()
class PostMediaModel {
  final int id;
  final String? mediaFile;
  final int position;
  final double longitude;
  final double latitude;
  PostMediaModel({
    required this.id,
    required this.mediaFile,
    required this.position,
    required this.latitude,
    required this.longitude,
});
  factory PostMediaModel.fromJson(Map<String, dynamic> json) => _$PostMediaModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostMediaModelToJson(this);
}