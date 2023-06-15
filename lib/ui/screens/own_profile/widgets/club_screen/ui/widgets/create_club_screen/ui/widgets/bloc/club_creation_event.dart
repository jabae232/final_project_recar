part of 'club_creation_bloc.dart';

@immutable
abstract class ClubCreationEvent {}
class CreateClubEvent extends ClubCreationEvent{
  final String name;
  final String description;
  CreateClubEvent({
    required this.name,
    required this.description
});
}