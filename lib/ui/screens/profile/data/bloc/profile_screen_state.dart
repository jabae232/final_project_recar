part of 'profile_screen_bloc.dart';

@immutable
abstract class ProfileScreenState {}

class ProfileScreenInitial extends ProfileScreenState {}
class ProfileScreenLoading extends ProfileScreenState {}
class ProfileScreenLoaded extends ProfileScreenState {
  final ProfileDto profile;
  final bool followedProfile;
  ProfileScreenLoaded({
    required this.profile,
    required this.followedProfile
});
}
class ProfileScreenError extends ProfileScreenState {}
