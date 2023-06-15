import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_m/secure_storage/shared_preferences.dart';
import 'package:meta/meta.dart';

import '../../../own_profile/widgets/posts/data/dto/posts_dto.dart';
import '../repo/repo.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final RepoProfile repo;
  ProfileScreenBloc({
    required this.repo
}) : super(ProfileScreenInitial()) {
    on<GetProfileEvent>(_onGetProfileEvent);
    on<FollowProfileEvent>(_onFollowProfile);
  }
  _onGetProfileEvent(GetProfileEvent event,Emitter<ProfileScreenState> emitter) async {
    emit(ProfileScreenLoading());
    final profile = await repo.fetch(event.profileId);
    final followedProfile = await SharedPrefModel().getProfileId();
    var isFollowed = false;
    for(int i = 0; i < profile.followers.length;i++) {
      if(profile.followers[i].followedUser.login == followedProfile) {
        isFollowed = true;
      }
    }
    emit(ProfileScreenLoaded(profile: profile,followedProfile: isFollowed));
  }
  _onFollowProfile(FollowProfileEvent event,Emitter<ProfileScreenState> emitter)async {
    await repo.follow(event.profileId);
    print("followed:${event.profileId}");
  }
}
