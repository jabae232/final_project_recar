import 'dart:convert';


import 'package:dio/dio.dart';

import '../../../../../../../api/api.dart';
import '../dto/comments.dart';

class RepoComments{
  RepoComments({required this.api});
  final Api api;
  Future<PostCommentsDto> fetch(int id) async {
    final result = await api.dio.get(
      '/post/$id',
    );
    PostCommentsDto listComments = postCommentsDtoFromJson(
        json.encode(result.data));
    return listComments;
  }
  Future<void> post(int id,String content) async {
    var formData = FormData.fromMap({
      "comment": content,
    });
    final result = await api.dio.post(
      '/comment/add/$id',data: formData
    );
  }

  Future<void> reply(String commentId,String reply) async {
    var formData = FormData.fromMap({
      "comment": reply,
    });
    print("REPLYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY WAS DONE::: $reply");
    print("REPLYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY ID::: $commentId");
    final result = await api.dio.post(
        'comment/reply/$commentId',data: formData
    );
  }
}