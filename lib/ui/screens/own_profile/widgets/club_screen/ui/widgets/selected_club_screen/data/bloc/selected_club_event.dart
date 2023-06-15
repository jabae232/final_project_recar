part of 'selected_club_bloc.dart';

@immutable
abstract class SelectedClubEvent {}
class GetSelectedClubEvent extends SelectedClubEvent{
  final String id;
  GetSelectedClubEvent({
    required this.id
});
}
