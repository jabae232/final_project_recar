part of 'following_screen_bloc.dart';

@immutable
abstract class FollowingScreenState {}

class FollowingScreenInitial extends FollowingScreenState {}
class FollowingScreenLoadingState extends FollowingScreenState {}
class FollowingScreenLoadedState extends FollowingScreenState {
  final List<Follow> followings;
  FollowingScreenLoadedState({
    required this.followings
  });
}
class FollowingScreenErrorState extends FollowingScreenState {}
