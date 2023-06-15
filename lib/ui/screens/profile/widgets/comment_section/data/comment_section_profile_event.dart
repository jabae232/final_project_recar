part of 'comment_section_profile_bloc.dart';

@immutable
abstract class CommentSectionProfileEvent {}
class GetCommentsEvent extends CommentSectionProfileEvent{
  final int id;
  GetCommentsEvent({required this.id});
}
class PostCommentEvent extends CommentSectionProfileEvent{
  final String content;
  final int id;
  PostCommentEvent({required this.id, required this.content});
}
class CommentReplyEvent extends CommentSectionProfileEvent{
  final String commentId;
  final String reply;
  CommentReplyEvent({
    required this.reply,
    required this.commentId,
  });
}