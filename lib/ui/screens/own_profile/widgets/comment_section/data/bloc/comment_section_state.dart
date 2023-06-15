part of 'comment_section_bloc.dart';

@immutable
abstract class CommentSectionState {}

class CommentSectionInitial extends CommentSectionState {}
class CommentSectionLoadingState extends CommentSectionState {}
class CommentSectionLoadedState extends CommentSectionState {
  final PostCommentsDto commentsDto;
  CommentSectionLoadedState({
    required this.commentsDto,
  });
}
class CommentSectionErrorState extends CommentSectionState {
  final String errorMessage;
  CommentSectionErrorState({
    required this.errorMessage
  });
}