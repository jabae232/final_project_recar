import 'package:json_annotation/json_annotation.dart';
part 'register.g.dart';
@JsonSerializable()
class RegisterModel {
  final String email;
  final String login;
  final String password;
  final String fullName;
  RegisterModel(
      {required this.login,
      required this.password,
      required this.email,
      required this.fullName});
}
