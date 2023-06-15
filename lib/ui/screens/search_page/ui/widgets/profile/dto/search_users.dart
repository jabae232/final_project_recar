// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  int id;
  String login;
  String? email;
  String? fullName;
  Avatar? avatar;
  List<dynamic> userAuto;
  bool enabled;
  String username;
  List<AuthorityElement> authorities;
  bool credentialsNonExpired;
  bool accountNonLocked;
  bool accountNonExpired;

  Users({
    required this.id,
    required this.login,
    this.email,
    this.fullName,
    this.avatar,
    required this.userAuto,
    required this.enabled,
    required this.username,
    required this.authorities,
    required this.credentialsNonExpired,
    required this.accountNonLocked,
    required this.accountNonExpired,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    login: json["login"],
    email: json["email"],
    fullName: json["fullName"],
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
    userAuto: List<dynamic>.from(json["userAuto"].map((x) => x)),
    enabled: json["enabled"],
    username: json["username"],
    authorities: List<AuthorityElement>.from(json["authorities"].map((x) => AuthorityElement.fromJson(x))),
    credentialsNonExpired: json["credentialsNonExpired"],
    accountNonLocked: json["accountNonLocked"],
    accountNonExpired: json["accountNonExpired"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "login": login,
    "email": email,
    "fullName": fullName,
    "avatar": avatar?.toJson(),
    "userAuto": List<dynamic>.from(userAuto.map((x) => x)),
    "enabled": enabled,
    "username": username,
    "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
    "credentialsNonExpired": credentialsNonExpired,
    "accountNonLocked": accountNonLocked,
    "accountNonExpired": accountNonExpired,
  };
}

class AuthorityElement {
  int id;
  AuthorityEnum name;
  AuthorityEnum authority;

  AuthorityElement({
    required this.id,
    required this.name,
    required this.authority,
  });

  factory AuthorityElement.fromJson(Map<String, dynamic> json) => AuthorityElement(
    id: json["id"],
    name: authorityEnumValues.map[json["name"]]!,
    authority: authorityEnumValues.map[json["authority"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": authorityEnumValues.reverse[name],
    "authority": authorityEnumValues.reverse[authority],
  };
}

enum AuthorityEnum { USER, ROLE_ADMIN }

final authorityEnumValues = EnumValues({
  "ROLE_ADMIN": AuthorityEnum.ROLE_ADMIN,
  "USER": AuthorityEnum.USER
});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
