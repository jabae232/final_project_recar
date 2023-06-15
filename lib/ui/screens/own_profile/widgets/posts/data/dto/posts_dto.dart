// To parse this JSON data, do
//
//     final profileDto = profileDtoFromJson(jsonString);

import 'dart:convert';

ProfileDto profileDtoFromJson(String str) => ProfileDto.fromJson(json.decode(str));

String profileDtoToJson(ProfileDto data) => json.encode(data.toJson());

class ProfileDto {
  List<Follow> followers;
  List<Like> saves;
  List<Follow> following;
  List<Club> clubs;
  User user;
  List<Like> posts;
  List<Event> events;
  List<Like> likes;

  ProfileDto({
    required this.followers,
    required this.saves,
    required this.following,
    required this.clubs,
    required this.user,
    required this.posts,
    required this.events,
    required this.likes,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) => ProfileDto(
    followers: List<Follow>.from(json["followers"].map((x) => Follow.fromJson(x))),
    saves: List<Like>.from(json["saves"].map((x) => Like.fromJson(x))),
    following: List<Follow>.from(json["following"].map((x) => Follow.fromJson(x))),
    clubs: List<Club>.from(json["clubs"].map((x) => Club.fromJson(x))),
    user: User.fromJson(json["user"]),
    posts: List<Like>.from(json["posts"].map((x) => Like.fromJson(x))),
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
    likes: List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "followers": List<dynamic>.from(followers.map((x) => x.toJson())),
    "saves": List<dynamic>.from(saves.map((x) => x.toJson())),
    "following": List<dynamic>.from(following.map((x) => x.toJson())),
    "clubs": List<dynamic>.from(clubs.map((x) => x.toJson())),
    "user": user.toJson(),
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
    "likes": List<dynamic>.from(likes.map((x) => x.toJson())),
  };
}

class Club {
  int id;
  dynamic brand;
  List<User> admins;
  String name;
  String description;
  List<User> user;

  Club({
    required this.id,
    this.brand,
    required this.admins,
    required this.name,
    required this.description,
    required this.user,
  });

  factory Club.fromJson(Map<String, dynamic> json) => Club(
    id: json["id"],
    brand: json["brand"],
    admins: List<User>.from(json["admins"].map((x) => User.fromJson(x))),
    name: json["name"],
    description: json["description"],
    user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brand": brand,
    "admins": List<dynamic>.from(admins.map((x) => x.toJson())),
    "name": name,
    "description": description,
    "user": List<dynamic>.from(user.map((x) => x.toJson())),
  };
}

class User {
  int id;
  String login;
  String email;
  String fullName;
  Avatar? avatar;
  Avatar? backgroundPhoto;
  List<dynamic> userAuto;
  bool enabled;
  String username;
  List<AuthorityElement> authorities;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    login: json["login"],
    email: json["email"],
    fullName:json["fullName"],
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
    backgroundPhoto: json["backgroundPhoto"] == null ? null : Avatar.fromJson(json["backgroundPhoto"]),
    userAuto: List<dynamic>.from(json["userAuto"].map((x) => x)),
    enabled: json["enabled"],
    username:json["username"],
    authorities: List<AuthorityElement>.from(json["authorities"].map((x) => AuthorityElement.fromJson(x))),
    accountNonExpired: json["accountNonExpired"],
    accountNonLocked: json["accountNonLocked"],
    credentialsNonExpired: json["credentialsNonExpired"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "login":login,
    "email": email,
    "fullName": fullName,
    "avatar": avatar?.toJson(),
    "backgroundPhoto": backgroundPhoto?.toJson(),
    "userAuto": List<dynamic>.from(userAuto.map((x) => x)),
    "enabled": enabled,
    "username": username,
    "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
    "accountNonExpired": accountNonExpired,
    "accountNonLocked": accountNonLocked,
    "credentialsNonExpired": credentialsNonExpired,
  };
}

class AuthorityElement {
  int id;
  String name;
  String authority;

  AuthorityElement({
    required this.id,
    required this.name,
    required this.authority,
  });

  factory AuthorityElement.fromJson(Map<String, dynamic> json) => AuthorityElement(
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



class Event {
  int id;
  Club author;
  String name;
  Location location;
  String description;
  List<User> members;

  Event({
    required this.id,
    required this.author,
    required this.name,
    required this.location,
    required this.description,
    required this.members,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    author: Club.fromJson(json["author"]),
    name: json["name"],
    location: Location.fromJson(json["location"]),
    description: json["description"],
    members: List<User>.from(json["members"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author.toJson(),
    "name": name,
    "location": location.toJson(),
    "description": description,
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
  };
}

class Location {
  int id;
  String description;
  double lat;
  double lang;

  Location({
    required this.id,
    required this.description,
    required this.lat,
    required this.lang,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    description: json["description"],
    lat: json["lat"]?.toDouble(),
    lang: json["lang"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "lat": lat,
    "lang": lang,
  };
}

class Follow {
  int id;
  User followedUser;
  User followingUser;

  Follow({
    required this.id,
    required this.followedUser,
    required this.followingUser,
  });

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
    id: json["id"],
    followedUser: User.fromJson(json["followedUser"]),
    followingUser: User.fromJson(json["followingUser"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "followedUser": followedUser.toJson(),
    "followingUser": followingUser.toJson(),
  };
}

class Like {
  int id;
  String description;
  User author;
  dynamic authorClub;
  List<PostComment> postComments;
  DateTime createdAt;
  dynamic caption;
  List<PostMedia> postMedia;
  dynamic postType;

  Like({
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

  factory Like.fromJson(Map<String, dynamic> json) => Like(
    id: json["id"],
    description: json["description"],
    author: User.fromJson(json["author"]),
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

class PostComment {
  int id;
  User author;
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
    author: User.fromJson(json["author"]),
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
  double longitude;
  double latitude;

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
