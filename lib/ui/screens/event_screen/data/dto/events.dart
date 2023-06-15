// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

List<Events> eventsFromJson(String str) => List<Events>.from(json.decode(str).map((x) => Events.fromJson(x)));

String eventsToJson(List<Events> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Events {
  int id;
  Author author;
  String name;
  Location location;
  String description;
  List<Member> members;

  Events({
    required this.id,
    required this.author,
    required this.name,
    required this.location,
    required this.description,
    required this.members,
  });

  factory Events.fromJson(Map<String, dynamic> json) => Events(
    id: json["id"],
    author: Author.fromJson(json["author"]),
    name: json["name"],
    location: Location.fromJson(json["location"]),
    description: json["description"],
    members:  List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author.toJson(),
    "name": name,
    "location": location.toJson(),
    "description": description,
    "members": List<dynamic>.from(members.map((x) => x)),
  };
}
class Member {
  int id;
  String login;
  String email;
  String fullName;
  Avatar? avatar;
  Avatar? backgroundPhoto;
  List<dynamic> userAuto;
  bool enabled;
  String username;
  List<Authority> authorities;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;

  Member({
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

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    id: json["id"],
    login: json["login"],
    email: json["email"],
    fullName: json["fullName"],
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
    backgroundPhoto: json["backgroundPhoto"] == null ? null : Avatar.fromJson(json["backgroundPhoto"]),
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

class Author {
  int id;
  dynamic brand;
  List<Admin> admins;
  String name;
  String description;
  List<Admin> user;

  Author({
    required this.id,
    this.brand,
    required this.admins,
    required this.name,
    required this.description,
    required this.user,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    brand: json["brand"],
    admins: List<Admin>.from(json["admins"].map((x) => Admin.fromJson(x))),
    name: json["name"],
    description: json["description"],
    user: List<Admin>.from(json["user"].map((x) => Admin.fromJson(x))),
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

class Admin {
  int id;
  String login;
  String email;
  String fullName;
  Avatar? avatar;
  Avatar? backgroundPhoto;
  List<dynamic> userAuto;
  bool enabled;
  String username;
  List<Authority> authorities;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;

  Admin({
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

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    id: json["id"],
    login: json["login"],
    email: json["email"],
    fullName: json["fullName"],
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
    backgroundPhoto: json["backgroundPhoto"] == null ? null : Avatar.fromJson(json["backgroundPhoto"]),
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
    lat: json["lat"].toDouble(),
    lang: json["lang"] == null ? 0.0 : json["lang"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "lat": lat,
    "lang": lang,
  };
}
