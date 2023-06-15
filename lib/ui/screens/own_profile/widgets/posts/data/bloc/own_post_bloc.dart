import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../dto/posts_dto.dart';
import '../repo/post_repo.dart';

part 'own_post_event.dart';
part 'own_post_state.dart';

class OwnPostBloc extends Bloc<OwnPostEvent, OwnPostState> {
  final RepoPostsProfile repo;
  OwnPostBloc({required this.repo}) : super(OwnPostInitial()) {
    on<GetPostsEvent>(_onGetPost);
    on<LikePostEvent>(_onLikePost);
    on<SavePostEvent>(_onSavePost);
  }
  _onGetPost(GetPostsEvent event,Emitter<OwnPostState> emitter)async{
    emit(OwnPostLoadingState());
    try{
      final postList = await repo.fetchPosts('');
      emit(OwnPostLoadedState(postList: postList));
    }
    catch(e){
      emit(OwnPostErrorState(errorMessage:'Nothing to see here'));
    }
  }
  _onLikePost(LikePostEvent event,Emitter<OwnPostState> emitter)async{
    try{
      await repo.likePost(event.postId);
    }
    catch(e){
      emit(OwnPostErrorState(errorMessage:'Nothing to see here'));
    }
  }
  _onSavePost(SavePostEvent event,Emitter<OwnPostState> emitter)async{
    await repo.savePost(event.postId);
  }
}
