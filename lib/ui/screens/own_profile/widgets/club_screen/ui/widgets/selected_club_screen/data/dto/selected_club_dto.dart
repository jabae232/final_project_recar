// To parse this JSON data, do
//
//     final ownClubDto = ownClubDtoFromJson(jsonString);

import 'dart:convert';

OwnClubDto ownClubDtoFromJson(String str) => OwnClubDto.fromJson(json.decode(str));

String ownClubDtoToJson(OwnClubDto data) => json.encode(data.toJson());

class OwnClubDto {
  int id;
  dynamic brand;
  List<Admin> admins;
  String name;
  String description;
  List<Admin> user;

  OwnClubDto({
    required this.id,
    this.brand,
    required this.admins,
    required this.name,
    required this.description,
    required this.user,
  });

  factory OwnClubDto.fromJson(Map<String, dynamic> json) => OwnClubDto(
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
  List<Authority> authorities;
  String username;
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
    required this.authorities,
    required this.username,
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
    authorities: List<Authority>.from(json["authorities"].map((x) => Authority.fromJson(x))),
    username: json["username"],
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
    "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
    "username": username,
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
