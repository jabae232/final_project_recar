part of 'comment_section_profile_bloc.dart';

@immutable
abstract class CommentSectionProfileState {}

class CommentSectionProfileInitial extends CommentSectionProfileState {}

class CommentSectionLoadingState extends CommentSectionProfileState {}
class CommentSectionLoadedState extends CommentSectionProfileState {
  final PostCommentsDto commentsDto;
  CommentSectionLoadedState({
    required this.commentsDto,
  });
}
class CommentSectionErrorState extends CommentSectionProfileState {
  final String errorMessage;
  CommentSectionErrorState({
    required this.errorMessage
  });
}