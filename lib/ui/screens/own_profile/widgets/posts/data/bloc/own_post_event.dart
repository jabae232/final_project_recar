part of 'own_post_bloc.dart';

@immutable
abstract class OwnPostEvent {}
class GetPostsEvent extends OwnPostEvent{}
class LikePostEvent extends OwnPostEvent{
  final String postId;
  LikePostEvent({
    required this.postId
});
}
class SavePostEvent extends OwnPostEvent{
  final String postId;
  SavePostEvent({
    required this.postId
});
}
