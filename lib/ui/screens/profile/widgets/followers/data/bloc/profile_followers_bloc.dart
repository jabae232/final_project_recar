import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../own_profile/widgets/followers/data/repo/repo.dart';
import '../../../../../own_profile/widgets/posts/data/dto/posts_dto.dart';

part 'profile_followers_event.dart';
part 'profile_followers_state.dart';

class ProfileFollowersBloc extends Bloc<ProfileFollowersEvent, ProfileFollowersState> {
  final RepoFollowers repo;
  ProfileFollowersBloc({
    required this.repo
}) : super(ProfileFollowersInitial()) {
    on<GetFollowersEvent>(_onGetFollowers);
  }
  _onGetFollowers(GetFollowersEvent event,Emitter<ProfileFollowersState> state) async{
    emit(ProfileFollowersLoadingState());
    final followers = await repo.fetchFollowers(event.id);
    emit(ProfileFollowersLoadedState(followers: followers));
  }
}
