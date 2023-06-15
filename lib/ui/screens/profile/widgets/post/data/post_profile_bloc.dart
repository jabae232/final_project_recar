import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../own_profile/widgets/posts/data/dto/posts_dto.dart';
import '../../../../own_profile/widgets/posts/data/repo/post_repo.dart';

part 'post_profile_event.dart';
part 'post_profile_state.dart';

class PostProfileBloc extends Bloc<PostProfileEvent, PostProfileState> {
  final RepoPostsProfile repo;
  PostProfileBloc({required this.repo}) : super(PostProfileInitial()) {
   on<GetPostsProfileEvent>(_onGetPosts);
   on<SavePostsProfileEvent>(_onSavePost);
  }
  _onGetPosts(GetPostsProfileEvent event,Emitter<PostProfileState> emitter) async{
    emit(PostProfileLoadingState());
    final postsList = await repo.fetchPosts(event.id);
    emit(PostProfileLoadedState(postList: postsList));
  }
  _onSavePost(SavePostsProfileEvent event,Emitter<PostProfileState> emitter) async{
    await repo.savePost(event.id);
  }
}
