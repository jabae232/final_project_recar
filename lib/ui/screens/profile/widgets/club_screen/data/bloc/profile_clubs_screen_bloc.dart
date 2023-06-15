import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../own_profile/widgets/club_screen/data/repo/repo.dart';
import '../../../../../own_profile/widgets/posts/data/dto/posts_dto.dart';

part 'profile_clubs_screen_event.dart';
part 'profile_clubs_screen_state.dart';

class ProfileClubsScreenBloc extends Bloc<ProfileClubsScreenEvent, ProfileClubsScreenState> {
  final RepoOwnClubs repo;
  ProfileClubsScreenBloc({
    required this.repo
}) : super(ProfileClubsScreenInitial()) {
    on<GetClubsProfileEvent>(_onGetClubsProfileEvent);
  }
  _onGetClubsProfileEvent(GetClubsProfileEvent event, Emitter<ProfileClubsScreenState> emitter) async {
    emit(ProfileClubsScreenLoadingState());
    final clubsList = await repo.fetchClubs(event.id);
    emit(ProfileClubsScreenLoadedState(clubs: clubsList));
  }
}
