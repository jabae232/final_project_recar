import 'package:bloc/bloc.dart';
import 'package:car_m/ui/screens/event_screen/data/dto/events.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

import '../repo/event_repo.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final RepoEvents repo;
  EventBloc({
    required this.repo
}) : super(EventInitial()) {
   on<GetEvents>(_onGetEvents);
   on<GoEvents>(_onGoEvents);
  }
  _onGetEvents(GetEvents event,Emitter<EventState> emitter)async{
    emit(EventLoadingState());
    final eventsList = await repo.fetchEvents();
    emit(EventLoadedState(eventsList: eventsList));
  }
  _onGoEvents(GoEvents event,Emitter<EventState> emitter) async {
    await repo.attendEvent(event.id);
  }
}
