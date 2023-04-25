import 'package:flutter/material.dart';
import '../../../../../repository/models/profile/followersPage/follower_followings_list.dart';
import '../../../../../repository/repo/repo.dart';


class FollowingScreenModel extends ChangeNotifier{
  final _apiClient = RecarRepository();
  final _followings = <FollowersFollowings>[];
  List <FollowersFollowings> get followings => List.unmodifiable(_followings);
  final String id;
  FollowingScreenModel({required this.id}) {
    loadFollowers();
  }
  Future<void> loadFollowers() async {
    final followersResponse = await _apiClient.getFollowings('$id');
    print(followersResponse);
    _followings.addAll(followersResponse);
    print(_followings.length);
    notifyListeners();
  }
}