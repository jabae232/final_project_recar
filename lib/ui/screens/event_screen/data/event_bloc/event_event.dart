part of 'event_bloc.dart';

@immutable
abstract class EventEvent {}
class GetEvents extends EventEvent{}
class GoEvents extends EventEvent{
  final String id;
  GoEvents({
    required this.id
});
}
