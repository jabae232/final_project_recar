
import 'dart:convert';

import 'package:car_m/ui/screens/own_profile/widgets/posts/data/dto/posts_dto.dart';

import '../../../../../api/api.dart';

class RepoOwnProfile {
  final Api api;
  RepoOwnProfile({
    required this.api
});
  Future<ProfileDto> fetch() async {
    print('here');
    final result = await api.dio.get(
      '/profile/',
    );
    print('${result.data}');
    final profile = profileDtoFromJson(json.encode(result.data));
    return profile;
  }
}