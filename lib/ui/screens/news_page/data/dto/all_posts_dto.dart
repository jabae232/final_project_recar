// To parse this JSON data, do
//
//     final allPostsDto = allPostsDtoFromJson(jsonString);

import 'dart:convert';

List<AllPostsDto> allPostsDtoFromJson(String str) => List<AllPostsDto>.from(json.decode(str).map((x) => AllPostsDto.fromJson(x)));

String allPostsDtoToJson(List<AllPostsDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPostsDto {
  int id;
  String description;
  Author author;
  dynamic authorClub;
  List<PostComment> postComments;
  DateTime createdAt;
  dynamic caption;
  List<PostMedia> postMedia;
  dynamic postType;

  AllPostsDto({
    required this.id,
    required this.description,
    required this.author,
    this.authorClub,
    required this.postComments,
    required this.createdAt,
    this.caption,
    required this.postMedia,
    this.postType,
  });

  factory AllPostsDto.fromJson(Map<String, dynamic> json) => AllPostsDto(
    id: json["id"],
    description: json["description"],
    author: Author.fromJson(json["author"]),
    authorClub: json["authorClub"],
    postComments: List<PostComment>.from(json["postComments"].map((x) => PostComment.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    caption: json["caption"],
    postMedia: List<PostMedia>.from(json["postMedia"].map((x) => PostMedia.fromJson(x))),
    postType: json["postType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "author": author.toJson(),
    "authorClub": authorClub,
    "postComments": List<dynamic>.from(postComments.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "caption": caption,
    "postMedia": List<dynamic>.from(postMedia.map((x) => x.toJson())),
    "postType": postType,
  };
}

class Author {
  int id;
  String login;
  String email;
  String fullName;
  Avatar avatar;
  Avatar backgroundPhoto;
  List<dynamic> userAuto;
  bool enabled;
  String username;
  List<Authority> authorities;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;

  Author({
    required this.id,
    required this.login,
    required this.email,
    required this.fullName,
    required this.avatar,
    required this.backgroundPhoto,
    required this.userAuto,
    required this.enabled,
    required this.username,
    required this.authorities,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.credentialsNonExpired,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    login: json["login"],
    email: json["email"],
    fullName: json["fullName"],
    avatar: Avatar.fromJson(json["avatar"]),
    backgroundPhoto: Avatar.fromJson(json["backgroundPhoto"]),
    userAuto: List<dynamic>.from(json["userAuto"].map((x) => x)),
    enabled: json["enabled"],
    username: json["username"],
    authorities: List<Authority>.from(json["authorities"].map((x) => Authority.fromJson(x))),
    accountNonExpired: json["accountNonExpired"],
    accountNonLocked: json["accountNonLocked"],
    credentialsNonExpired: json["credentialsNonExpired"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "login": login,
    "email": email,
    "fullName": fullName,
    "avatar": avatar.toJson(),
    "backgroundPhoto": backgroundPhoto.toJson(),
    "userAuto": List<dynamic>.from(userAuto.map((x) => x)),
    "enabled": enabled,
    "username": username,
    "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
    "accountNonExpired": accountNonExpired,
    "accountNonLocked": accountNonLocked,
    "credentialsNonExpired": credentialsNonExpired,
  };
}

class Authority {
  int id;
  String name;
  String authority;

  Authority({
    required this.id,
    required this.name,
    required this.authority,
  });

  factory Authority.fromJson(Map<String, dynamic> json) => Authority(
    id: json["id"],
    name: json["name"],
    authority: json["authority"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "authority": authority,
  };
}

class Avatar {
  int id;
  String path;
  String fileCode;
  String dowloadUri;
  DateTime createdAt;

  Avatar({
    required this.id,
    required this.path,
    required this.fileCode,
    required this.dowloadUri,
    required this.createdAt,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    id: json["id"],
    path: json["path"],
    fileCode: json["fileCode"],
    dowloadUri: json["dowloadUri"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
    "fileCode": fileCode,
    "dowloadUri": dowloadUri,
    "createdAt": createdAt.toIso8601String(),
  };
}

class PostComment {
  int id;
  Author author;
  DateTime createdAt;
  String comment;
  dynamic replyToComment;

  PostComment({
    required this.id,
    required this.author,
    required this.createdAt,
    required this.comment,
    this.replyToComment,
  });

  factory PostComment.fromJson(Map<String, dynamic> json) => PostComment(
    id: json["id"],
    author: Author.fromJson(json["author"]),
    createdAt: DateTime.parse(json["createdAt"]),
    comment: json["comment"],
    replyToComment: json["replyToComment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "comment": comment,
    "replyToComment": replyToComment,
  };
}

class PostMedia {
  int id;
  String mediaFile;
  int position;
  int longitude;
  int latitude;

  PostMedia({
    required this.id,
    required this.mediaFile,
    required this.position,
    required this.longitude,
    required this.latitude,
  });

  factory PostMedia.fromJson(Map<String, dynamic> json) => PostMedia(
    id: json["id"],
    mediaFile: json["mediaFile"],
    position: json["position"],
    longitude: json["longitude"],
    latitude: json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mediaFile": mediaFile,
    "position": position,
    "longitude": longitude,
    "latitude": latitude,
  };
}
