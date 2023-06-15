
import 'dart:convert';

import 'package:car_m/ui/screens/search_page/ui/widgets/clubs/data/dto/clubs.dart';

import '../../../../../../../../api/api.dart';

class RepoClubs{
  final Api api;
  RepoClubs({
    required this.api
});
  Future<List<ClubsDto>> fetch() async {
    final result = await api.dio.get(
      '/club/',
    );
    List<ClubsDto> clubsList = clubsDtoFromJson(
        json.encode(result.data));
    return clubsList;
  }
  Future<void> subscribe(String id) async {
    final result = await api.dio.post(
      '/club/subscribe/$id',
    );
  }
}