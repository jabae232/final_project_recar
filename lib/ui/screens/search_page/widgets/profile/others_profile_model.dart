import 'package:car_m/repository/repo/repo.dart';
import 'package:flutter/material.dart';
import '../../../../../repository/models/profile/user.dart';
import '../../../profile/profile.dart';


class OtherProfileWidgetModel extends ChangeNotifier {
  final _users = <UserModel>[];
  final _apiClient = RecarRepository();
  List<UserModel> get users => List.unmodifiable(_users);
  Future<void> loadUsers() async {
    final usersResponse = await _apiClient.getUsers();
    _users.addAll(usersResponse);
    notifyListeners();
  }
  void checkProfile(context,String id) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileWidget(id: id),
        ));
  }
}
