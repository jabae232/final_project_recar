part of 'profile_following_bloc.dart';

@immutable
abstract class ProfileFollowingEvent {}
class GetFollowingsEvent extends ProfileFollowingEvent{
  final String id;
  GetFollowingsEvent({
    required this.id
});
}
