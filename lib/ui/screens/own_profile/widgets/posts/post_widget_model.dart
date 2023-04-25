import 'dart:async';
import 'package:car_m/repository/models/profile/post/post.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../../repository/repo/repo.dart';
import '../comment_section/comment_section.dart';

class SinglePostWidgetModel extends ChangeNotifier {
  final _apiClient = RecarRepository();
  final _posts = <PostModel>[];
  List <PostModel> get posts => List.unmodifiable(_posts);
  final String id;
  SinglePostWidgetModel({required this.id}) {
    loadPosts();
  }
  Future<void> loadPosts() async {
    final postsResponse = await _apiClient.getPost('$id');
    _posts.addAll(postsResponse);
    notifyListeners();
  }
  Future<void> savePost(String id) async {
    print(id);
    await _apiClient.postSave(id);
  }
/*  void checkComments(int id,int shares,String author,int likes,String date,String content,context) {
    final configuration = CommentConfiguration(postId: id, date: date, content: content, likes: likes, author: author, shares: shares);
    Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => CommentSectionWidget(configuration: configuration,),
    ),
    );
  }*/

}

