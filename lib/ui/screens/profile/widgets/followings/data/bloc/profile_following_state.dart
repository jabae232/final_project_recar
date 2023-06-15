part of 'profile_following_bloc.dart';

@immutable
abstract class ProfileFollowingState {}

class ProfileFollowingInitial extends ProfileFollowingState {}
class ProfileFollowingLoadingState extends ProfileFollowingState {}
class ProfileFollowingLoadedState extends ProfileFollowingState {
  final List<Follow> followings;
  ProfileFollowingLoadedState({
    required this.followings
  });
}
class ProfileFollowingErrorState extends ProfileFollowingState {}
