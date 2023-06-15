
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../api/api.dart';
import '../../../own_profile/widgets/posts/data/dto/posts_dto.dart';

class RepoProfile{
  final Api api;
  RepoProfile({
    required this.api,
  });
  Future<ProfileDto> fetch(String id) async {
    final result = await api.dio.get(
      '/profile/$id',
    );
    final profile = profileDtoFromJson(json.encode(result.data));
    return profile;
  }

  Future<void> follow(String id) async {
    var formData = FormData.fromMap({
      "userId": id,
    });
    try {
      await api.dio.post('/user/follow/',
          data: formData,);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}