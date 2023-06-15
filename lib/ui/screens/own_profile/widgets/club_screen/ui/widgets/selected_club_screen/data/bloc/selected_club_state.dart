part of 'selected_club_bloc.dart';

@immutable
abstract class SelectedClubState {}

class SelectedClubInitial extends SelectedClubState {}
class SelectedClubLoadingState extends SelectedClubState {}
class SelectedClubLoadedState extends SelectedClubState {
  final OwnClubDto club;
  final String username;
  SelectedClubLoadedState({
    required this.club,
    required this.username,
});
}
class SelectedClubErrorState extends SelectedClubState {}
