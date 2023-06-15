part of 'own_clubs_screen_bloc.dart';

@immutable
abstract class OwnClubsScreenState {}

class OwnClubsScreenInitial extends OwnClubsScreenState {}
class OwnClubsScreenLoading extends OwnClubsScreenState {}
class OwnClubsScreenLoaded extends OwnClubsScreenState {
  final List<Club> clubs;
  OwnClubsScreenLoaded({
    required this.clubs
});
}
class OwnClubsScreenError extends OwnClubsScreenState {
  final String errorMessage;
  OwnClubsScreenError({
    required this.errorMessage
});
}
