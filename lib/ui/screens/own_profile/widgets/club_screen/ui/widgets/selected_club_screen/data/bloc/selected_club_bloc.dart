import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_m/secure_storage/shared_preferences.dart';
import 'package:meta/meta.dart';

import '../dto/selected_club_dto.dart';
import '../repo/club_repo.dart';

part 'selected_club_event.dart';
part 'selected_club_state.dart';

class SelectedClubBloc extends Bloc<SelectedClubEvent, SelectedClubState> {
  final RepoSelectedClub repo;
  SelectedClubBloc({
    required this.repo
}) : super(SelectedClubInitial()) {
    on<GetSelectedClubEvent>(_onGetClubEvent);
  }
  _onGetClubEvent(GetSelectedClubEvent event,Emitter<SelectedClubState> emitter) async {
    emit(SelectedClubLoadingState());
    final club = await repo.fetchClub(event.id);
    final username = await SharedPrefModel().getProfileId();
    emit(SelectedClubLoadedState(club: club,username: username));
  }
}
