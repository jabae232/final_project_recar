part of 'profile_clubs_screen_bloc.dart';

@immutable
abstract class ProfileClubsScreenState {}

class ProfileClubsScreenInitial extends ProfileClubsScreenState {}
class ProfileClubsScreenLoadingState extends ProfileClubsScreenState {}
class ProfileClubsScreenLoadedState extends ProfileClubsScreenState {
  final List<Club> clubs;
  ProfileClubsScreenLoadedState({
    required this.clubs
  });
}
class ProfileClubsScreenErrorState extends ProfileClubsScreenState {
  final String errorMessage;
  ProfileClubsScreenErrorState({
    required this.errorMessage
});
}
