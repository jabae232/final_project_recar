part of 'profile_followers_bloc.dart';

@immutable
abstract class ProfileFollowersState {}

class ProfileFollowersInitial extends ProfileFollowersState {}
class ProfileFollowersLoadingState extends ProfileFollowersState {}
class ProfileFollowersLoadedState extends ProfileFollowersState {
  final List<Follow> followers;
  ProfileFollowersLoadedState({
    required this.followers
  });
}
class ProfileFollowersErrorState extends ProfileFollowersState {}
