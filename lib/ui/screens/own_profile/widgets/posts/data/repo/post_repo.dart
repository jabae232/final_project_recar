
import 'dart:convert';

import 'package:car_m/ui/screens/own_profile/widgets/posts/data/dto/posts_dto.dart';

import '../../../../../../../api/api.dart';


class RepoPostsProfile {
  RepoPostsProfile({required this.api});
  final Api api;
  Future<List<Like>> fetchPosts(String id) async {
    final result = await api.dio.get(
      '/profile/$id',
    );
    final profile = profileDtoFromJson(json.encode(result.data));
    return profile.posts;
  }

  Future<List<Like>> fetchSaves(String id) async {
    final result = await api.dio.get(
      '/profile/$id',
    );
    final profile = profileDtoFromJson(json.encode(result.data));
    print(profile.saves.length);
    return profile.saves;
  }
  Future<void> likePost(String id) async {
    final result = await api.dio.post(
      '/post/like/$id',
    );
    print(result.data);
  }

  Future<void> savePost(String id) async {
    final result = await api.dio.post(
      '/post/save/$id',
    );
    print(result.data);
  }
}