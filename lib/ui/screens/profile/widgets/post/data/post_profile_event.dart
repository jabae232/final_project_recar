part of 'post_profile_bloc.dart';

@immutable
abstract class PostProfileEvent {}
class GetPostsProfileEvent extends PostProfileEvent{
  final String id;
  GetPostsProfileEvent({
    required this.id
});
}
class SavePostsProfileEvent extends PostProfileEvent{
  final String id;
  SavePostsProfileEvent({
    required this.id
  });
}