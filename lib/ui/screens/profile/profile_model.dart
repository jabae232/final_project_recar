import 'package:car_m/ui/screens/profile/widgets/followers/followers_widget.dart';
import 'package:flutter/material.dart';
import '../../../repository/repo/repo.dart';
import '../own_profile/dto/user.dart';
import '../own_profile/widgets/followings/following.dart';

class ProfileWidgetModel extends ChangeNotifier{
  String? id;
  bool followed = false;
  ProfileWidgetModel({required this.id}) {
    loadUser();
  }
  final _apiClient = RecarRepository();
  User? _user;
  User? get user => _user;
  Future<void> loadUser() async {
    final profile = await _apiClient.getSingleProfile(id ?? '');
    final account = User(
        login: '${profile.user.login}',
        fullName: '${profile.user.fullName}',
        followers: profile.followers.length,
        followings: profile.following.length,
        clubs: profile.clubs.length);
    _user = account;
    notifyListeners();
  }
  void checkFollowers(context,) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FollowersWidgetScreen(id: id!)));
  }
  void checkFollowings(context,) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FollowingScreen(id: id!,)));
  }
  void follow() async{
    final follows = await _apiClient.follow(int.parse(id!));
    followed = true;
    notifyListeners();
  }
}

