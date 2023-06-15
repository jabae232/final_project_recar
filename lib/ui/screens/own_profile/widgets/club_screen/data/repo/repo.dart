
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../../../api/api.dart';
import '../../../posts/data/dto/posts_dto.dart';
import '../../ui/widgets/selected_club_screen/data/dto/selected_club_dto.dart';

class RepoOwnClubs {
  final Api api;
  RepoOwnClubs({
    required this.api
  });
  Future<List<Club>> fetchClubs(String id) async{
    final result = await api.dio.get(
      '/profile/$id',
    );
    final profile = profileDtoFromJson(json.encode(result.data));
    return profile.clubs;
  }
  Future<OwnClubDto> createClub(String clubName,String description) async{
    var formData = FormData.fromMap({
      "name": clubName,
      "description":description
    });
    final result = await api.dio.post(
      '/club/create',data: formData
    );
    print('$result');
    final OwnClubDto club = ownClubDtoFromJson(json.encode(result.data));
    return club;
  }
  Future<void> subscribeClub(String id) async{
    final result = await api.dio.post(
        '/club/subscribe/$id',
    );
    print('$result');
  }
}