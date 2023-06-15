import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../own_profile/widgets/comment_section/data/dto/comments.dart';
import '../../../../own_profile/widgets/comment_section/data/repo/comment_section_repo.dart';
part 'comment_section_profile_event.dart';
part 'comment_section_profile_state.dart';

class CommentSectionProfileBloc extends Bloc<CommentSectionProfileEvent, CommentSectionProfileState> {
  final RepoComments repo;
  CommentSectionProfileBloc({required this.repo}) : super(CommentSectionProfileInitial()) {
    on<GetCommentsEvent>(_onGetComments);
    on<PostCommentEvent>(_onPostComment);
    on<CommentReplyEvent>(_onCommentReply);
  }
  _onGetComments(GetCommentsEvent event,Emitter<CommentSectionProfileState> emitter) async{
    emit(CommentSectionLoadingState());
    final postComments = await repo.fetch(event.id);
    print(postComments.id);
    try{
      print(postComments.postComments.length);
      emit(CommentSectionLoadedState(commentsDto: postComments));
    } catch(e){
      emit(CommentSectionErrorState(errorMessage:'${e}'));
    }
  }
  _onPostComment(PostCommentEvent event,Emitter<CommentSectionProfileState> emitter) async {
    try{
      print(event.content);
      if(event.content.trim().isNotEmpty) {
        await repo.post(event.id, event.content);
      }
    } catch(e){
      emit(CommentSectionErrorState(errorMessage:'${e}'));
    }
  }
  _onCommentReply(CommentReplyEvent event,Emitter<CommentSectionProfileState> emitter) async {
    try{
      if(event.reply.trim().isNotEmpty) {
        await repo.reply(event.commentId,event.reply);
      }
    } catch(e){
      emit(CommentSectionErrorState(errorMessage:'${e}'));
    }
  }
}