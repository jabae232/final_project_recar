import 'package:car_m/repository/models/profile/post/postmedia.dart';
import 'package:car_m/repository/models/profile/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';
@JsonSerializable()
class PostModel {
 final int id;
 final String? description;
 final UserModel author;
 final String? authorClub;
 final List<dynamic> postComments;
 final String? createdAt;
 final String? caption;
 final List<PostMediaModel> postMedia;
 final String? postType;
 PostModel({
   required this.id,
   required this.description,
   required this.author,
   required this.authorClub,
   required this.caption,
   required this.createdAt,
   required this.postComments,
   required this.postMedia,
   required this.postType,
});
 factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
 Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
