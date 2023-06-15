part of 'profile_clubs_screen_bloc.dart';

@immutable
abstract class ProfileClubsScreenEvent {}
class GetClubsProfileEvent extends ProfileClubsScreenEvent{
  final String id;
  GetClubsProfileEvent({
    required this.id
});
}