import 'package:car_m/repository/models/profile/followers.dart';
import 'package:flutter/material.dart';
import '../../../../../repository/repo/repo.dart';

class FollowersWidgetScreenModel extends ChangeNotifier{
  final _apiClient = RecarRepository();
  final _followers = <FollowersModel>[];
  List <FollowersModel> get followers => List.unmodifiable(_followers);
  final String id;
  FollowersWidgetScreenModel({required this.id}) {
    loadFollowers();
  }
  Future<void> loadFollowers() async {
    final followersResponse = await _apiClient.getProfileFollowers('$id');
    _followers.addAll(followersResponse);
    notifyListeners();
  }

}

