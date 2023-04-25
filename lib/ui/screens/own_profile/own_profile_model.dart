import 'package:car_m/repository/repo/repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/edit_profile/edit_profile.dart';
import 'package:car_m/ui/screens/own_profile/widgets/followers/followers.dart';
import 'package:car_m/ui/screens/own_profile/widgets/followings/following.dart';
import 'package:flutter/material.dart';
import 'dto/user.dart';

class ProfileWidgetModel extends ChangeNotifier {
  final _apiClient = RecarRepository();
  ProfileWidgetModel() {
    loadUser();
  }

  final String zeus = '';
  User? _user;
  User? get user => _user;
  Future<void> loadUser() async {
    final profile = await _apiClient.getProfile();
    final id = profile.user.id.toString();
    final account = User(
        login: '${profile.user.login}',
        fullName: '${profile.user.fullName}',
        followers: profile.followers.length,
        followings: profile.following.length,
        clubs: profile.clubs.length);
    _user = account;
    notifyListeners();
  }

  void checkFollowers(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowersScreen(id: '',)));
  }
  void checkFollowings(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowingScreen(id: '',)));
  }
  void editProfile(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen()));
  }
}
