import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../followers/data/repo/repo.dart';
import '../../../posts/data/dto/posts_dto.dart';

part 'following_screen_event.dart';
part 'following_screen_state.dart';

class FollowingScreenBloc extends Bloc<FollowingScreenEvent, FollowingScreenState> {
  final RepoFollowers repo;
  FollowingScreenBloc({required this.repo}) : super(FollowingScreenInitial()) {
   on<GetFollowingEvent>(_onGetFollowingEvent);
  }
  _onGetFollowingEvent(GetFollowingEvent event,Emitter<FollowingScreenState> emitter) async{
    emit(FollowingScreenLoadingState());
    final following =await repo.fetchFollowings(event.id);
    emit(FollowingScreenLoadedState(followings: following));
  }
}
