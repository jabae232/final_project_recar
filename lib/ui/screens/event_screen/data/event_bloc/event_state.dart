part of 'event_bloc.dart';

@immutable
abstract class EventState {}

class EventInitial extends EventState {}
class EventLoadingState extends EventState {}
class EventLoadedState extends EventState {
  final List<Events> eventsList;
  EventLoadedState({
    required this.eventsList
});
}
class EventErrorState extends EventState {}
