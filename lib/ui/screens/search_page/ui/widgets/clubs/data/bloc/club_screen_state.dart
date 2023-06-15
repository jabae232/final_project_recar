part of 'club_screen_bloc.dart';

@immutable
abstract class ClubScreenState {}

class ClubScreenInitial extends ClubScreenState {}
class ClubScreenLoadingState extends ClubScreenState {}
class ClubScreenLoadedState extends ClubScreenState {
  final List<ClubsDto> clubsList;
  ClubScreenLoadedState({required this.clubsList});
}
class ClubScreenErrorState extends ClubScreenState {
  final String errorMessage;
  ClubScreenErrorState({
    required this.errorMessage
});
}
