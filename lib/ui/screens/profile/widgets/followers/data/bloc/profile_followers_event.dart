part of 'profile_followers_bloc.dart';

@immutable
abstract class ProfileFollowersEvent {}
class GetFollowersEvent extends ProfileFollowersEvent{
  final String id;
  GetFollowersEvent({required this.id});
}