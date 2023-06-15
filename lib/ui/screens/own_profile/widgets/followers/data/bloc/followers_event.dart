part of 'followers_bloc.dart';

@immutable
abstract class FollowersEvent {}
class GetFollowersEvent extends FollowersEvent{
  final String id;
  GetFollowersEvent({
    required this.id
});
}
