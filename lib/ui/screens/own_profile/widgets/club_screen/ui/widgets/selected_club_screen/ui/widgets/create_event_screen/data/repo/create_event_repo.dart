

import 'package:dio/dio.dart';

import '../../../../../../../../../../../../../api/api.dart';

class RepoCreateEvent {
  final Api api;
  RepoCreateEvent({required this.api});
  Future<void> createEvent(
      {required String id,
      required double lon,
      required double lat,
      required String description,
      required String name}) async {
    var formData = FormData.fromMap({
      "lat": lat,
      "lang": lon,
      "name": name,
      "description": description,
    });
    final result = await api.dio.post(
      '/events/create/$id',data: formData
    );
    print(result);
  }
}
