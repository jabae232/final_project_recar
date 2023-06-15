import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repo/create_event_repo.dart';

part 'create_event_screen_event.dart';
part 'create_event_screen_state.dart';

class CreateEventScreenBloc
    extends Bloc<CreateEventScreenEvent, CreateEventScreenState> {
  final RepoCreateEvent repo;
  CreateEventScreenBloc({required this.repo})
      : super(CreateEventScreenInitial()) {
    on<CreateEventEvent>(_onCreateEvent);
  }
  _onCreateEvent(
      CreateEventEvent event, Emitter<CreateEventScreenState> emitter) async {
    emit(CreateEventLoadingState());
    await repo.createEvent(
        id: event.id,
        lon: event.longitude,
        lat: event.latitude,
        description: event.description,
        name: event.name);
  }
}
