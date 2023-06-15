
import 'dart:convert';

import '../../../../../../../api/api.dart';
import '../dto/search_users.dart';

class RepoSearchProfile {
  RepoSearchProfile({required this.api});
  final Api api;
  Future<List<Users>> fetch() async {
    final result = await api.dio.get(
      '/user/',
    );
    List<Users> listUsers= usersFromJson(json.encode(result.data));
    return listUsers;
  }
}