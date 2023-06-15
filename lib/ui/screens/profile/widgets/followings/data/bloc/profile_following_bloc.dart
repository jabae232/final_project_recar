import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../own_profile/widgets/followers/data/repo/repo.dart';
import '../../../../../own_profile/widgets/posts/data/dto/posts_dto.dart';


part 'profile_following_event.dart';
part 'profile_following_state.dart';

class ProfileFollowingBloc extends Bloc<ProfileFollowingEvent, ProfileFollowingState> {
  final RepoFollowers repo;
  ProfileFollowingBloc({
    required this.repo
}) : super(ProfileFollowingInitial()) {
   on<GetFollowingsEvent>(_onGetFollowings);
  }
  _onGetFollowings(GetFollowingsEvent event,Emitter<ProfileFollowingState> emitter) async {
    emit(ProfileFollowingLoadingState());
    final followingsList = await repo.fetchFollowings(event.id);
    emit(ProfileFollowingLoadedState(followings: followingsList));
  }
}
