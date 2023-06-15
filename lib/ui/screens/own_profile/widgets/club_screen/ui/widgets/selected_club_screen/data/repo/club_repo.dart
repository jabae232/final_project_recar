
import 'dart:convert';

import 'package:car_m/ui/screens/search_page/ui/widgets/clubs/data/dto/clubs.dart';

import '../../../../../../../../../../api/api.dart';
import '../dto/selected_club_dto.dart';


class RepoSelectedClub{
  final Api api;
  RepoSelectedClub({
    required this.api
  });
  Future<OwnClubDto> fetchClub(String id) async {
    final result = await api.dio.get(
      '/club/$id',
    );
    final OwnClubDto club = ownClubDtoFromJson(
        json.encode(result.data));
    return club;
  }
}