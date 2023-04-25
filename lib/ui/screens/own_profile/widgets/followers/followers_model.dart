import 'package:flutter/material.dart';
import '../../../../../repository/models/profile/followersPage/follower_followings_list.dart';
import '../../../../../repository/repo/repo.dart';

class FollowersScreenModel extends ChangeNotifier{
  final _apiClient = RecarRepository();
  final _followers = <FollowersFollowings>[];
  List <FollowersFollowings> get followers => List.unmodifiable(_followers);
  final String id;
  FollowersScreenModel({required this.id}) {
    loadFollowers();
  }
  Future<void> loadFollowers() async {
    print("accountId");
    print("${id}");
    final followersResponse = await _apiClient.getFollowers('$id');
    _followers.addAll(followersResponse);
    print("JKKKKKKKKKKKKKKKKK");
    print("${_followers.first.followedUser?.id}");
    notifyListeners();
  }

}

