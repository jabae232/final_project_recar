part of 'profile_screen_bloc.dart';

@immutable
abstract class ProfileScreenEvent {}
class GetProfileEvent extends ProfileScreenEvent{
  final String profileId;
  GetProfileEvent({
    required this.profileId
});
}
class FollowProfileEvent extends ProfileScreenEvent{
  final String profileId;
  FollowProfileEvent({
    required this.profileId
});
}
