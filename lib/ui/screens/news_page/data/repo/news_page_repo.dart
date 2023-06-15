
import 'dart:convert';

import '../../../../../api/api.dart';
import '../dto/all_posts_dto.dart';

class RepoNewsScreen {
  final Api api;
  RepoNewsScreen({
    required this.api
});
  Future<List<AllPostsDto>> fetch() async{
    final response = await api.dio.get('/post/');
    final postList = allPostsDtoFromJson(jsonEncode(response.data));
    return postList;
  }
}