import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_m/ui/screens/own_profile/widgets/posts/data/dto/posts_dto.dart';
import 'package:meta/meta.dart';

import '../repo/repo.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  final RepoFollowers repo;
  FollowersBloc({
    required this.repo
}) : super(FollowersInitial()) {
    on<GetFollowersEvent>(_onGetFollowers);
  }
  _onGetFollowers(GetFollowersEvent event,Emitter<FollowersState> state) async{
    emit(FollowersLoadingState());
    final followers = await repo.fetchFollowers(event.id);
    emit(FollowersLoadedState(followers: followers));
  }
}
