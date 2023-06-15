part of 'following_screen_bloc.dart';

@immutable
abstract class FollowingScreenEvent {}
class GetFollowingEvent extends FollowingScreenEvent{
  final String id;
  GetFollowingEvent({
    required this.id
});
}