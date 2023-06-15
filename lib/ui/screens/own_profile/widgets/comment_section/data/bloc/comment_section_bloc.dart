import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../dto/comments.dart';
import '../repo/comment_section_repo.dart';

part 'comment_section_event.dart';
part 'comment_section_state.dart';

class CommentSectionBloc extends Bloc<CommentSectionEvent, CommentSectionState> {
  final RepoComments repo;
  CommentSectionBloc({required this.repo}) : super(CommentSectionInitial()) {
    on<GetCommentsEvent>(_onGetComments);
    on<PostCommentEvent>(_onPostComment);
    on<CommentReplyEvent>(_onCommentReply);
  }
  _onGetComments(GetCommentsEvent event,Emitter<CommentSectionState> emitter) async{
    emit(CommentSectionLoadingState());
    final postComments = await repo.fetch(event.id);
    print(postComments.id);
    try{
      emit(CommentSectionLoadedState(commentsDto: postComments));
    } catch(e){
      emit(CommentSectionErrorState(errorMessage:'${e}'));
    }
  }
  _onPostComment(PostCommentEvent event,Emitter<CommentSectionState> emitter) async {
    try{
      print(event.content);
      if(event.content.trim().isNotEmpty) {
        await repo.post(event.id, event.content);
      }
    } catch(e){
    emit(CommentSectionErrorState(errorMessage:'${e}'));
    }
  }
  _onCommentReply(CommentReplyEvent event,Emitter<CommentSectionState> emitter) async {
    print("${event.commentId}: commentId");
    try{
      if(event.reply.trim().isNotEmpty) {
        await repo.reply(event.commentId,event.reply);
      }
    } catch(e){
      emit(CommentSectionErrorState(errorMessage:'${e}'));
    }
  }
}
