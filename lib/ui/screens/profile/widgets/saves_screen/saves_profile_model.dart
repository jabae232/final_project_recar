import 'package:flutter/material.dart';

import '../../../../../repository/models/profile/post/post.dart';
import '../../../../../repository/repo/repo.dart';


class SavesScreenProfileModel extends ChangeNotifier{
  final _apiClient = RecarRepository();
  final _saves = <PostModel>[];
  List <PostModel> get saves => List.unmodifiable(_saves);
  final String id;
  SavesScreenProfileModel({required this.id}) {
    loadPosts();
  }
  Future<void> loadPosts() async {
    final postsResponse = await _apiClient.getSaves('$id');
    _saves.addAll(postsResponse);
    notifyListeners();
  }
}

