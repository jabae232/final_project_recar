part of 'comment_section_bloc.dart';

@immutable
abstract class CommentSectionEvent {}

class GetCommentsEvent extends CommentSectionEvent{
  final int id;
  GetCommentsEvent({required this.id});
}
class PostCommentEvent extends CommentSectionEvent{
  final String content;
  final int id;
  PostCommentEvent({required this.id, required this.content});
}
class CommentReplyEvent extends CommentSectionEvent{
  final String commentId;
  final String reply;
  CommentReplyEvent({
    required this.reply,
    required this.commentId,
});
}