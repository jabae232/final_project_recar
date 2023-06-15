
import 'dart:convert';

import 'package:car_m/ui/screens/own_profile/widgets/posts/data/dto/posts_dto.dart';

import '../../../../../../../api/api.dart';

class RepoFollowers{
  final Api api;
  RepoFollowers({
    required this.api
});
  Future<List<Follow>> fetchFollowers(String id) async {
    final result = await api.dio.get(
      '/profile/$id',
    );
    final profile = profileDtoFromJson(json.encode(result.data));
    return profile.followers;
  }
  Future<List<Follow>> fetchFollowings(String id) async {
    final result = await api.dio.get(
      '/profile/$id',
    );
    final profile = profileDtoFromJson(json.encode(result.data));
    return profile.following;
  }
}