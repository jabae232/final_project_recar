import 'dart:convert';

import 'package:car_m/ui/screens/event_screen/data/dto/events.dart';
import 'package:dio/dio.dart';

import '../../../../../../../../../../../../../api/api.dart';

class RepoEvents {
  final Api api;
  RepoEvents({required this.api});
  Future<List<Events>> fetchEvents() async{
    final result = await api.dio.get(
        '/events/',
    );
    final eventsList = eventsFromJson(json.encode(result.data));
    return eventsList;
  }
  Future<void> attendEvent(String id) async{
    final result = await api.dio.post(
      '/events/assign/$id',
    );
    print(result.data);
  }
}
