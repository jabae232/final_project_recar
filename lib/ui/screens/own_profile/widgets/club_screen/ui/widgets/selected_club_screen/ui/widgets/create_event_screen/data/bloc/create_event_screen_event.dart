part of 'create_event_screen_bloc.dart';

@immutable
abstract class CreateEventScreenEvent {}
class CreateEventEvent extends CreateEventScreenEvent{
  final double latitude;
  final double longitude;
  final String description;
  final String name;
  final String id;
  CreateEventEvent({
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.name,
    required this.id,
});
}
