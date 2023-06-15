import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/repo/repo.dart';

part 'club_creation_event.dart';
part 'club_creation_state.dart';

class ClubCreationBloc extends Bloc<ClubCreationEvent, ClubCreationState> {
  final RepoOwnClubs repo;
  ClubCreationBloc({required this.repo}) : super(ClubCreationInitial()) {
    on<CreateClubEvent>(_onCreateClub);
  }
  _onCreateClub(CreateClubEvent event,Emitter<ClubCreationState> emitter) async{
    final club = await repo.createClub(event.name, event.description);
    await repo.subscribeClub(club.id.toString());
  }
}
