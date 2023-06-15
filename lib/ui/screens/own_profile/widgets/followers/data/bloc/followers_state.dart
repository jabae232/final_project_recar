part of 'followers_bloc.dart';

@immutable
abstract class FollowersState {}

class FollowersInitial extends FollowersState {}
class FollowersLoadingState extends FollowersState {}
class FollowersLoadedState extends FollowersState {
  final List<Follow> followers;
  FollowersLoadedState({
    required this.followers
});
}
class FollowersErrorState extends FollowersState {}
