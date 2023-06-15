part of 'club_screen_bloc.dart';

@immutable
abstract class ClubScreenEvent {}
class GetClubsEvent extends ClubScreenEvent{}
class ClubSubEvent extends ClubScreenEvent{
  final String id;
  ClubSubEvent({
    required this.id
});
}
